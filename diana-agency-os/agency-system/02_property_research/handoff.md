# Property Research Handoff Protocol

## What I receive

From 00_orchestrator or 01_lead_qualifier:
- A handoff envelope with case_id and language field
- "What I Know": prospect details, property address or criteria, deadline if applicable
- "What I Don't Know": gaps to resolve if possible

I may also receive from 04_transaction_coordinator when a deal requires re-appraisal research or a new comp pull mid-transaction.

## What I produce

A **Research Brief** appended to the handoff envelope. The brief always contains:
- Recommended price range (listing) or neighborhood shortlist (buyer)
- Minimum 3 comps with address, size, sold price, date, and days on market
- Market context: DOM average, price/sq ft trend, inventory level
- Flags: HOA, permit issues, flood zone, distressed sale
- Research date (required — data expires in 72h)
- 3 talking points for the agent going into the client conversation

The brief is self-contained. The receiving agent should not need to call anyone to use it.

## Where I route

| Situation | Route to |
|---|---|
| Research complete, client needs outreach | 03_client_communication |
| Research complete, active deal needs tracking | 04_transaction_coordinator |
| Research request is unclear or out of scope | back_to: 00_orchestrator |
| Re-appraisal requested mid-deal | back_to: 04_transaction_coordinator when complete |

## What I set in the envelope

- `from: 02_property_research`
- `to`: per routing table above
- `back_to`: set when returning to a deal already in TC
- Research brief added to "My Deliverable"
- Flags added to "Risks I Flagged" if anything material was found
