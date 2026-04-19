# Data Model

## Record Design

### Contact Record = Seller Master Profile
Use the contact record to store durable information about the seller across multiple transactions.

### Opportunity Record = Active Deal
Use the opportunity to track the current selling event and workflow state.

This separation prevents duplicate seller histories and keeps repeat-customer reporting usable.

## Tag Strategy
Tags should be used for routing, segmentation, and automation triggers, not as a replacement for structured fields.

### Source Tags
- `src_form`
- `src_facebook`
- `src_ad`
- `src_phone`
- `src_sms`
- `src_repeat_seller`
- `src_manual`

### Seller Type Tags
- `seller_new`
- `seller_repeat`
- `seller_high_value`
- `seller_inactive`

### Intake Tags
- `intake_started`
- `intake_incomplete`
- `product_details_received`
- `photos_received`
- `quote_ready`
- `needs_manual_review`

### Deal Status Tags
- `offer_sent`
- `negotiating`
- `offer_accepted`
- `offer_declined`
- `followup_required`

### Fulfillment / Payment Tags
- `awaiting_shipment`
- `in_transit`
- `received_pending_inspection`
- `payment_pending`
- `paid`

### Reactivation Tags
- `reengage_30`
- `reengage_60`
- `reengage_90`

## Contact Fields

### Identity and Segmentation
- `Seller Type` — dropdown
- `Preferred Contact Channel` — dropdown
- `Assigned Owner` — user reference or text depending on GHL setup
- `Last Seller Activity Date` — date
- `Total Completed Deals` — number
- `Lifetime Payout Total` — currency/number
- `Repeat Seller Candidate` — yes/no
- `Compliance / Risk Flag` — dropdown or yes/no
- `Do Not Auto-Negotiate` — yes/no

### Relationship Context
- `Best Time To Contact` — text or dropdown
- `City` — text
- `State` — text
- `Last Product Type Sold` — text
- `Seller Reliability Note` — long text

## Opportunity Fields

### Lead and Intake
- `Lead Source Detail` — text or dropdown
- `Product Brand` — text or dropdown
- `Product Type` — text or dropdown
- `Quantity Offered` — number
- `Expiration Date` — date
- `Box / Seal Condition` — dropdown
- `Photos Received` — yes/no
- `Product Details Complete` — yes/no
- `Manual Review Required` — yes/no

### Pricing and Offer
- `Seller Expected Amount` — currency/number
- `Quoted Amount` — currency/number
- `Minimum Approved Buy Price` — currency/number
- `Offer Status` — dropdown
- `Quote Sent Date` — date/time

### Logistics
- `Shipment Tracking Number` — text
- `Shipment Status` — dropdown
- `Received Date` — date
- `Inspection Status` — dropdown

### Payment
- `Approved Payment Amount` — currency/number
- `Payment Status` — dropdown
- `Payment Sent Date` — date

### Outcome Management
- `Loss Reason` — dropdown
- `Next Follow-Up Date` — date
- `Follow-Up Priority` — dropdown

## Required Data for Quote Readiness
A deal should not be treated as quote-ready until these are present:
- product brand
- product type
- quantity
- expiration date
- condition
- photos or a manual exception

## Manual Review Triggers
Mark `Manual Review Required = Yes` if any of the following are true:
- photos are missing
- details conflict
- expiration is outside allowed range
- brand or product is unusual
- seller asks for unsupported terms
- packaging condition is questionable
- pricing authority is unclear

## Data Hygiene Rules
- Do not create duplicate contacts for repeat sellers.
- Do not store core decision logic only in notes if a field can hold it.
- Keep loss reasons standardized.
- Use stage and field changes together, not stage changes alone.
- Use internal notes for nuance, but store key operational values in fields.
