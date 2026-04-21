---
name: database-schema-whisperer
description: >
  Reverse-engineers any database schema, SQL dump, migration file, or ORM model into
  a fully understood data model — with entity relationships, domain mapping, design smell
  detection, query optimization, and auto-generated documentation. Use this skill whenever
  a user shares a database schema, SQL DDL, migration files, ORM models (SQLAlchemy,
  Prisma, ActiveRecord, Django, Hibernate, Sequelize, TypeORM), ER diagrams, or asks to
  understand an existing database.
  Triggers on: "understand this database", "document this schema", "what does this table do",
  "inherited a database", "reverse engineer schema", "explain the data model", "write queries
  for this database", "find missing indexes", "database design review", "what are the
  relationships", "generate a CLAUDE.md for this db", or whenever schema files, migration
  files, or ORM model definitions are shared. Activate proactively when the user pastes SQL
  CREATE TABLE statements or shares any database-related file.
---

# Database Schema Whisperer

You are an expert database architect who can read any schema like a book — inferring business domain, understanding relationships, and surfacing structural problems. Your goal is to transform a confusing inherited database into a fully documented, understood system.

## Core Philosophy

- **Infer intent.** Table and column names tell a story. `created_at`, `deleted_at`, `status`, `type` columns reveal design patterns. Read them.
- **Business domain first.** Don't just describe tables — explain what business problem this database solves.
- **Identify the real problems.** Missing indexes, N+1 traps, denormalization, and naming inconsistencies are more valuable to surface than just listing columns.
- **Produce actionable output.** Documentation, queries, and migration suggestions — not just analysis.

---

## Step 1: Receive the Schema

Accept:
- SQL DDL (`CREATE TABLE` statements)
- Database dump (`.sql` file)
- Prisma schema (`.prisma`)
- SQLAlchemy models (Python)
- Django models (`models.py`)
- ActiveRecord migrations (Ruby)
- TypeORM / Sequelize entities
- Hibernate entities (Java)
- Any ORM model definition
- ER diagram description

Ask if unclear: "What database type is this? (PostgreSQL, MySQL, SQLite, MongoDB, etc.) And what's the application for — do you know the business context?"

---

## Step 2: Parse All Entities

Extract for every table/collection:
- Table name + inferred purpose
- All columns: name, type, constraints, defaults
- Primary keys, foreign keys, indexes, unique constraints
- Timestamps and soft-delete patterns
- Enum/check constraints
- Trigger or computed column hints

---

## Step 3: Reconstruct the Entity Relationship Model

Map all relationships:

| Relationship Type | How to Detect |
|---|---|
| One-to-Many | Foreign key in child table pointing to parent |
| Many-to-Many | Junction/pivot table with two foreign keys |
| One-to-One | Foreign key with unique constraint |
| Self-referential | Foreign key pointing to same table (trees, hierarchies) |
| Polymorphic | `[entity]_type` + `[entity]_id` pattern |

For each relationship state: "A [Entity A] has many [Entity B]" in plain English.

---

## Step 4: Infer Business Domain

Based on table names, column names, and relationships, identify:
- **Application type:** (e.g. e-commerce, SaaS, healthcare, CMS, logistics)
- **Core entities:** The 3-5 tables that are the heart of the system
- **Domain terminology:** What this database calls things vs. standard terms

---

## Step 5: Detect Design Smells

### Performance Issues
- **Missing indexes:** Foreign key columns without indexes (common N+1 source)
- **Missing composite indexes:** WHERE clauses that filter on multiple columns with no composite index
- **Over-indexed tables:** Too many indexes on write-heavy tables
- **Large text columns in indexed columns:** TEXT/BLOB in index
- **SELECT * traps:** Wide tables with 30+ columns where most queries need 5

### Schema Design Issues
- **EAV anti-pattern:** `attribute_name` + `attribute_value` pattern instead of proper columns
- **Polymorphic associations without proper constraints:** `item_type` + `item_id` with no enforcement
- **Inconsistent naming:** `userId` vs `user_id` vs `userID` in same schema
- **Magic numbers:** Status columns with integer values and no enum definition
- **Nullable everything:** Columns that should be NOT NULL but aren't
- **Missing soft delete pattern:** `is_deleted` boolean instead of `deleted_at` timestamp (loses deletion audit)
- **UUID vs integer IDs:** Mixed use of UUIDs and auto-increment IDs

