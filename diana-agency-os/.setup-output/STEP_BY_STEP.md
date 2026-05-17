# Diana's Agency OS — Setup Instructions

## Prerequisites

- A Claude.ai account
- Access to create projects
- All system files from this setup package
- 15 minutes

---

## Step 1: Create the Claude Project (2 minutes)

1. Go to **[claude.ai](https://claude.ai)** and sign in
2. Click **Projects** in the left sidebar
3. Click **New Project** button (top right corner)
4. Enter the project name: `Diana's Agency OS`
5. Click **Create**

You now have a blank project. Keep this window open.

---

## Step 2: Add Custom Instructions (2 minutes)

1. In your new project, click the **Settings** gear icon (top right)
2. Find the **Custom Instructions** section (you may need to scroll)
3. Copy the text below:

```
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
```

4. Paste it into the **Custom Instructions** field
5. Click **Save**

---

## Step 3: Upload Files (10 minutes)

In the same project, upload the following files to the **File Library**:

### Core Files (Upload First)
- `README.md`
- `DIANA_STANDARDS.md`
- `HANDOFF_SCHEMA.md`

### Specialist Folders (Upload in Order)
For each specialist folder, upload these 4 files together:

**00_Orchestrator:**
- `identity.md`
- `rules.md`
- `examples.md`
- `handoff.md`

**01_Lead_Qualifier:**
- `identity.md`
- `rules.md`
- `examples.md`
- `handoff.md`

**02_Property_Research:** (optional on day 1)
- `identity.md`
- `rules.md`
- `examples.md`
- `handoff.md`

**03_Client_Communication:**
- `identity.md`
- `rules.md`
- `examples.md`
- `handoff.md`

**04_Transaction_Coordinator:** (optional on day 1)
- `identity.md`
- `rules.md`
- `examples.md`
- `handoff.md`

**Upload method:**
1. Click the **File Library** button or the **+** icon in your project
2. Click **Upload** or **Add Files**
3. Drag and drop, or select from your computer
4. Confirm each upload

---

## Step 4: Verify It Works (1 minute)

1. Click **New Conversation** in the project
2. Paste this test message:

```
Route this: new Spanish-speaking buyer inquiry, budget $400K, no pre-approval yet.
```

3. The orchestrator should respond with:
   - A case_id (e.g., `DIANA-20250517-001`)
   - Language detected as `es`
   - A full handoff envelope routing to `01_lead_qualifier`

If you see that, **you're done.** Your system is operational.

---

## What Happens Next

- Your team now has a project with 5 specialists
- Each conversation can route through the system
- New leads become case_ids that never get lost
- Team members can pick up from any specialist they need

Start with the orchestrator and lead qualifier. Add property research and transaction coordination once you're comfortable with the flow.

---

## Questions?

Refer to `README.md` (uploaded in file library) for detailed documentation on each specialist role.
