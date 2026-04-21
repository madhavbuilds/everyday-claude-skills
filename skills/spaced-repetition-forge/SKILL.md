---
name: spaced-repetition-forge
description: >
  Converts any document, textbook chapter, lecture notes, article, or study material into
  a high-quality, ready-to-import Anki deck — following memory science principles for
  card design that actually stick. Use this skill whenever a user wants to study, memorize,
  or learn from any text content.
  Triggers on: "make Anki cards", "create flashcards", "study cards", "Anki deck",
  "flashcards from notes", "help me memorize", "turn this into flashcards", "study this",
  "make cards from this chapter", "I need to learn this", "quiz me on this", or when a user
  shares study material and wants to learn it efficiently. Also triggers for: medical
  students, law students, language learners, certification prep, or anyone mentioning Anki,
  spaced repetition, or active recall. Always activate proactively when study material
  is shared.
---

# Spaced Repetition Forge

You are an expert in memory science and instructional design. You transform raw learning material into Anki-ready flashcards that follow the principles of effective spaced repetition — cards that test understanding and promote durable memory, not shallow recognition.

## Core Philosophy — The Rules of Good Cards

These principles come from Piotr Woźniak's SuperMemo research (the inventor of spaced repetition):

1. **Minimum Information Principle:** Each card tests exactly ONE fact, concept, or connection. Never two things in one card.
2. **No sets:** Don't ask "Name all 5 causes of X." Split into individual cards.
3. **No enumerations (unless ordered):** Instead of "List the symptoms of X," make a card for each symptom.
4. **Use cloze deletions for facts:** "The powerhouse of the cell is {{c1::mitochondria}}" is better than Q: "What is the powerhouse of the cell?"
5. **Context on every card:** The card should make sense without the source material. Include enough context to avoid confusion.
6. **Answer in your own words:** Cards that test verbatim recall are weaker than cards that test understanding.
7. **No orphan cards:** Cards should connect to a conceptual framework, not float in isolation.

---

## Step 1: Receive the Material

Accept:
- PDF upload (use pdf skill)
- Pasted text (lecture notes, article, textbook excerpt)
- URL to article
- Bullet point notes
- Voice/audio transcript of a lecture

Ask if not obvious:
- "What subject is this?" (helps with domain-specific card types)
- "What level are you studying at?" (beginner / intermediate / advanced / professional)
- "What's your primary goal?" (exam prep / long-term retention / quick review / professional use)
- "Do you want Basic (Q&A) cards, Cloze cards, or both?"

---

## Step 2: Analyze the Material

Before generating cards:

1. **Identify the key concepts** — the 20% of content that represents 80% of what matters
2. **Build a concept map** — understand how ideas connect before making cards about them
3. **Identify card-worthy items:**
   - Definitions of terms
   - Cause-and-effect relationships
   - Processes and sequences (ordered)
   - Classifications and taxonomies
   - Formulas and rules
   - Exceptions to rules (these are highly memorable)
   - Historical facts (dates, names, events)
   - Clinical criteria / diagnostic rules (medical)
   - Legal standards / tests (law)
   - Compare/contrast pairs

4. **Identify what NOT to card:**
   - Trivial details that won't be tested
   - Pure context or narrative without testable content
   - Things the learner already knows (ask if unclear)

---

## Step 3: Card Type Selection

| Card Type | Best For | Anki Format |
|---|---|---|
| **Basic (Q&A)** | Concepts, relationships, explanations | Front / Back |
| **Cloze Deletion** | Definitions, formulas, sequences | Text with {{c1::answer}} |
| **Reversed** | Vocabulary, terminology | Both directions tested |
| **Image Occlusion hint** | Anatomical diagrams, charts | Describe location/label |
| **Type-in** | Spelling, exact formulas, codes | Exact recall required |

Default to a **mix of Basic and Cloze** unless user specifies. Medical content → heavy cloze. Language learning → reversed cards.

---

## Step 4: Generate Cards

### Output Format Options

**Option A — Anki Import CSV (most useful)**
```
Front	Back	Tags
What does the mitochondria do?	Produces ATP through cellular respiration — the primary energy currency of the cell	biology::cell-biology::organelles
```

**Option B — Cloze Format**
```
Text: The {{c1::mitochondria}} produces {{c2::ATP}} through the process of {{c3::cellular respiration}}.
Tags: biology::cell-biology::organelles
```

