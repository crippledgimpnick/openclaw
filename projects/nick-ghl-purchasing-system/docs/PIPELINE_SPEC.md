# Pipeline Specification

## Primary Pipeline
**Name:** `Purchasing Operations`

This is the main operational pipeline for all active transactions related to buying unused, non-expired diabetic supplies from sellers.

## Design Principle
Use one primary pipeline for execution instead of splitting early into multiple pipelines.

Reasons:
- easier reporting
- cleaner handoff between stages
- simpler automation maintenance
- less duplication
- easier operator visibility

## Opportunity Model
One contact may have multiple opportunities over time.
Each opportunity represents one active sale cycle.

## Stage List

### 1. New Lead
Lead has entered the system and has not yet been properly worked.

**Entry conditions:**
- new form submission
- new inbound text
- new Facebook lead/message
- manual import
- manual record creation

**Exit condition:**
First outreach sent or first manual handling completed.

### 2. Attempted Contact
Initial acknowledgment or outreach has been sent.

**Purpose:**
Track leads that have been touched but not yet engaged in a real intake conversation.

### 3. Qualifying
The lead is active and the system is collecting deal-critical information.

**Target information:**
- brand
- product type
- quantity
- expiration date
- condition
- photos

### 4. Quote Review
Enough information is present to review internally.
This stage is for internal processing, not seller-facing acceptance.

### 5. Quote Sent
An offer has been sent to the seller.

### 6. Negotiation
The seller is actively discussing, countering, hesitating, or asking questions after the initial quote.

### 7. Accepted, Awaiting Shipment
Seller has agreed and now must ship or otherwise deliver the product.

### 8. In Transit
Tracking exists or shipment has been confirmed.

### 9. Received, Pending Inspection
Package has arrived and must be checked before approval.

### 10. Approved, Pending Payment
Inspection is complete and payout is authorized but not yet sent.

### 11. Paid, Closed Won
Transaction is complete and payout has been sent.

### 12. Closed Lost
The lead or deal did not convert.

**Common reasons:**
- no response
- invalid product
- unacceptable expiration date
- seller declined
- pricing disagreement
- condition issue

### 13. Nurture / Reactivation
The lead is not active now but is worth future follow-up.

## Stage Governance Rules
- Only move a deal into `Quote Review` when core intake data is complete.
- Only move a deal into `Quote Sent` when a human-approved quote exists.
- Only move a deal into `Accepted, Awaiting Shipment` when the seller clearly accepts.
- Only move a deal into `Approved, Pending Payment` after receipt and inspection.
- Only move a deal into `Paid, Closed Won` once payment is actually sent.
- Use `Nurture / Reactivation` for non-dead but inactive opportunities.

## Reporting Recommendations
Track at minimum:
- new leads created
- contact rate
- qualification completion rate
- quote sent rate
- acceptance rate
- shipment completion rate
- payment completion rate
- repeat seller rate
- loss reasons by category
- time in stage

## Future Expansion
Only create additional pipelines later if one of these becomes true:
- multiple brands or business units require separate operators
- a second substantially different acquisition model is introduced
- reporting becomes impossible in one pipeline
- compliance or staffing needs demand hard separation
