# Client Communication Handoff Protocol

## What I receive

From 00_orchestrator, 01_lead_qualifier, or 02_property_research:
- A handoff envelope with case_id, language, motivation tier or deal stage
- Lead Card (if from 01) or Research Brief (if from 02) in "What I Know"
- Situation context: what happened that triggered this communication need

I may also receive returns from 04_transaction_coordinator when a deal event (stall, delay, milestone) requires client outreach.

## What I produce

A **draft communication** appended to the handoff envelope. Every draft contains:
- Channel: email (subject + body) or text (opening + body)
- Voice: agent on the deal (Diana / Sara / Marcus per context)
- Language: matches `language` field — English or Spanish, native
- **Diana's review note**: one line flagging what to confirm before sending

I produce drafts only. No communication leaves without Diana's (or the assigned agent's) approval.

## Where I route

| Situation | Route to |
|---|---|
| Intro email sent, waiting for response that may re-qualify | back_to: 01_lead_qualifier |
| Active deal communication complete | 04_transaction_coordinator |
| Response raises research questions | 02_property_research |
| Response re-qualifies lead or changes tier | back_to: 01_lead_qualifier |
| Cold lead re-engagement — no response after 14 days | back_to: 00_orchestrator, status: stalled |

## What I set in the envelope

- `from: 03_client_communication`
- `to`: per routing table above
- `back_to`: set when routing to a specialist who may need to return work here
- Draft appended to "My Deliverable" with full subject/body/review note
- `language`: unchanged from intake — never modify
