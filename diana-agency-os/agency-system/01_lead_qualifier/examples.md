# Lead Qualifier Examples

---

## Example 1: HOT English-speaking buyer

**Received envelope:** case_id DIANA-20260517-001, language: en, James Park, pre-approved $520K, 78703, August deadline.

**Lead Qualifier output — Lead Card:**
```
LEAD CARD
case_id:    DIANA-20260517-001
name:       James Park
tier:       HOT
language:   en

Intent:     Buyer
Budget:     $520K (pre-approved — confirmed)
Timeline:   Before August school start (firm, ~10 weeks)
Location:   78703 preferred
Constraints: School district driving location choice — confirm which school
Referral:   Unknown — ask on first call
First-time buyer: No signals suggesting yes

What's open:
- Which school is driving 78703 (changes options significantly)
- Current living situation — renting or must-sell?
- Has he toured anything yet?

Recommended next step:
Route to 03_client_communication for intro email today.
Flag to Sara — 78703 at $520K has limited inventory, needs early pipeline work.
```

---

## Example 2: Spanish-speaking first-time buyers

**Received envelope:** case_id DIANA-20260517-002, language: es, Familia Hernández, primera vez compradores.

**Lead Qualifier output — Tarjeta de Lead:**
```
TARJETA DE LEAD
case_id:    DIANA-20260517-002
nombre:     Familia Hernández
nivel:      TIBIO (WARM)
idioma:     es

Intención:   Compradores
Presupuesto: No confirmado — necesita conversación
Cronograma:  No claro — primera vez, explorando
Ubicación:   No especificada
Restricciones: Primera compra — necesitan orientación sobre preaprobación y proceso
Referencia:  Desconocida

Lo que falta:
- Presupuesto o estado de preaprobación
- Cronograma real
- Área preferida en Austin

Próximo paso recomendado:
Ruta a 03_client_communication para correo de bienvenida en español.
Nota: incluir guía de primeros pasos para compradores en español.
```

---

## Example 3: COLD lead — investor, no timeline

**Input:** "Got a referral from Tom — guy named Derek wants to know about investment properties in 78702. No urgency."

**Lead Card:**
```
LEAD CARD
case_id:    DIANA-20260517-003
name:       Derek (last name unknown)
tier:       COLD
language:   en

Intent:     Buyer (investment)
Budget:     Unknown
Timeline:   None stated
Location:   78702
Constraints: Unknown
Referral:   Tom (existing client — note for Diana)

What's open: Everything except location and intent.

Recommended next step:
03_client_communication for a low-pressure intro.
Do not assign Sara or Marcus until tier improves to WARM.
back_to: 01_lead_qualifier if intro email gets a response with more info.
```
