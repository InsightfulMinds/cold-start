# Diana's Agency OS

A five-specialist AI operating system for a boutique Austin real estate team.
No new software. No logins. Operational in a day.

---

## Architecture

```
agency-system/
├── README.md              ← You are here
├── HANDOFF_SCHEMA.md      ← The contract every specialist signs
├── DIANA_STANDARDS.md     ← Diana's 8 years of judgment, in writing
│
├── 00_orchestrator/       ← Front door. Every request starts here.
├── 01_lead_qualifier/     ← First contact. Produces a lead card.
├── 02_property_research/  ← Comps, neighborhoods, listing prep.
├── 03_client_communication/ ← Drafts in the agent's voice. English + Spanish.
└── 04_transaction_coordinator/ ← Active deals. Deadlines. Documents. Nothing falls through.
```

Each folder is a Claude project. Each project has one job and passes structured work to the next one via a handoff envelope.

---

## How a request flows

```
New prospect (any language)
    → 00_orchestrator assigns case_id, detects language, routes
    → 01_lead_qualifier captures intent/budget/timeline, produces lead card
    → 03_client_communication drafts intro in agent's voice (English or Spanish)
    → [prospect responds, becomes active buyer]
    → 02_property_research pulls comps and neighborhood brief
    → 03_client_communication drafts follow-up with research context
    → [offer accepted, contract executed]
    → 04_transaction_coordinator opens deal file, tracks deadlines and documents
    → [deal closes] → status: closed
```

Work can move backward. A stalled deal in TC routes back to comms. A re-qualified cold lead routes back to the lead qualifier. The `back_to` field in every handoff envelope makes this explicit — no one decides on the fly where a return goes.

---

## The handoff envelope

Every specialist reads and writes this structure. It lives in `HANDOFF_SCHEMA.md`.

```
case_id:   DIANA-YYYYMMDD-NNN   # Never changes from intake to close
from:      [specialist folder]
to:        [specialist folder]
back_to:   [specialist folder | null]
status:    active | stalled | closed
language:  en | es | bilingual
priority:  normal | urgent

What I Know / What I Don't Know / Risks I Flagged / My Deliverable
```

The `back_to` field is the design decision that matters most. Real estate deals don't move linearly. A lender delay routes back to comms. An inspection issue routes back to research. The system is built for how deals actually move, not how a flowchart assumes they should.

---

## Bilingual by design

Austin's first-time buyer market is approximately 40% Spanish-preferring.
`language: es` in the handoff envelope triggers native Spanish output throughout — lead cards, email drafts, neighborhood briefs. Not translated English. Spanish from the first word.
This isn't a feature. It's a routing instruction that follows the case from intake to close.

---

## Before you start — Claude Project Setup (5 minutes)

**Step 1: Create a Claude Project**
Go to [claude.ai](https://claude.ai) → Projects → New Project. Name it "Diana's Agency OS."

**Step 2: Add Project Instructions**
Copy the full contents of `DIANA_STANDARDS.md` into the project's Custom Instructions field.
Every specialist now knows Diana's voice, her team structure, and her non-negotiables by default.

**Step 3: Upload shared files**
Upload to the project file library:
- `HANDOFF_SCHEMA.md`
- `DIANA_STANDARDS.md`
- This `README.md`

**Step 4: Upload specialist folders**
For each folder you'll use, upload its four files as a group:
`identity.md` + `rules.md` + `examples.md` + `handoff.md`

Start with `00_orchestrator` and the one or two specialists your team uses most. You don't need all five on day one.

**Step 5: Test before Monday**
Open the project, start a new conversation, type:

> "Route this: new Spanish-speaking buyer inquiry, budget $400K, no pre-approval yet."

The orchestrator should assign a case_id, detect `language: es`, and produce a handoff envelope to `01_lead_qualifier`. If it does, you're ready.

---

## Onboarding a new team member (60 minutes)

1. (10 min) Walk through this README together. Explain: "Five specialists. One job each. Work travels via the envelope."
2. (15 min) Run a real scenario through `00_orchestrator` — use something from last week.
3. (15 min) Have them run a lead through `01_lead_qualifier` with a real contact.
4. (10 min) Have Priya open `04_transaction_coordinator` and enter one active deal.
5. (10 min) Questions. Update `DIANA_STANDARDS.md` with anything that doesn't sound like you.

By end of week one: every team member has used their specialist folder on a live case.

**The test**: if you hire a fifth agent in three months, hand them this folder. They should be operational in a day without a call.

---

## If you need to customize

- **Diana's voice sounds off**: edit `DIANA_STANDARDS.md` at the root. All specialists read it.
- **Add a specialist**: copy any existing folder, update the four files, add it to the routing table in `00_orchestrator/rules.md`.
- **Change handoff format**: edit `HANDOFF_SCHEMA.md`. All specialists reference it. One edit, system-wide effect.