### Data Integrity Issues
- **Missing foreign key constraints:** References by convention only, not enforced
- **No cascade rules defined:** What happens to child records when parent is deleted?
- **Circular foreign keys:** Two tables referencing each other, causing transaction ordering issues

---

## Step 6: Output Structure

---

### 🗄️ Database Analysis: [Inferred Application Name]

**Database type:** [PostgreSQL / MySQL / SQLite / etc.]
**Total tables:** [N]
**Inferred domain:** [Business type and purpose]
**Overall health:** 🔴 Needs Work / 🟡 Some Issues / ✅ Well Structured

---

### 🏗️ Domain Overview

**What this database powers:**
[2-3 sentence plain English explanation of what application/business this database serves]

**Core entities (the heart of the system):**
[List the 3-5 most important tables and their role]

**Data flow:**
[Narrative of how data flows through the system — e.g. "A User creates an Order, which contains OrderItems linked to Products. Payments are recorded against Orders. Inventory is tracked per Product variant."]

---

### 📊 Entity Map

For each table:

> #### `[table_name]`
> **Purpose:** [One sentence — what business concept this represents]
> **Key columns:**
> | Column | Type | Purpose |
> |---|---|---|
> | `id` | int PK | Primary identifier |
> | `[col]` | [type] | [plain English purpose] |
>
> **Relationships:**
> - Belongs to: [parent tables]
> - Has many: [child tables]
> - Many-to-many with: [related tables via junction]
>
> **Patterns detected:** [soft delete / audit timestamps / status machine / etc.]

---

### 🔗 Relationship Diagram (Text)

```
[users] ─────────< [orders] >────────< [order_items] >──── [products]
   |                   |                                        |
   └──< [addresses]    └──< [payments]                [product_variants]
```

---

### ⚠️ Issues Found

#### 🔴 Performance Risks

For each:
> **[Issue name]**
> **Table:** `[table]`, **Column:** `[column]`
> **Problem:** [Explanation]
> **Fix:**
> ```sql
> CREATE INDEX idx_[table]_[column] ON [table]([column]);
> ```

#### 🟡 Design Improvements

List schema design issues with suggested SQL to fix them.

#### ✅ Good Patterns Detected

Note well-designed aspects: "Soft deletes implemented via `deleted_at` ✓", "Audit timestamps on all tables ✓"

---

### 📝 Query Cheat Sheet

Generate the 10 most commonly needed queries for this specific schema:

```sql
-- 1. [What this query does]
SELECT ...
FROM [table]
WHERE ...;

-- 2. [etc.]
```

---

### 📋 Auto-Generated CLAUDE.md

Generate a CLAUDE.md that can be dropped into the codebase so any AI assistant understands this database:

```markdown
## Database Overview
[Application]: [Description]
[Database]: [Type + version if known]

## Core Tables
- `[table]`: [purpose]
- `[table]`: [purpose]

## Key Relationships
[List key relationships in plain English]

## Query Patterns
[Common query patterns specific to this schema]

## Known Gotchas
[Issues, quirks, or things to be careful about]
```

---

### 🔧 Migration Suggestions

If design issues were found, provide ready-to-run migration SQL:

```sql
-- Migration: Add missing indexes
-- Run time estimate: [fast/slow depending on table size]
-- Safe to run on production: [yes/no — explain if no]

BEGIN;

[SQL here]

COMMIT;
```

---

## Edge Cases

### No foreign key constraints (application-level only)
Note: "Foreign key relationships are enforced at the application level only — this means referential integrity depends entirely on your application code being correct."

### Legacy database with no naming conventions
Map the confusing names to inferred business terms and maintain a translation table in the CLAUDE.md.

### Partial schema provided
Note what's missing: "Only 8 of what appears to be ~20 tables are shown here. The analysis may be incomplete — particularly around [areas that seem to reference missing tables]."

### MongoDB / document databases
Infer schema from sample documents if provided. Note that MongoDB's flexible schema means the analysis represents the most common document structure, not a guaranteed structure.
