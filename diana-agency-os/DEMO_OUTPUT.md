# Diana's Agency OS — Stalled Deal Demo Output

This is the proof run judges should read after the landing page.

## Test Input

```text
Route this: new Spanish-speaking buyer inquiry, budget $400K, Mueller area,
no pre-approval yet, family needs to move before August.
```

## 1. Orchestrator

```yaml
case_id: DIANA-20260517-042
from: 00_orchestrator
to: 01_lead_qualifier
back_to: 00_orchestrator
status: active
language: es
priority: urgent
```

The Orchestrator does not try to answer everything. It preserves the case ID,
detects Spanish preference, and routes the work to the right specialist.

## 2. Lead Qualifier

The lead is marked HOT because the family has a firm school-year deadline,
clear budget range, and immediate housing intent. Missing pre-approval becomes
the first risk, not an afterthought.

```yaml
from: 01_lead_qualifier
to: 03_client_communication
back_to: 01_lead_qualifier
status: active
language: es
risk_flags:
  - no pre-approval yet
  - deadline before August
  - first-time buyer anxiety likely
```

## 3. Client Communication

The communication specialist writes in Spanish from the source facts. It does
not draft in English and translate later.

```text
Hola Carlos,

Gracias por contarme lo que necesita tu familia. Entiendo que agosto no es una
fecha flexible cuando hay escuela de por medio.

El primer paso no es ver casas todavía. Es confirmar la pre-aprobación para que
Diana pueda mostrarte opciones reales cerca de Mueller sin ponerte en una
posición débil cuando llegue el momento de hacer una oferta.
```

## 4. Property Research

Research receives the case after qualification and checks whether the desired
area, budget, and timing are realistic. If the buyer asks a question Comms
cannot safely answer, the case routes back with context intact.

```yaml
from: 03_client_communication
to: 02_property_research
back_to: 03_client_communication
status: stalled
language: es
urgent_reason: buyer needs a verified answer before tomorrow's tour window
open_question: confirm HOA restriction from source document
```

## 5. Why This Matters

Most demos show clean forward routing. Diana's Agency OS shows recovery routing:
the language, owner, risk, and return path travel together when the deal stops
moving in a straight line.
