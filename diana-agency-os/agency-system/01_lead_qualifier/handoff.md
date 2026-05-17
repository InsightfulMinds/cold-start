# Lead Qualifier Handoff Protocol

## What I receive

A handoff envelope from 00_orchestrator with:
- `case_id` already assigned
- `language` already set
- "What I Know": prospect name, any info from the initial contact
- "What I Don't Know": gaps the orchestrator flagged

I may also receive a return envelope from 03_client_communication with `back_to: 01_lead_qualifier` when an intro email has generated a response that contains new qualification information.

## What I produce

**A Lead Card appended to the handoff envelope**, containing:
- Prospect name and contact
- Motivation tier: HOT / WARM / COLD
- Intent, budget, timeline, location, constraints, referral source
- First-time buyer flag (yes/no)
- Language flag (preserved from intake)
- "What's open" — explicit list of unanswered questions
- Recommended next step with specific routing

The Lead Card travels with the envelope. It is not a separate document.

## Where I route

| Situation | Route to |
|---|---|
| HOT buyer needs intro email | 03_client_communication |
| HOT buyer needs research before intro | 02_property_research |
| WARM lead needs intro email | 03_client_communication |
| COLD lead needs low-pressure intro | 03_client_communication |
| Lead goes unresponsive after 14 days | back_to: 00_orchestrator, status: stalled |
| Email response contains new qualification info | 01_lead_qualifier (return, re-process) |

## What I set in the envelope

- `from: 01_lead_qualifier`
- `to`: per routing table above
- `back_to: 01_lead_qualifier` when routing to comms for intro (in case response needs re-qualification)
- `status: active` unless lead is unresponsive
- `language`: unchanged from intake — never modify
