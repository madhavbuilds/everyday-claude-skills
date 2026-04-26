<div align="center">
<br/>

```
██╗   ██╗██╗██████╗  █████╗ ██╗      
██║   ██║██║██╔══██╗██╔══██╗██║      
██║   ██║██║██████╔╝███████║██║      
╚██╗ ██╔╝██║██╔══██╗██╔══██║██║      
 ╚████╔╝ ██║██║  ██║██║  ██║███████╗ 
  ╚═══╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝
       CLAUDE SKILLS
```

**10 skills for real problems. Not another coding helper.**

[![Skills](https://img.shields.io/badge/Skills-10-000000?style=flat-square)](.)
[![License](https://img.shields.io/badge/License-MIT-000000?style=flat-square)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome-000000?style=flat-square)](CONTRIBUTING.md)
[![Claude](https://img.shields.io/badge/Built_for-Claude-D97757?style=flat-square)](https://claude.ai)

<br/>

</div>

---

## Why This Exists

Most Claude skills in the wild are developer tools — debuggers, test runners, MCP builders.

This repo is for everyone else.

- The patient who can't understand their blood test
- The freelancer whose landlord kept their deposit
- The researcher buried in 30 papers with a deadline tomorrow
- The podcaster leaving 90% of their content value on the table
- The developer who inherited a database with zero documentation

Every skill here solves one specific, painful, common problem — and solves it properly.

---

## Skills

| | Skill | What It Does | Who It's For |
|--|-------|-------------|--------------|
| 🩺 | [Blood Report Interpreter](#-blood-report-interpreter) | Explains lab results in plain English | Everyone who gets blood tests |
| 📝 | [Life Admin Autopilot](#-life-admin-autopilot) | Writes formal letters that get results | Anyone dealing with bureaucracy |
| ⚖️ | [Contract Red-Flag Detector](#️-contract-red-flag-detector) | Flags risky clauses before you sign | Freelancers, employees, tenants |
| 🗄️ | [Database Schema Whisperer](#️-database-schema-whisperer) | Reverse-engineers inherited databases | Developers, DBAs |
| 📋 | [Meeting Minutes Machine](#-meeting-minutes-machine) | Transcript → minutes, tickets, email | Teams, PMs, consultants |
| 🃏 | [Spaced Repetition Forge](#-spaced-repetition-forge) | Any text → ready-to-import Anki deck | Students, professionals |
| 🎙️ | [Podcast Content Multiplier](#️-podcast-content-multiplier) | One transcript → 7 content formats | Creators, podcasters, marketers |
| ♿ | [Accessibility Auditor](#-accessibility-auditor) | WCAG audit with code-ready fixes | Devs, designers, agencies |
| 🧾 | [Invoice & Expense Intelligence](#-invoice--expense-intelligence) | Receipts → categorized tax-ready report | Freelancers, small businesses |
| 📚 | [Research Paper Synthesizer](#-research-paper-synthesizer) | Multiple papers → literature review | Researchers, students, clinicians |

---

## Quick Install

```bash
# Install all 10 skills
git clone https://github.com/YOUR-USERNAME/viral-claude-skills ~/.claude/skills/viral-claude-skills

# Install a single skill
git clone https://github.com/YOUR-USERNAME/viral-claude-skills /tmp/vcs
cp -r /tmp/vcs/skills/blood-report-interpreter ~/.claude/skills/

# Verify
ls ~/.claude/skills/
```

**Windows (PowerShell)**
```powershell
git clone https://github.com/YOUR-USERNAME/viral-claude-skills
Copy-Item -Recurse "viral-claude-skills\skills\*" "$env:USERPROFILE\.claude\skills\"
```

**Requirements:** Claude Pro, Max, Team, or Enterprise · Code Execution enabled

---

## Skill Details

---

### 🩺 Blood Report Interpreter

**The problem:** Doctors spend 2 minutes on your labs. You get a PDF you can't read. You either panic or ignore it.

**What it does:**

- Reads any blood test PDF or pasted values
- Classifies every marker: ✅ Optimal / ⚠️ Borderline / 🔴 Flagged
- Explains each result in plain English — no jargon
- Spots cross-marker patterns: iron deficiency, metabolic syndrome, thyroid signals
- Generates specific questions to ask your doctor
- Covers 80+ markers across CBC, CMP, lipid, thyroid, hormones, vitamins, kidney, liver
- Uses optimal ranges, not just "in reference range"
- Detects drug-marker interactions (e.g. metformin depletes B12)

**Try it:**
```
"I got my blood test back. Here are the results: [paste values]"
```
```
[Upload a PDF of your lab report]
```

**Files:**
```
blood-report-interpreter/
├── SKILL.md
└── references/
    └── lab-reference-ranges.md   ← 80+ markers, optimal ranges, drug interactions
```

---

### 📝 Life Admin Autopilot

**The problem:** Writing to your landlord, insurance company, or bank is stressful. The mental load is real. The stakes are high.

**What it does:**

- Writes formal letters for: deposit disputes, insurance claims, consumer complaints, GDPR requests, employment grievances, utility disputes, and more
- Built-in UK, US, India, and EU legal references
- Cites relevant legislation (Consumer Rights Act, Housing Act, UK GDPR, etc.)
- Includes escalation path for every situation: ombudsman → court
- Generates checklist of what to attach and how to send
- Handles Pre-Action letters, Section 21 responses, Subject Access Requests, and more

**Try it:**
```
"My landlord is keeping my deposit and claiming damage that was there before I moved in.
Help me write a formal letter demanding it back."
```

**Files:**
```
life-admin-autopilot/
├── SKILL.md
└── references/
    ├── housing.md        ← Tenancy law, deposit protection, disrepair
    ├── consumer.md       ← Consumer Rights Act, cooling off, chargebacks
    └── data-privacy.md   ← GDPR SAR templates, right to erasure, CCPA
```

---

### ⚖️ Contract Red-Flag Detector

**The problem:** Millions of people sign contracts they don't understand. Lawyers are expensive. Bad clauses are more expensive.

**What it does:**

- Reads any contract: employment, freelance, NDA, SaaS ToS, lease, partnership, investment
- Classifies every clause: 🔴 Red Flag / 🟡 Watch / ✅ Standard / ❓ Missing
- Plain-English explanation of every problematic clause
- "What's normal" comparison for every red flag found
- Specific negotiation language to request as alternatives
- Prioritized list: what to push for vs. what to let go
- Tells you honestly when you actually need a lawyer

**Try it:**
```
[Paste or upload any contract]
"Is this NDA reasonable?"
```

**Files:**
```
contract-red-flag-detector/
└── SKILL.md
```

---

### 🗄️ Database Schema Whisperer

**The problem:** Every developer has inherited a legacy database — no docs, cryptic table names, mystery relationships, undocumented business logic baked into column names.

**What it does:**

- Accepts SQL DDL, Prisma, SQLAlchemy, Django, ActiveRecord, TypeORM, Hibernate schemas
- Reconstructs the entity-relationship model in plain English
- Infers the business domain and application type from structure alone
- Detects: missing indexes, N+1 traps, naming inconsistencies, normalization issues, EAV anti-pattern
- Generates a text-based ER diagram
- Produces a query cheat sheet specific to your schema
- Auto-generates a `CLAUDE.md` for your codebase
- Provides migration SQL for found issues

**Try it:**
```
[Paste your schema DDL]
"I inherited this database — help me understand it."
```

**Files:**
```
database-schema-whisperer/
└── SKILL.md
```

---

### 📋 Meeting Minutes Machine

**The problem:** Notes are taken inconsistently. Action items get lost. The follow-up email never gets sent.

**What it does:**

- Accepts Zoom/Teams/Meet transcripts, rough notes, Otter.ai output
- Extracts: decisions, action items (with owners + deadlines), open questions, risks
- Produces all 5 outputs at once:
  1. Structured meeting minutes
  2. Follow-up email (ready to send)
  3. Project management tickets (JIRA/Linear format)
  4. Slack/Teams one-paragraph summary
  5. 3-sentence TL;DR
- Works for any meeting type: standup, planning, 1:1, board, client, retro

**Try it:**
```
[Paste a Zoom transcript]
"Write up this meeting. I need action items and a follow-up email."
```

**Files:**
```
meeting-minutes-machine/
└── SKILL.md
```

---

### 🃏 Spaced Repetition Forge

**The problem:** Making good Anki cards is hard and slow. Most people make bad cards that don't actually help them remember anything.

**What it does:**

- Accepts any text: lecture notes, textbook chapters, articles, PDFs
- Follows memory science principles: Minimum Information Principle, no lists, cloze > Q&A
- Generates Basic Q&A cards, Cloze deletions, Reversed vocabulary cards
- Domain-specific patterns: medical (drug cards, diagnostic criteria), law (tests, holdings), language, programming
- Outputs both a human-readable preview AND an Anki-importable CSV
- Suggests deck structure and ideal card counts per topic
- Quality checklist applied to every card

**Try it:**
```
"Make Anki cards from this chapter on cardiac physiology."
"Turn these lecture notes into a study deck."
```

**Files:**
```
spaced-repetition-forge/
└── SKILL.md
```

---

### 🎙️ Podcast Content Multiplier

**The problem:** Podcasters leave 90% of their content value on the table. One great conversation should power a full week of content.

**What it does:**

Generates all 7 formats from a single transcript:

1. **SEO blog post** — 1200–1800 words
2. **Twitter/X thread** — 8–12 tweets with a strong hook
3. **LinkedIn article** — 600–900 words
4. **YouTube Short scripts** — 3 scripts, 45–60 seconds each
5. **Newsletter excerpt** — with 3 subject line options
6. **Chapter timestamps** — ready to paste into YouTube
7. **Instagram/Pinterest caption** — platform-native tone

Each format follows platform-specific conventions — not copy-paste from one to another. Identifies the 3 best "golden moments" for short-form clips.

**Try it:**
```
[Paste a podcast transcript]
"Repurpose this into content for all my channels."
```

**Files:**
```
podcast-content-multiplier/
└── SKILL.md
```

---

### ♿ Accessibility Auditor

**The problem:** Accessibility is legally required and consistently skipped. Automated tools only catch ~30% of real issues.

**What it does:**

- Accepts HTML, CSS, React/JSX, Vue, Angular, screenshots, Figma exports
- Full WCAG 2.1 AA audit (with 2.2 criteria flagged)
- Classifies issues: 🔴 Critical (blocks access) / 🟠 Serious / 🟡 Moderate / 🔵 Minor
- Copy-paste-ready code fixes for every issue found
- Explains real user impact for each violation
- Contrast ratio calculations with compliant color alternatives provided
- Manual testing checklist: keyboard, screen reader, zoom, high contrast
- Legal context: ADA, AODA, EQA, EU Web Accessibility Directive

**Try it:**
```
[Paste HTML or JSX]
"Audit this for accessibility issues."
"Is this form keyboard accessible?"
```

**Files:**
```
accessibility-auditor/
└── SKILL.md
```

---

### 🧾 Invoice & Expense Intelligence

**The problem:** Freelancers and small businesses waste hours on expense categorization — and still make mistakes on their tax return.

**What it does:**

- Reads receipts and invoices from images, PDFs, or pasted text
- Extracts all fields: date, vendor, description, net, VAT, total, invoice number
- Tax categorization for UK (HMRC), US (Schedule C), and India (ITR)
- Detects: duplicates, round-number anomalies, missing VAT numbers, suspicious patterns
- Generates expense report table with per-document status
- Category summary with totals and tax-deductible breakdown
- Export: CSV compatible with QuickBooks, Xero, FreeAgent, Wave
- VAT reclaim compliance check
- Mileage log generation at HMRC-approved rates

**Try it:**
```
[Upload receipt images or paste bank statement rows]
"Categorize these for my tax return."
"Process these 15 receipts into an expense report."
```

**Files:**
```
invoice-expense-intelligence/
└── SKILL.md
```

---

### 📚 Research Paper Synthesizer

**The problem:** Literature reviews take weeks. You end up with 20 separate summaries — not actual synthesis.

**What it does:**

- Accepts multiple paper PDFs, pasted abstracts, or paper descriptions
- Applies evidence quality hierarchy: meta-analysis → RCT → cohort → case study
- Cross-paper analysis: consensus, contradictions, moderating factors, methodology comparison
- Research gap identification — often the most valuable output
- Structured outputs: narrative synthesis, evidence map, contradiction analysis, PRISMA flow
- Specialized modes: systematic review prep, clinical evidence brief (GRADE), policy brief
- Citation list in APA / MLA / Chicago / Vancouver
- Epistemic honesty built in — never overstates certainty

**Try it:**
```
[Share 5+ papers on a topic]
"Write a literature review synthesizing these papers."
"Where do these studies agree and disagree?"
```

**Files:**
```
research-paper-synthesizer/
└── SKILL.md
```

---

## Frequently Asked Questions

**Are these skills safe?**
Skills run code only for document reading, data processing, and file generation. No external API calls, no network requests, no data transmission of any kind. Review any `SKILL.md` before installing if you have concerns.

**Do these work on Claude.ai, not just Claude Code?**
Yes. Skills work across Claude Code, Claude.ai, and the Claude API whenever code execution is enabled.

**Can I modify these skills?**
Yes — MIT licensed. Fork, customize for your use case, and share back if it's useful to others.

**Will these be updated?**
Yes. We track WCAG updates, tax rate changes, lab standard revisions, and legal framework changes. Watch this repo.

**The blood report skill — should I trust it medically?**
No — and it says so clearly. It helps you understand your results and ask better questions. It is not a substitute for your doctor.

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for full guidelines.

A good skill for this repo:
- Solves a problem non-developers actually face
- Isn't already well-covered by existing skills
- Has clear sharing potential — people will tell others about it
- Includes reference files for domain knowledge where needed
- Follows the `SKILL.md` format standard

---

## License

MIT — use freely, modify freely, share freely. Attribution appreciated but not required.

---

## Disclaimer

These skills provide information and assistance, not professional advice. The blood report skill is not medical advice. The life admin and contract skills are not legal advice. Consult qualified professionals for high-stakes decisions. Individual skill files contain specific disclaimers.

---

<div align="center">

**Built for everyone who deserves better tools**

⭐ Star if a skill helped you · 🍴 Fork to customize · 📣 Share with someone who needs it

</div>
