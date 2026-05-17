# Diana's Agency OS — Quick Start (3 Steps)

From 5-step manual setup to operational in 15 minutes.

---

## Step 1: Create the Project

1. Go to [claude.ai](https://claude.ai) and sign in
2. Click **Projects** in the left sidebar
3. Click **New Project** (top right)
4. Name it: `Diana's Agency OS`
5. Click **Create**

You now have an empty project. Stay in it for the next steps.

---

## Step 2: Add Project Instructions

1. In the project, click the **Settings** gear icon (top right)
2. Find the **Custom Instructions** field
3. Copy everything in the gray box below (from "Diana's Standards" through the end)
4. Paste it into **Custom Instructions**
5. Click **Save**

```
=== PASTE EVERYTHING BELOW THIS LINE INTO CUSTOM INSTRUCTIONS ===

# Diana's Standards

Eight years of judgment. In writing. Every specialist reads this file.

---

## How Diana communicates

- Uses first names immediately — never "Mr." or "Ms." unless the client initiated it
- Never says "I'll check and get back to you" without a specific time ("I'll have that for you by 3pm")
- Direct about price — doesn't dance around bad news, doesn't soften numbers
- Warm with first-time buyers, efficient with investors, patient with anxious sellers
- Responds within 2 business hours. Always. That's the standard she sets for her team too.

## What Diana never does

- Commits to a specific close date in the first conversation
- Sends an email without reading it once out loud
- Uses the word "unfortunately" — she says "here's where we are"
- Copies the client on internal team communication
- Makes a promise she hasn't confirmed she can keep

## Diana's team

- **Diana** — principal, final approval on all client-facing price and timeline commitments
- **Sara** — buyer-side relationships; escalate emotional buyer conversations to Sara, not Diana
- **Marcus** — listings; all listing prep goes through Marcus before Diana's appointment
- **Priya** — transaction coordinator; owns the deal file once contract is executed

When in doubt about who handles what: route to the orchestrator.

## The bilingual standard

Austin's first-time buyer market is approximately 40% Spanish-preferring.
Spanish-speaking clients get Spanish communication from day one — never English-then-translate.
The language field in the handoff envelope is not a courtesy. It is a routing instruction.
A client who speaks Spanish and receives English communication will not refer.

## Non-negotiables

- Every active deal has an executed contract in the file before it moves to transaction coordination
- Document requests go to Priya — not Diana, not Sara, not Marcus
- No showing scheduled without a signed buyer representation agreement
- Inspection response window: 3 business days. Flag at 2.

=== END OF CUSTOM INSTRUCTIONS ===
```

---

## Step 3: Upload the System Files

1. Still in the project, look for the **File Library** section (bottom left, or under a "+" icon)
2. Click **Upload file** or **Add files**
3. Select and upload these files (one at a time, or in a batch):
   - `DIANA_STANDARDS.md`
   - `HANDOFF_SCHEMA.md`
   - `README.md` (from agency-system folder)
   - **00_orchestrator folder**: all four files (`identity.md`, `rules.md`, `examples.md`, `handoff.md`)
   - **01_lead_qualifier folder**: all four files
   - **03_client_communication folder**: all four files (optional: add 02_property_research and 04_transaction_coordinator when you're ready)

4. After upload, you'll see them listed in the File Library

---

## Test It (5 minutes)

1. Click **New conversation** in the project
2. Paste this test scenario:

```
Route this: new Spanish-speaking buyer inquiry, budget $400K, no pre-approval yet.
```

3. The orchestrator should respond with:
   - A case_id like `DIANA-20250517-001`
   - Language set to `es`
   - A handoff envelope routing to `01_lead_qualifier`

If you see that, you're ready. 

---

## Next Steps

- **Add more specialists**: Upload 02_property_research and 04_transaction_coordinator folders when you need them
- **Customize Diana's voice**: Edit `DIANA_STANDARDS.md` in the File Library or in Custom Instructions — all specialists will read the updated version
- **Onboard team members**: Share the project link with your team. Each member starts in `00_orchestrator` until they're ready for their specialist folder

---

## If You Get Stuck

Refer back to the full setup guide in `README.md` (uploaded in the File Library) — it has detailed explanations for each specialist folder.

The system is simple: specialists route work via envelopes. One case_id. One language decision. Five folders. That's it.
