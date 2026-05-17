# Skool Post — Week 4 Competition

## Repo link
https://github.com/seanvargas/cold-start/tree/main/diana-agency-os/agency-system
(update with actual GitHub username after push)

## 100-word writeup (paste this into the comment)

Diana's Agency OS is a five-specialist ICM system — orchestrator, lead qualifier, property research, client communication, and transaction coordinator. A shared `HANDOFF_SCHEMA.md` at the root defines the envelope every specialist reads and writes so the contract can't drift between folders.

Design decision: the `back_to` field in every handoff. Real estate deals don't move linearly — a lender delay routes back to comms, a stalled inspection routes back to research. The system is built for how deals actually move, not how a flowchart assumes.

One thing I'd add: a client intake form that auto-populates the first handoff envelope. No manual entry on first contact.

---

## Push instructions

1. Go to github.com → New repository → name it `cold-start`, public, no README (we have one)
2. Run these three commands from your terminal:

```bash
cd ~/cold-start
git remote add origin https://github.com/YOUR_USERNAME/cold-start.git
git push -u origin main
```

3. Verify the repo at github.com/YOUR_USERNAME/cold-start
4. Update the repo link above and paste the writeup into the Skool comment thread
5. Deadline: Sunday May 17 at 9:00 AM PT
