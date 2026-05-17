#!/bin/bash

# Diana's Agency OS — Setup Automation Script
# Generates step-by-step instructions and a file upload bundle

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
AGENCY_SYSTEM="$SCRIPT_DIR/agency-system"
OUTPUT_DIR="$SCRIPT_DIR/.setup-output"

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Color codes for terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${BOLD}Diana's Agency OS — Setup Automation${NC}"
echo "========================================"
echo ""

# Step 1: Generate UPLOAD_BUNDLE.md
echo -e "${BLUE}[1/3] Building upload bundle...${NC}"

cat > "$OUTPUT_DIR/UPLOAD_BUNDLE.md" << 'BUNDLE_START'
# Diana's Agency OS — Upload Bundle

**File Bundle for Claude Project Upload**

This document contains all the files you need to upload to your Claude Project file library.
Copy each section below and paste it into a new file in Claude (name it as indicated).

---

BUNDLE_START

# Function to append a file to the bundle
append_to_bundle() {
    local file_path=$1
    local display_name=$2

    if [ -f "$file_path" ]; then
        echo "" >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        echo "## $display_name" >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        echo "" >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        echo "**Paste into a file named:** \`$(basename $file_path)\`" >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        echo "" >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        echo '```' >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        cat "$file_path" >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
        echo '```' >> "$OUTPUT_DIR/UPLOAD_BUNDLE.md"
    else
        echo "Warning: File not found: $file_path" >&2
    fi
}

# Add core files
append_to_bundle "$AGENCY_SYSTEM/README.md" "Core: README.md"
append_to_bundle "$AGENCY_SYSTEM/DIANA_STANDARDS.md" "Core: DIANA_STANDARDS.md"
append_to_bundle "$AGENCY_SYSTEM/HANDOFF_SCHEMA.md" "Core: HANDOFF_SCHEMA.md"

# Add orchestrator
append_to_bundle "$AGENCY_SYSTEM/00_orchestrator/identity.md" "Specialist: 00_Orchestrator Identity"
append_to_bundle "$AGENCY_SYSTEM/00_orchestrator/rules.md" "Specialist: 00_Orchestrator Rules"
append_to_bundle "$AGENCY_SYSTEM/00_orchestrator/examples.md" "Specialist: 00_Orchestrator Examples"
append_to_bundle "$AGENCY_SYSTEM/00_orchestrator/handoff.md" "Specialist: 00_Orchestrator Handoff"

# Add lead qualifier
append_to_bundle "$AGENCY_SYSTEM/01_lead_qualifier/identity.md" "Specialist: 01_Lead_Qualifier Identity"
append_to_bundle "$AGENCY_SYSTEM/01_lead_qualifier/rules.md" "Specialist: 01_Lead_Qualifier Rules"
append_to_bundle "$AGENCY_SYSTEM/01_lead_qualifier/examples.md" "Specialist: 01_Lead_Qualifier Examples"
append_to_bundle "$AGENCY_SYSTEM/01_lead_qualifier/handoff.md" "Specialist: 01_Lead_Qualifier Handoff"

# Add property research
append_to_bundle "$AGENCY_SYSTEM/02_property_research/identity.md" "Specialist: 02_Property_Research Identity"
append_to_bundle "$AGENCY_SYSTEM/02_property_research/rules.md" "Specialist: 02_Property_Research Rules"
append_to_bundle "$AGENCY_SYSTEM/02_property_research/examples.md" "Specialist: 02_Property_Research Examples"
append_to_bundle "$AGENCY_SYSTEM/02_property_research/handoff.md" "Specialist: 02_Property_Research Handoff"

# Add client communication
append_to_bundle "$AGENCY_SYSTEM/03_client_communication/identity.md" "Specialist: 03_Client_Communication Identity"
append_to_bundle "$AGENCY_SYSTEM/03_client_communication/rules.md" "Specialist: 03_Client_Communication Rules"
append_to_bundle "$AGENCY_SYSTEM/03_client_communication/examples.md" "Specialist: 03_Client_Communication Examples"
append_to_bundle "$AGENCY_SYSTEM/03_client_communication/handoff.md" "Specialist: 03_Client_Communication Handoff"

