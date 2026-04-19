# MASTER SYSTEM SPEC

## Document Role
This is the governing specification for the Nick GoHighLevel Purchasing System project.

If any supporting document, note, draft, or implementation artifact conflicts with this file, this file takes precedence until formally updated.

## Project Owner
Nick

## System Builder / Orchestrator
Master Splinter

## Project Mission
Design, document, and help implement an end-to-end system inside GoHighLevel that manages:
- incoming leads
- repeat sellers
- follow-ups
- qualification
- quote readiness
- negotiation support
- shipping coordination
- payment status
- reactivation

The system must be:
- practical
- simple to operate
- scalable
- conversion-focused
- safe against bad automation assumptions

## Business Context
The business buys unused, non-expired diabetic supplies from customers.
Lead sources may include:
- forms
- ads
- Facebook messages
- text follow-up
- phone calls
- recurring sellers
- manual lead entry

## Primary Design Decisions

### 1. One main operational pipeline
The project will begin with one primary pipeline named:
`Purchasing Operations`

Reason:
- clearer visibility
- simpler reporting
- easier automation maintenance
- smoother operator control

### 2. Contacts represent sellers
Each contact is the long-term seller profile.
A contact may have multiple opportunities over time.

### 3. Opportunities represent active transactions
Each opportunity tracks one current purchase cycle.

### 4. Structured data beats note chaos
Critical operational values must live in fields, not only in conversation history or notes.

### 5. Human approval remains required for undefined pricing and exceptions
No automation should guess pricing policy or approve edge cases without a defined business rule.

### 6. Build the operating structure before the sales-agent layer
The system foundation comes first.
Messaging agents, negotiation prompts, and conversation scripting come later.

## Core Operational Objectives
Priority order:
1. organize lead flow
2. improve response speed
3. improve conversion rate
4. reduce manual admin work
5. create repeatable SOPs
6. create reusable templates and prompts

## Operational Scope
The first version of the system must support:
- new inbound leads
- attempted contact tracking
- active qualification
- quote review
- quote sent management
- negotiation handling
- accepted deals awaiting shipment
- in-transit shipment visibility
- received inventory pending inspection
- approved but unpaid deals
- paid closed deals
- lost opportunities
- nurture and reactivation
- repeat seller identification

## Pipeline Standard
The approved pipeline stages are:
1. New Lead
2. Attempted Contact
3. Qualifying
4. Quote Review
5. Quote Sent
6. Negotiation
7. Accepted, Awaiting Shipment
8. In Transit
9. Received, Pending Inspection
10. Approved, Pending Payment
11. Paid, Closed Won
12. Closed Lost
13. Nurture / Reactivation

These stage names should not be changed casually because reporting and workflow logic will depend on them.

## Data Standard

### Contact-level data exists for:
- seller profile
- relationship history
- repeat-seller status
- communication preference
- activity history
- reliability and risk notes

### Opportunity-level data exists for:
- product details
- quantity
- expiration
- condition
- photos received
- quote values
- offer status
- shipping status
- inspection status
- payment status
- loss reason
- next follow-up timing

## Automation Standard
The first automation build sequence is:
1. New Lead Capture and Routing
2. Qualification and Quote Readiness
3. Quote to Close Management

The second automation wave is:
4. Repeat Seller Identification
5. Shipment and Payment Control
6. Reactivation

## Non-Negotiable Rules
- Do not invent pricing.
- Do not promise acceptance before review.
- Do not mark payment complete before it is sent.
- Do not allow stage changes to replace field-level tracking.
- Do not automate exceptions until explicit rules exist.
- Do not overbuild version 1.

## Manual Review Conditions
A record must be routed to manual review if:
- required photos are missing
- product details conflict
- expiration timing is questionable
- packaging or seal condition is questionable
- price exception may be needed
- unsupported products are offered
- seller behavior or data raises risk concerns

## Reporting Standard
The system should eventually report on:
- lead volume by source
- first response speed
- qualification completion rate
- quote-ready rate
- quote sent rate
- acceptance rate
- shipment completion rate
- payment turnaround
- repeat seller rate
- closed lost reasons
- average time in stage

## Documentation Standard
Every meaningful project change should result in one or more of the following:
- update to this master spec if the change affects governing design
- supporting document update in `docs/`
- changelog entry in `CHANGELOG.md`

## Rollout Standard
Implementation should happen in phases:
- foundation
- data model
- core workflows
- operational controls
- QA and test scenarios
- go-live readiness
- optimization

## Open Questions Requiring Future Decisions
These are intentionally unresolved until Nick defines policy:
- pricing model by product type and expiration band
- acceptable product categories list
- disqualifying condition thresholds
- payout approval rules
- shipping instruction variations
- payment method and timing rules
- reactivation timing policy
- owner assignment rules when volume grows

## Definition of Success
Version 1 is successful when:
- every new lead is captured and routed consistently
- no active deal lacks a clear stage
- intake requirements are visible and standardized
- quote follow-up is consistent
- shipment and payment status are visible
- repeat sellers are identifiable
- the system reduces manual chaos rather than adding it

## Change Control
Any major change to pipeline structure, field design, workflow logic, or automation behavior should be recorded in `CHANGELOG.md` and, if strategic, reflected here.
