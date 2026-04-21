# Database Design Patterns Reference

## Common Design Patterns to Detect

### Soft Delete Pattern
```sql
-- Good: timestamp-based (preserves deletion audit trail)
deleted_at TIMESTAMP NULL DEFAULT NULL

-- Less good: boolean (no audit trail)
is_deleted BOOLEAN DEFAULT FALSE
is_active BOOLEAN DEFAULT TRUE
```
**Implication:** Queries must always include `WHERE deleted_at IS NULL`
**Risk:** Easy to forget; can cause data leaks if omitted

---

### Audit Timestamp Pattern
```sql
created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
```
Present on all tables? Note if any are missing.

---

### Status Machine Pattern
```sql
-- Anti-pattern: magic integer
status INT DEFAULT 0  -- what does 0 mean??

-- Better: string enum
status VARCHAR(20) DEFAULT 'pending'
  CHECK (status IN ('pending', 'active', 'suspended', 'cancelled'))

-- Best (PostgreSQL): named enum type
CREATE TYPE user_status AS ENUM ('pending', 'active', 'suspended', 'cancelled');
status user_status DEFAULT 'pending'
```

---

### Polymorphic Association
```sql
-- The pattern
commentable_type VARCHAR(50),  -- 'Post', 'Video', 'Product'
commentable_id INT

-- Problem: no foreign key constraint possible; no referential integrity
-- Better alternatives: separate junction tables or JSON column
```

---

### Multi-Tenancy Patterns
```sql
-- Shared table (most common)
tenant_id INT NOT NULL REFERENCES tenants(id)
-- Risk: must add to every query; index is critical

-- Row-level security (PostgreSQL)
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
-- Better isolation, requires PG expertise
```

---

### Hierarchical/Tree Data
```sql
-- Adjacency list (simple, common)
parent_id INT REFERENCES categories(id)
-- Problem: expensive recursive queries to get full tree

-- Nested sets (fast reads, slow writes)
lft INT, rgt INT
-- Good for mostly-static trees

-- Closure table (best for mixed read/write)
CREATE TABLE category_paths (
  ancestor_id INT, descendant_id INT, depth INT
)

-- ltree (PostgreSQL only, excellent)
path ltree  -- e.g. '1.3.7.12'
```

---

### UUID vs Auto-Increment

| Aspect | UUID | Auto-Increment |
|---|---|---|
| Globally unique | Yes | No (only within table) |
| Index performance | Poor (random inserts fragment B-tree) | Excellent (sequential) |
| Enumerable/guessable | No (security advantage) | Yes |
| JOIN performance | Worse (larger key) | Better |
| Best for | Distributed systems, public IDs | Single-DB, high write throughput |

**Mixed use detected?** Note it as potential inconsistency.

---

## Index Patterns to Detect

### Missing FK Indexes (Critical)
Every foreign key column should have an index unless:
- The table is very small (< 1000 rows, rarely queried)
- The FK is part of a composite primary key

```sql
-- Red flag: FK with no index
ALTER TABLE orders ADD COLUMN user_id INT REFERENCES users(id);
-- Missing: CREATE INDEX idx_orders_user_id ON orders(user_id);
```

### Covering Index Opportunities
If a query pattern selects only a few columns from a wide table:
```sql
-- Query: SELECT id, status, created_at FROM orders WHERE user_id = ?
-- Covering index:
CREATE INDEX idx_orders_user_status_date ON orders(user_id, status, created_at);
```

### Partial Index (PostgreSQL)
```sql
-- Index only active orders — much smaller, much faster
CREATE INDEX idx_active_orders ON orders(user_id) WHERE status = 'active';
```

---

## Naming Convention Patterns

Detect and note inconsistencies:

| Convention | Example | Common in |
|---|---|---|
| snake_case | `user_id`, `created_at` | PostgreSQL, Python/Django, Rails |
| camelCase | `userId`, `createdAt` | JS ORMs (Sequelize, TypeORM) |
| PascalCase | `UserId`, `CreatedAt` | Some .NET ORMs |
| Mixed | `userId` + `user_id` in same schema | Red flag — inconsistent |

---

## Common ORM-Specific Patterns

### Rails (ActiveRecord)
- `id` integer primary key (convention)
- `created_at`, `updated_at` auto-managed
- `[table]_id` foreign key convention
- `[entity]able_type` + `[entity]able_id` = polymorphic
- STI (Single Table Inheritance): `type` column on a table

### Django
- `id` auto-created unless overridden
- `_id` suffix on FK columns (stores the ID; `user` is the ORM accessor)
- `created`, `modified` common convention
- ContentTypes framework = polymorphic (content_type_id + object_id)

### Prisma
- `@id` marks primary key
- `@relation` defines FK
- `@default(now())`, `@updatedAt` for timestamps
- `@@index([])` for composite indexes

### SQLAlchemy
- `Column(Integer, primary_key=True)`
- `ForeignKey('table.column')` notation
- Relationship backref/back_populates for ORM relations

---

## Performance Anti-Patterns

### N+1 Query Pattern (Most Common Bug)
```
-- For each order, a separate query fires for the user:
SELECT * FROM orders;  -- returns 100 orders
-- Then 100 separate queries:
SELECT * FROM users WHERE id = 1;
SELECT * FROM users WHERE id = 2;
...
```
**Detection:** FK column without index; ORM lazy loading on 1-to-many

### Unbounded Query Pattern
```sql
-- No LIMIT — will return entire table as data grows
SELECT * FROM audit_logs WHERE user_id = ?;
-- Fix: paginate; add LIMIT/OFFSET or cursor-based pagination
```

### OFFSET Pagination at Scale
```sql
-- Gets slow at large offsets (scans all skipped rows)
SELECT * FROM posts ORDER BY created_at DESC LIMIT 20 OFFSET 10000;
-- Better: cursor-based pagination
SELECT * FROM posts WHERE created_at < ? ORDER BY created_at DESC LIMIT 20;
```

### SELECT * in Production Code
Fetches all columns even if only 2 are needed. Signs of this pattern in schema:
- Wide tables (15+ columns) with indexes suggesting partial access patterns
- Large TEXT/BLOB columns alongside small lookup columns
