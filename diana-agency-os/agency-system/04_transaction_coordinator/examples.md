# Transaction Coordinator Examples

---

## Example 1: New active deal intake

**Received:** Executed contract for 1847 Brentwood Ave, buyer James Park (case_id DIANA-20260517-001), target close June 15.

**Deal file created: DIANA-20260517-001-deal.md**

```
DEAL FILE
case_id:     DIANA-20260517-001
status:      active
agent:       Sara (buyer's side)
client:      James Park
property:    1847 Brentwood Ave 78703
close target: June 15, 2026

MILESTONE DATES (calculated from June 15 close):
- Option period ends: May 22 (5 days from contract execution May 17)
- Inspection due: May 21 (before option expires)
- Repair amendment deadline: May 24
- Loan approval deadline: June 1
- Title commitment: June 3
- Closing disclosure to buyer: June 12 (3-day window)
- Final walkthrough: June 14
- Closing: June 15

DOCUMENT CHECKLIST:
[x] Executed purchase contract — received May 17
[ ] Earnest money receipt — due May 19
[ ] Option period confirmation
[ ] Inspection report — due May 21
[ ] Repair amendment (if applicable)
[ ] Title commitment
[ ] Loan approval
[ ] Closing disclosure
[ ] Final walkthrough confirmation
[ ] Closing documents

OPEN ITEMS:
- Earnest money wire confirmation — James owns — due May 19
- Inspection scheduling — Sara owns — due May 20

AUDIT LOG:
2026-05-17 09:15 — Deal file created. Contract executed. Option period active.

⚠️ NEXT FLAG: Inspection due May 21 — notify Sara by May 19 if not scheduled.
```

---

## Example 2: Stalled deal — lender delay

**Situation:** Lender pushed loan approval from June 1 to June 11. Close date at risk.

**TC actions:**
1. Recalculate all dependent dates:
   - New loan approval: June 11
   - New closing disclosure: June 22 (3-day window)
   - New close target: June 25 (requires seller extension)
2. Update deal file status and audit log
3. Flag to orchestrator: seller extension needed
4. Route to 03_client_communication for buyer update

**Handoff envelope update:**
```
status:    stalled
back_to:   04_transaction_coordinator
Risks I Flagged: Lender delay — 10 days. Seller extension not yet signed. 
New close June 25 tentative. Client communication needed today.
My Deliverable: Deal file updated with recalculated dates. Routing to 03 for client draft.
```

---

## Example 3: 11pm document question (what this system prevents)

**Without this system:** New agent Slacks Diana at 11pm: "The inspection report came in — where does it go?"

**With this system:** New agent opens deal file, finds document routing table in rules.md:
> Inspection report → Deal file. Priya files, flags repair asks to agent.

Agent files the report, adds a note to the open items register, flags repair asks.
No Slack needed. Diana sleeps.
