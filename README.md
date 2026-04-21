<div align="center">

<img src="https://img.shields.io/badge/Claude-Skills-orange?style=for-the-badge&logo=anthropic&logoColor=white" alt="Claude Skills" />
<img src="https://img.shields.io/badge/Skills-10-blue?style=for-the-badge" alt="10 Skills" />
<img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License" />
<img src="https://img.shields.io/badge/PRs-Welcome-brightgreen?style=for-the-badge" alt="PRs Welcome" />

# 🧠 Viral Claude Skills

### 10 groundbreaking Claude Skills for real-world problems that don't exist anywhere else.

**Built for Claude Code, Claude.ai, and the Claude API.**
Solves the problems people actually have — not another coding helper.

[**→ Browse Skills**](#skills) · [**→ Quick Install**](#quick-install) · [**→ Contribute**](CONTRIBUTING.md) · [**→ Discord**](#community)

---

</div>

## Why These Skills Exist

Most Claude Skills in the ecosystem are developer tools — debugging, testing, MCP builders. That's great, but **90% of the world isn't a developer**.

This repository is built for everyone:
- The patient who can't understand their blood test results
- The freelancer who got their deposit stolen by a landlord
- The researcher drowning in papers
- The podcaster leaving content value on the table
- The developer who inherited a database with zero documentation

Every skill here solves a real, painful, universally-relatable problem — and solves it properly.

---

## Skills

| # | Skill | What It Does | Who It's For |
|---|---|---|---|
| 🩺 | [blood-report-interpreter](#-blood-report-interpreter) | Explains lab results in plain English | Everyone who gets blood tests |
| 📝 | [life-admin-autopilot](#-life-admin-autopilot) | Writes formal letters that get results | Anyone dealing with bureaucracy |
| ⚖️ | [contract-red-flag-detector](#️-contract-red-flag-detector) | Flags risky contract clauses before you sign | Freelancers, employees, tenants |
| 🗄️ | [database-schema-whisperer](#️-database-schema-whisperer) | Reverse-engineers inherited databases | Developers, DBAs |
| 📋 | [meeting-minutes-machine](#-meeting-minutes-machine) | Transcript → minutes, tickets, follow-up email | Teams, PMs, consultants |
| 🃏 | [spaced-repetition-forge](#-spaced-repetition-forge) | Any text → ready-to-import Anki deck | Students, professionals |
| 🎙️ | [podcast-content-multiplier](#️-podcast-content-multiplier) | One transcript → 7 content formats | Creators, podcasters, marketers |
| ♿ | [accessibility-auditor](#-accessibility-auditor) | WCAG audit with code-ready fixes | Devs, designers, agencies |
| 🧾 | [invoice-expense-intelligence](#-invoice-expense-intelligence) | Receipts → categorized tax-ready report | Freelancers, small businesses |
| 📚 | [research-paper-synthesizer](#-research-paper-synthesizer) | Multiple papers → structured literature review | Researchers, students, clinicians |

---

## Quick Install

```bash
# Clone the whole collection
git clone https://github.com/YOUR-USERNAME/viral-claude-skills ~/.claude/skills/viral-claude-skills

# Or install a single skill
git clone https://github.com/YOUR-USERNAME/viral-claude-skills /tmp/viral-claude-skills
cp -r /tmp/viral-claude-skills/skills/blood-report-interpreter ~/.claude/skills/

# Verify install
ls ~/.claude/skills/
```

That's it. Claude auto-discovers skills in `~/.claude/skills/` — no configuration needed.

**Requirements:** Claude Pro, Max, Team, or Enterprise plan with Code Execution enabled.

---

## Skill Details

---

### 🩺 Blood Report Interpreter

**The problem:** Doctors spend 2 minutes reviewing your labs. You get a PDF you can't understand. You either panic or ignore it.

**What it does:**
- Reads any blood test PDF or pasted values
- Classifies every marker: ✅ Optimal / ⚠️ Borderline / 🔴 Flagged
- Explains each marker in plain English
- Spots patterns across markers (iron deficiency, metabolic syndrome, thyroid patterns)
- Generates specific, intelligent questions to ask your doctor
- Covers 80+ markers across CBC, CMP, lipid, thyroid, hormones, vitamins, kidney, liver panels
- Knows optimal ranges vs just "in reference range"
- Drug-marker interaction detection (e.g. metformin depletes B12)

**Try it:**
> "I got my blood test back. Here are the results..." *(paste your values)*

> *(Upload a PDF of your lab report)*

**Files:**
```
blood-report-interpreter/
├── SKILL.md
└── references/
    └── lab-reference-ranges.md   ← 80+ markers with optimal ranges & drug interactions
```

---

### 📝 Life Admin Autopilot

**The problem:** Everyone dreads writing to their landlord, insurance company, or bank. The mental load is real and the stakes are high.

**What it does:**
- Writes formal letters for: deposit disputes, insurance claims, consumer complaints, GDPR requests, employment grievances, utility disputes, and more
- UK, US, India, and EU legal references built in
- Cites relevant legislation (Consumer Rights Act, UK GDPR, Housing Act, etc.)
- Includes escalation path for every situation (ombudsman → court)
- Generates checklist of what to attach and how to send
- Pre-Action letters, Section 21 responses, Subject Access Requests, and more

**Try it:**
> "My landlord is keeping my deposit and claiming damage that was there when I moved in. Help me write a formal letter demanding it back."

> "My insurance company rejected my claim for water damage. Write a formal complaint."

**Files:**
```
life-admin-autopilot/
├── SKILL.md
└── references/
    ├── housing.md          ← Tenancy law, deposit protection, disrepair
    ├── consumer.md         ← Consumer Rights Act, cooling off, chargebacks
    └── data-privacy.md     ← GDPR SAR templates, right to erasure, CCPA
```

---

### ⚖️ Contract Red-Flag Detector

**The problem:** Millions of people sign contracts without understanding them. Lawyers are expensive. Bad clauses are expensive-er.

**What it does:**
- Reads any contract: employment, freelance, NDA, SaaS ToS, lease, partnership, investment
- Classifies every clause: 🔴 Red Flag / 🟡 Watch / ✅ Standard / ❓ Missing
- Plain-English explanation of every problematic clause
- "What's normal" comparison for every red flag
- Specific negotiation language to request as alternatives
- Prioritized list of changes to push for
- Tells you honestly when you need a lawyer

**Try it:**
> *(Paste or upload an employment contract)*
> "Is this NDA reasonable?"

**Files:**
```
contract-red-flag-detector/
└── SKILL.md
```

---

### 🗄️ Database Schema Whisperer

**The problem:** Every developer has inherited a legacy database with no documentation, cryptic table names, and mystery relationships.

**What it does:**
- Accepts SQL DDL, Prisma, SQLAlchemy, Django, ActiveRecord, TypeORM, Hibernate schemas
- Reconstructs the entity-relationship model in plain English
- Infers the business domain and application type
- Detects: missing indexes, N+1 traps, naming inconsistencies, normalization issues, EAV anti-pattern
- Generates a text ER diagram
- Produces a query cheat sheet for the specific schema
- Auto-generates a `CLAUDE.md` for your codebase
- Provides migration SQL for found issues

**Try it:**
> *(Paste your schema DDL)*
> "I inherited this database — can you help me understand it?"

**Files:**
```
database-schema-whisperer/
└── SKILL.md
```

---

### 📋 Meeting Minutes Machine

**The problem:** Meeting notes are taken inconsistently, action items get lost, and follow-up emails never get sent.

**What it does:**
- Accepts Zoom/Teams/Meet transcripts, rough notes, Otter.ai output
- Extracts: decisions, action items (with owners + deadlines), open questions, risks
- Generates all 5 outputs at once:
  - Structured meeting minutes
  - Follow-up email (ready to send)
  - Project management tickets (JIRA/Linear format)
  - Slack/Teams one-paragraph summary
  - 3-sentence TL;DR
- Works for any meeting type: standup, sprint planning, 1:1, board, client, retro

**Try it:**
> *(Paste a Zoom transcript)*
> "Write up this meeting. We need action items and a follow-up email."

**Files:**
```
meeting-minutes-machine/
└── SKILL.md
```

---

### 🃏 Spaced Repetition Forge

**The problem:** Making good Anki cards is hard and time-consuming. Most people make bad cards that don't actually help them remember.

**What it does:**
- Accepts any text: lecture notes, textbook chapters, articles, PDFs
- Follows memory science principles (Minimum Information Principle, no lists, cloze > Q&A)
- Generates Basic Q&A cards, Cloze deletions, Reversed vocabulary cards
- Domain-specific patterns: medical (drug cards, diagnostic criteria), law (tests, holdings), language, programming
- Outputs in both human-readable preview AND Anki-importable CSV format
- Suggests deck structure and card counts
- Quality checklist on every card

**Try it:**
> "Make Anki cards from this chapter on cardiac physiology."
> "Turn these lecture notes into a study deck."

**Files:**
```
spaced-repetition-forge/
└── SKILL.md
```

---

### 🎙️ Podcast Content Multiplier

**The problem:** Podcasters leave 90% of their content value on the table. One great conversation should power a week of content.

**What it does:**
- Accepts any podcast or interview transcript
- Generates ALL 7 formats in one shot:
  1. SEO blog post (1200-1800 words)
  2. Twitter/X thread (8-12 tweets with a killer hook)
  3. LinkedIn article (600-900 words)
  4. 3× YouTube Short scripts (45-60 seconds each)
  5. Newsletter excerpt with 3 subject line options
  6. Chapter timestamps
  7. Pinterest/Instagram caption
- Each format follows platform-native writing conventions (not copy-paste)
- Identifies the 3 best "golden moments" for short-form content

**Try it:**
> *(Paste a podcast transcript)*
> "Repurpose this into content for all my channels."

**Files:**
```
podcast-content-multiplier/
└── SKILL.md
```

---

### ♿ Accessibility Auditor

**The problem:** Accessibility is legally required but consistently skipped because auditing is painful. Automated tools only catch ~30% of issues.

**What it does:**
- Accepts HTML, CSS, React/JSX, Vue, Angular, screenshots, Figma exports
- Full WCAG 2.1 AA audit (with 2.2 criteria noted)
- Classifies issues: 🔴 Critical (blocks access) / 🟠 Serious / 🟡 Moderate / 🔵 Minor
- Gives copy-paste-ready code fixes for every issue
- Explains real user impact for each violation
- Contrast ratio calculations with compliant color alternatives
- Generates manual testing checklist (keyboard, screen reader, zoom, high contrast)
- Legal context: ADA, AODA, EQA, EU Web Accessibility Directive

**Try it:**
> *(Paste HTML/JSX code)*
> "Audit this for accessibility issues."
> "Is this form keyboard accessible?"

**Files:**
```
accessibility-auditor/
└── SKILL.md
```

---

### 🧾 Invoice & Expense Intelligence

**The problem:** Freelancers and small businesses waste hours on expense categorization — and still mess up their tax return.

**What it does:**
- Reads receipts and invoices from images, PDFs, or pasted text
- Extracts all fields: date, vendor, description, net, VAT, total, invoice number
- Tax categorization for UK (HMRC), US (Schedule C), and India (ITR)
- Detects: duplicates, round-number flags, missing VAT numbers (for reclaim), anomalies
- Generates expense report table with status per document
- Category summary with totals
- Exports: CSV compatible with QuickBooks, Xero, FreeAgent, Wave
- VAT reclaim compliance check
- Mileage log generation (HMRC approved rates)

**Try it:**
> *(Upload receipt images or paste rows from your bank statement)*
> "Categorize these expenses for my tax return."
> "Process these 15 receipts into an expense report."

**Files:**
```
invoice-expense-intelligence/
└── SKILL.md
```

---

### 📚 Research Paper Synthesizer

**The problem:** Literature reviews take researchers weeks. You end up with 20 separate summaries instead of actual synthesis.

**What it does:**
- Accepts multiple paper PDFs, pasted abstracts, or paper descriptions
- Evidence quality hierarchy (meta-analysis → RCT → cohort → case study)
- Cross-paper analysis: consensus, contradictions, moderators, methodology comparison
- Research gap identification (often the most valuable output)
- Structured outputs: narrative synthesis, evidence map, contradiction analysis, PRISMA flow
- Specialized outputs: systematic review prep, clinical evidence brief (GRADE), policy brief
- Citation list in APA/MLA/Chicago/Vancouver
- Epistemic honesty built in — never overstates certainty

**Try it:**
> *(Share 5+ papers on a topic)*
> "Write a literature review synthesizing these papers."
> "Where do these studies agree and disagree?"

**Files:**
```
research-paper-synthesizer/
└── SKILL.md
```

---

## Installation

### Install All 10 Skills

```bash
git clone https://github.com/YOUR-USERNAME/viral-claude-skills
cp -r viral-claude-skills/skills/* ~/.claude/skills/
```

### Install One Skill

```bash
cp -r viral-claude-skills/skills/blood-report-interpreter ~/.claude/skills/
```

### Windows (PowerShell)

```powershell
git clone https://github.com/YOUR-USERNAME/viral-claude-skills
Copy-Item -Recurse "viral-claude-skills\skills\*" "$env:USERPROFILE\.claude\skills\"
```

### Verify Installation

In Claude Code, type:
```
/skills list
```

You should see all installed skills in the list.

---

## Requirements

- **Claude plan:** Pro, Max, Team, or Enterprise
- **Code execution:** Must be enabled in your Claude settings
- **Claude Code** (recommended) OR Claude.ai with code execution

---

## Frequently Asked Questions

**Q: Are these skills safe?**
Skills can execute code in Claude's environment. These skills only use code for document reading (pdf/vision), data processing, and file generation — no external API calls, no network access, no sensitive data transmission. Review the SKILL.md of any skill before installing if you have concerns.

**Q: Do these work on Claude.ai (not just Claude Code)?**
Yes — skills work across Claude Code, Claude.ai, and the Claude API when code execution is enabled.

**Q: Can I modify these skills?**
Yes, and please do. They're MIT licensed. Fork, customize for your use case, and share back.

**Q: Will these be updated?**
Yes. We track WCAG updates, tax rate changes, new lab standard references, and legal framework updates. Watch this repo for updates.

**Q: The blood report skill — should I trust it medically?**
No — and it says so clearly. It helps you understand your results and ask better questions. It is not a substitute for clinical judgment. Always discuss results with your healthcare provider.

---

## Contributing

We welcome contributions. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**What makes a good skill for this repo:**
- Solves a real problem that non-developers face
- Not already well-covered by existing skills in the ecosystem
- Has clear viral/sharing potential (people will tell others about it)
- Includes proper reference files for domain knowledge
- Follows the SKILL.md format standards

---

## Community

- **GitHub Discussions:** Ask questions, share demos, suggest improvements
- **Issues:** Bug reports and skill improvement requests
- **Show & Tell:** Share screenshots of cool outputs in Discussions

---

## License

MIT — use freely, modify freely, share freely. Attribution appreciated but not required.

---

## Disclaimer

These skills provide information and assistance, not professional advice. The blood report skill is not medical advice. The life admin skill is not legal advice. The contract skill is not legal advice. Always consult qualified professionals for high-stakes decisions. See individual skill disclaimers for details.

---

<div align="center">

**Built with ❤️ for everyone who deserves better tools**

⭐ Star this repo if a skill helped you · 🍴 Fork it to customize · 📣 Share it with someone who needs it

</div>
#   e v e r y d a y - c l a u d e - s k i l l s  
 