# Contributing to Viral Claude Skills

Thank you for wanting to contribute! This repository exists because real people have real problems that AI tools can genuinely solve — and we want to keep that standard high.

---

## What We're Looking For

### ✅ Good contributions
- New skills that solve real problems not covered elsewhere
- Improvements to existing skills (better prompting, edge case handling, new reference files)
- Bug fixes (skill not triggering, wrong output format, broken reference links)
- Documentation improvements
- New regional legal/tax reference files (e.g. adding Australian tax categories to invoice skill)
- New lab panels or medical references for the blood report skill

### ❌ Not a good fit
- Skills that duplicate what's already in the `awesome-claude-skills` ecosystem
- Developer-only tools (there are many other repos for those)
- Skills without practical, non-developer use cases
- Marketing/spam skills

---

## How to Add a New Skill

### 1. Check if it already exists
Before building, search:
- [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills)

If it exists elsewhere, link to it instead of duplicating.

### 2. Required file structure

```
skills/your-skill-name/
├── SKILL.md                  ← Required: main skill file
└── references/               ← Optional: domain knowledge files
    └── your-reference.md
```

### 3. SKILL.md frontmatter requirements

```yaml
---
name: your-skill-name           # lowercase, hyphenated, matches folder name
description: >
  [What it does AND when to trigger it. Be specific about trigger phrases.
  Make it slightly "pushy" — err on the side of activating when relevant.
  Include key use case phrases that users will actually say.]
---
```

### 4. Skill quality checklist

Before submitting:
- [ ] Tested with at least 3 real-world examples
- [ ] Trigger phrases are broad enough to catch natural language
- [ ] Output is immediately usable (not just analysis — actionable artifacts)
- [ ] Edge cases are handled gracefully
- [ ] Appropriate disclaimers included for health/legal/financial content
- [ ] Reference files are accurate and sourced
- [ ] No hallucinated facts in reference files

---

## Updating Existing Skills

- Keep the existing `name` in frontmatter unchanged
- Add new regional coverage in reference files rather than the main SKILL.md
- For major changes, open an issue first to discuss

---

## Pull Request Process

1. Fork the repository
2. Create a branch: `git checkout -b skill/your-skill-name` or `fix/blood-report-thyroid`
3. Add your skill or change
4. Test it: install locally, run a few examples, confirm it works
5. Open a PR with:
   - What the skill does
   - Who it helps
   - 1-2 example inputs and their outputs
   - Any edge cases you've considered

---

## Code of Conduct

- Be kind and constructive in reviews
- Accuracy matters — skills affect real people's health, legal, and financial decisions
- Cite sources for any domain-specific facts added to reference files
- Flag medical/legal/financial content for extra review

---

## Questions?

Open a [Discussion](../../discussions) — we're friendly.
