# Nick GHL Purchasing System

This folder is the working home for the GoHighLevel purchasing system project for Nick's business.

## Purpose
Build a practical, scalable operating system inside GoHighLevel to manage:
- inbound leads
- seller qualification
- quote readiness
- negotiation
- shipment coordination
- payment tracking
- repeat seller management
- reactivation

## Source of Truth
The final authority for this project is:
- `MASTER_SYSTEM_SPEC.md`

If any supporting document conflicts with the master spec, the master spec wins.

## Key Files
- `MASTER_SYSTEM_SPEC.md` — final governing specification
- `CHANGELOG.md` — chronological record of project changes
- `IMPLEMENTATION_PLAN.md` — full implementation roadmap and execution plan
- `docs/PIPELINE_SPEC.md` — pipeline stages and stage rules
- `docs/DATA_MODEL.md` — tags, fields, record design, and tracking logic
- `docs/WORKFLOW_PLAN.md` — workflow sequence, triggers, actions, and automation priorities
- `docs/SOP_ROADMAP.md` — SOPs to build during and after implementation

## Working Rules
1. Build the operating structure before agent messaging.
2. Prefer one clean system over multiple fragmented setups.
3. Use contact records for long-term seller identity.
4. Use opportunity records for active deal execution.
5. Do not automate pricing or exceptions until rules are defined.
6. Log meaningful changes in `CHANGELOG.md`.
7. Update the master spec when a project-level decision changes.

## Current Project Status
- Project folder created
- Master spec created
- Changelog created
- Implementation plan created
- Initial architecture documents created

## Next Build Priority
1. Lock pipeline structure
2. Lock tags and custom fields
3. Build first 3 workflows
4. Add SOPs and QA checklist
5. Build agent layer after operations structure is stable