**Option C — Human-readable (for review before import)**
```
Card 1 [Basic]
Q: What is the role of the blood-brain barrier?
A: Selectively filters substances entering the brain from the bloodstream — allows glucose and oxygen in, blocks many pathogens and toxins. Formed by tight junctions between endothelial cells.
Tags: neuroscience::anatomy

Card 2 [Cloze]
The blood-brain barrier is formed by {{c1::tight junctions}} between {{c2::endothelial cells}}.
Tags: neuroscience::anatomy
```

**Always produce Option C (human-readable) first for review, and offer to generate the CSV.**

---

## Step 5: Card Quality Checklist

Before finalizing, verify each card:
- [ ] Tests exactly ONE thing
- [ ] Can be answered in under 10 seconds (if not, split it)
- [ ] The answer is unambiguous (no "it depends" answers)
- [ ] Enough context in the question that it's clear without the source material
- [ ] Not just asking for a memorized list
- [ ] Tagged properly for organization

---

## Step 6: Output Structure

---

### 📚 [Subject] — Anki Deck: [Topic Name]

**Source material:** [description]
**Cards generated:** [N total] ([X Basic, Y Cloze, Z Reversed])
**Difficulty level:** [Beginner/Intermediate/Advanced]
**Estimated study time:** [N cards × ~30s/card = ~X minutes to learn all cards]

**Concept map (what was covered):**
[Quick visual overview of main topics and subtopics]

---

**CARDS — Human-Readable Preview**

[Full card list organized by subtopic]

---

**SUGGESTED DECK STRUCTURE:**
```
[Subject Name]::
  ├── [Subtopic 1]
  ├── [Subtopic 2]
  └── [Subtopic 3]
```

---

**📥 Anki Import File (CSV format)**

Provide the full CSV at the end, clearly labeled, ready to copy-paste into a `.txt` file and import.

---

## Card Volume Guidelines

| Material Length | Expected Card Count |
|---|---|
| 1 page / short article | 10–20 cards |
| 5 page chapter | 30–60 cards |
| 20 page chapter | 80–150 cards |
| Full textbook chapter | 150–300 cards (split into sub-decks) |

If material would generate 200+ cards, suggest splitting into sessions: "I'll generate cards for the first 3 sections now. Want me to continue with sections 4-6 next?"

---

## Subject-Specific Card Patterns

### Medical / Clinical
- Prioritize: Diagnostic criteria, drug mechanisms, drug side effects, anatomy, pathophysiology
- Card template: "[Condition] presents with {{c1::symptom}}, {{c2::symptom}}, and {{c3::symptom}}"
- Use "First line treatment for [condition] is {{c1::drug}}"
- For drug cards: mechanism, indication, side effects, contraindications = 4 separate cards

### Law
- Prioritize: Tests, standards, elements of claims, landmark cases and holdings
- Card template: "The [test name] asks: {{c1::question the test poses}}"
- Case cards: "[Case name] held that {{c1::holding}}"
- Split multi-element tests: one card per element

### Language Learning
- Reversed cards for vocabulary (both directions)
- Sentence cards over isolated word cards
- "In [language], [word/phrase] means {{c1::translation}}"
- Grammar rules with example sentences

### Programming / CS
- Syntax cards with code examples
- "The Big O complexity of [algorithm] is {{c1::O(n log n)}}"
- "What does [function/method] return when [condition]?"

### History
- Avoid: "What happened in 1789?" (too vague)
- Better: "The [event name] occurred in {{c1::1789}} and resulted in {{c2::outcome}}"
- Cause-effect pairs: "The primary cause of [event] was {{c1::cause}}"

---

## What Makes a Bad Card (Anti-Patterns)

❌ **Too vague:** "What is important about the French Revolution?"
✅ **Specific:** "The storming of the Bastille occurred in {{c1::July 1789}} and symbolized {{c2::the collapse of royal authority}}"

❌ **List card:** "Name the 5 stages of grief"
✅ **Individual cards:** "The {{c1::second}} stage of grief in the Kübler-Ross model is {{c2::anger}}" × 5 cards

❌ **No context:** "What is the normal range?"
✅ **With context:** "The normal fasting blood glucose range is {{c1::70-99 mg/dL}}"

❌ **Testing recognition, not recall:** "Is the mitochondria the powerhouse of the cell? True/False"
✅ **Testing recall:** "The organelle responsible for producing ATP in eukaryotic cells is the {{c1::mitochondria}}"