# Add transaction coordinator
append_to_bundle "$AGENCY_SYSTEM/04_transaction_coordinator/identity.md" "Specialist: 04_Transaction_Coordinator Identity"
append_to_bundle "$AGENCY_SYSTEM/04_transaction_coordinator/rules.md" "Specialist: 04_Transaction_Coordinator Rules"
append_to_bundle "$AGENCY_SYSTEM/04_transaction_coordinator/examples.md" "Specialist: 04_Transaction_Coordinator Examples"
append_to_bundle "$AGENCY_SYSTEM/04_transaction_coordinator/handoff.md" "Specialist: 04_Transaction_Coordinator Handoff"

echo -e "${GREEN}✓ Bundle created: $OUTPUT_DIR/UPLOAD_BUNDLE.md${NC}"
echo ""

# Step 2: Generate STEP_BY_STEP.md
echo -e "${BLUE}[2/3] Generating step-by-step instructions...${NC}"

cat > "$OUTPUT_DIR/STEP_BY_STEP.md" << 'STEPS_START'
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
STEPS_START

echo -e "${GREEN}✓ Instructions created: $OUTPUT_DIR/STEP_BY_STEP.md${NC}"
echo ""

# Step 3: Generate the main setup guide
echo -e "${BLUE}[3/3] Generating setup guide...${NC}"

cat > "$OUTPUT_DIR/HOW_TO_USE.md" << 'GUIDE_START'
# How to Use the Setup Files

This setup package contains three documents to help you get Diana's Agency OS running:

## 1. QUICK_START.md

**What:** Fast-track setup guide (3 steps, 15 minutes)
**When to use:** You want to get operational quickly and don't need detailed explanations
**What it covers:**
- Create the project
- Add custom instructions (one simplified copy-paste)
- Upload files
- Test it

**Reading time:** 3 minutes | **Setup time:** 15 minutes

---

## 2. STEP_BY_STEP.md (this folder)

**What:** Detailed walkthrough with full context
**When to use:** You're doing the setup and want explanations for each step
**What it covers:**
- Detailed instructions for each step
- What to expect at each stage
- Full text of custom instructions (copy-paste ready)
- Verification test
- Next steps guidance

**Reading time:** 5 minutes | **Setup time:** 15 minutes

---

## 3. UPLOAD_BUNDLE.md (this folder)

**What:** All file contents concatenated and ready to paste
**When to use:** You want to see exactly what you're uploading before you upload it
**What it covers:**
- Every file in the system
- Clearly labeled sections
- Copy-paste ready into Claude Project File Library

**Use case:** Review before upload, or share with team for pre-approval

---

## Quickest Path

1. Read `QUICK_START.md` (3 min)
2. Follow the 3 steps (15 min)
3. Test with the provided scenario
4. You're done

---

## If You Want More Detail

1. Read this file (2 min)
2. Read `STEP_BY_STEP.md` (5 min)
3. Follow the detailed instructions (15 min)
4. Reference `UPLOAD_BUNDLE.md` if you want to review files before uploading

---

## Recommended Order

1. **First-time setup?** Use `QUICK_START.md`
2. **Want to review first?** Use `STEP_BY_STEP.md` + `UPLOAD_BUNDLE.md`
3. **Sharing with team?** Give them `QUICK_START.md`
4. **Need governance approval?** Use `UPLOAD_BUNDLE.md` for review

All three guides lead to the same outcome: a fully operational Diana's Agency OS project.
GUIDE_START

echo -e "${GREEN}✓ Setup guide created: $OUTPUT_DIR/HOW_TO_USE.md${NC}"
echo ""

# Final summary
echo ""
echo -e "${BOLD}Setup Complete!${NC}"
echo "========================================"
echo ""
echo "Three files have been generated in:"
echo -e "  ${BLUE}$OUTPUT_DIR${NC}"
echo ""
echo "Next steps:"
echo "  1. Open QUICK_START.md for a 15-minute setup"
echo "  2. Or open STEP_BY_STEP.md for detailed guidance"
echo "  3. Use UPLOAD_BUNDLE.md to review files before upload"
echo ""
echo "All files are ready to share with your team."
echo ""
