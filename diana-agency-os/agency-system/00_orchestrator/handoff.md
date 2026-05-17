# Orchestrator Handoff Protocol

## What I receive

**At intake (no prior envelope):**
- A raw request in any format — Slack message, voice note summary, email forward, typed description
- May include: prospect name, contact info, situation description, urgency signals
- May be in English or Spanish

**As a return (envelope already exists):**
- A full handoff envelope from any specialist
- `back_to` field pointing to 00_orchestrator
- Status set to `stalled` or a specific re-route reason in "Risks I Flagged"

## What I produce

A complete handoff envelope (see HANDOFF_SCHEMA.md) with:
- A new `case_id` (intake only — never reassign on returns)
- `to` set to the correct specialist
- `back_to` set to 00_orchestrator (unless the receiving specialist is clearly terminal)
- `language` set based on intake signals
- "What I Know" populated from the incoming request
- "What I Don't Know" flagging gaps the receiving specialist must resolve

## What I never produce

- Research
- Draft communication
- Qualification assessments
- Deal files

## On returns

When I receive a return, I re-route without modification. I add context to "What I Know" only. I do not change `case_id`, `language`, or `status` unless status is `stalled` and I'm re-activating.
