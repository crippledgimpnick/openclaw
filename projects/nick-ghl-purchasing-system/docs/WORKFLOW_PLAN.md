# Workflow Plan

## Workflow Philosophy
Workflows should reduce delay, enforce consistency, and surface exceptions. They should not pretend to make business decisions that have not been defined.

## Workflow Priority Order
1. New Lead Capture and Routing
2. Qualification and Quote Readiness
3. Quote to Close Management
4. Repeat Seller Identification
5. Shipment and Payment Control
6. Reactivation

---

## Workflow 1: New Lead Capture and Routing

### Objective
Capture every lead, deduplicate the contact, create the right opportunity, and ensure fast first-touch handling.

### Trigger Sources
- form submission
- inbound SMS
- Facebook message or lead sync
- call event if used operationally
- manual lead creation

### Inputs Needed
- seller identity data available from source
- source identifier
- contact channel
- owner logic if applicable

### Core Actions
1. Create or update contact.
2. Check for existing active opportunity to avoid duplication.
3. Create opportunity in `New Lead` if appropriate.
4. Apply source tag.
5. Apply seller-type logic.
6. Assign owner or queue.
7. Send acknowledgment.
8. Create internal task if source data is incomplete.
9. Move to `Attempted Contact` after first outbound contact is logged or sent.
10. Start no-response follow-up timer.

### Decision Rules
- If prior completed deals exist, mark as repeat seller.
- If an active opportunity already exists for the same seller and same selling event, update instead of creating a duplicate.
- If source quality is poor, task a human rather than guessing.

### Success Outcome
Every new lead is visible, assigned, and touched quickly.

---

## Workflow 2: Qualification and Quote Readiness

### Objective
Collect the minimum viable deal information needed for internal quote review.

### Required Quote-Ready Data
- product brand
- product type
- quantity
- expiration date
- package condition
- photos received or documented exception

### Trigger Events
- reply from lead
- `intake_started` tag added
- intake form submitted
- manual field updates

### Core Actions
1. Check which required fields are missing.
2. Request missing information in a clean sequence.
3. Update fields as information is received.
4. Apply `product_details_received` and `photos_received` tags when appropriate.
5. Apply `intake_incomplete` while key data is missing.
6. Apply `quote_ready` once complete.
7. Move to `Qualifying` while data is being collected.
8. Move to `Quote Review` once ready.
9. Create internal review task.
10. If exception conditions exist, apply `needs_manual_review`.

### Decision Rules
- Do not mark quote-ready if any critical field is missing.
- Do not auto-clear manual review without a human action.
- If details conflict, keep the record in review territory rather than pushing forward.

### Success Outcome
Leads arrive at quote review with usable, standardized intake data.

---

## Workflow 3: Quote to Close Management

### Objective
Carry the deal from quote delivery to payment completion without losing visibility.

### Trigger Events
- quote amount entered
- stage changed to `Quote Sent`
- `offer_sent` tag added
- offer status updated
- tracking number added
- payment status updated

### Core Actions
1. Launch quote follow-up sequence.
2. Monitor seller response status.
3. Move to `Negotiation` if seller counters or hesitates.
4. Move to `Accepted, Awaiting Shipment` when seller accepts.
5. Send shipment next-step instructions.
6. Wait for tracking or shipping confirmation.
7. Move to `In Transit` when shipment is confirmed.
8. Move to `Received, Pending Inspection` when package arrives.
9. Move to `Approved, Pending Payment` when inspection passes.
10. Move to `Paid, Closed Won` when payment is sent.
11. Move to `Closed Lost` or `Nurture / Reactivation` when the deal stalls or dies.

### Decision Rules
- Acceptance must be explicit.
- Payment completion must reflect reality, not intention.
- Deals that go quiet after quote should be followed up, then either nurtured or closed with reason.

### Success Outcome
No accepted or late-stage deal disappears into the floorboards.

---

## Workflow 4: Repeat Seller Identification

### Objective
Recognize and prioritize prior sellers automatically.

### Core Actions
- detect prior completed deals
- update seller type
- apply `seller_repeat`
- raise follow-up priority if desired
- expose prior transaction count and last sell date

### Success Outcome
Warm sellers are handled like warm sellers, not strangers.

---

## Workflow 5: Shipment and Payment Control

### Objective
Protect revenue by keeping fulfillment and payout stages visible.

### Core Actions
- alert on accepted but not shipped
- alert on shipped but not received after expected window
- alert on received but not inspected
- alert on approved but unpaid
- create internal tasks for stuck deals

### Success Outcome
Late-stage bottlenecks become operationally visible.

---

## Workflow 6: Reactivation

### Objective
Recover stale opportunities and past sellers systematically.

### Core Actions
- identify stale leads
- identify lapsed prior sellers
- send reactivation messages on schedule
- reopen or create new opportunity based on final system rule

### Success Outcome
The database keeps producing value instead of becoming a graveyard.
