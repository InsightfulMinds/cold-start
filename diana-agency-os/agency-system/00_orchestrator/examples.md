# Orchestrator Examples

---

## Example 1: New English-speaking buyer

**Input:** "Just got a call from James Park — pre-approved for $520K, wants to be in a home before school starts in August, interested in 78703."

**Orchestrator output:**
```
case_id:  DIANA-20260517-001
from:     00_orchestrator
to:       01_lead_qualifier
back_to:  00_orchestrator
status:   active
language: en
priority: normal

What I Know:
- Prospect: James Park
- Pre-approved: $520K
- Timeline: before August school start (firm)
- Area preference: 78703

What I Don't Know:
- Buyer or seller?
- Family size / property needs
- Current living situation (renting, needs to sell?)
- Specific school preference driving the 78703 ask

Risks I Flagged:
- August timeline is tight for 78703 inventory at this price point — flag to Sara early

My Deliverable:
Routing to lead qualifier for full qualification.
```

---

## Example 2: Spanish-speaking first-time buyer

**Input:** "Llamó una familia — los Hernández — quieren comprar casa, primera vez, no saben por dónde empezar."

**Orchestrator output:**
```
case_id:  DIANA-20260517-002
from:     00_orchestrator
to:       01_lead_qualifier
back_to:  00_orchestrator
status:   active
language: es
priority: normal

What I Know:
- Prospect: Familia Hernández
- First-time buyers
- Spanish-preferring

What I Don't Know:
- Budget, timeline, location preference
- Pre-approval status
- Who referred them

Risks I Flagged:
- First-time buyers need education track, not just qualification
- All communication in Spanish from this point forward

My Deliverable:
Routing to lead qualifier. Language flag set: es.
```

---

## Example 3: Returned stalled deal

**Input:** Envelope returned from 04_transaction_coordinator with `back_to: 03_client_communication`, status: stalled. Reason: lender pushed approval 10 days, buyer needs communication.

**Orchestrator output:**
Re-routes the full envelope to 03_client_communication unchanged. Adds one line to "What I Know": "Deal stalled — lender delay 10 days. TC is tracking new close date. Buyer needs update."
Does not create a new case_id. Does not modify existing fields.
