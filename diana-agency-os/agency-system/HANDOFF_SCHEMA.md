# Handoff Schema — Diana's Agency OS

Every specialist reads this file before accepting work. Every specialist writes this structure before passing work.
This file is the contract. Do not paraphrase it. Do not invent new fields.

---

## The Handoff Envelope

```
case_id:   [DIANA-YYYYMMDD-NNN]     # Assigned by orchestrator at intake. Never changes.
from:      [folder_name]             # Who produced this handoff
to:        [folder_name]             # Who receives this handoff
back_to:   [folder_name | null]      # Where to return if blocked. null = close out.
status:    [active | stalled | closed]
language:  [en | es | bilingual]     # Client's preferred communication language
priority:  [normal | urgent]         # urgent = deadline within 48h

## What I Know
[Confirmed facts only. No assumptions. No speculation.]

## What I Don't Know
[Open questions. The receiving specialist owns answering these.]

## Risks I Flagged
[Deadline risks, emotional client signals, legal/compliance notes, financing flags.]

## My Deliverable
[What I produced. File name, draft text, or summary. Be specific.]
```

---

## Rules for Every Specialist

1. Never strip fields. Pass the full envelope forward, even fields you didn't touch.
2. The `case_id` never changes from intake to close.
3. `back_to` is not optional when you're routing work that may stall. Set it.
4. `language` is set at intake and follows the case forever. Never change it without orchestrator approval.
5. If you receive a handoff with `back_to` pointing to you — honor it immediately. That's a return, not a new request.
6. Status is `stalled` the moment you can't move forward. Don't sit on it.

---

## Handoff Chain (default flow)

```
00_orchestrator
    → 01_lead_qualifier       (new prospect)
    → 02_property_research    (research request or active deal)
    → 03_client_communication (draft needed)
    → 04_transaction_coordinator (contract executed)

back_to flows are lateral or backward — any specialist can return to any other.
```
