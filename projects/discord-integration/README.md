# Discord Integration Project

This folder is the working home for Discord setup, permissions, routing, and operational design related to Master Splinter.

## Purpose
Build and document a clean Discord interface into OpenClaw without mixing Discord infrastructure work into unrelated projects.

## Source of Truth
The governing document for this project is:
- `MASTER_DISCORD_SPEC.md`

If supporting documents conflict with the master spec, the master spec wins.

## Key Files
- `MASTER_DISCORD_SPEC.md` — governing specification for Discord setup and scope
- `CHANGELOG.md` — chronological record of changes
- `docs/DISCORD_INTEGRATION_PLAN.md` — setup strategy, scope, and validation checklist

## Working Rules
1. Keep Discord infrastructure separate from GoHighLevel system design.
2. Start narrow, private, and explicitly scoped.
3. Match runtime/workspace capability without granting unnecessary Discord power.
4. Log meaningful setup changes in `CHANGELOG.md`.
5. Update the master spec when scope or security posture changes.

## Current Project Status
- Separate Discord project folder created
- Master spec created
- Changelog created
- Discord integration plan moved here from the GHL project

## Next Build Priority
1. Decide DM vs private channel
2. Lock allowed server and channel scope
3. Verify OpenClaw Discord config
4. Test inbound and outbound messaging
5. Decide whether persistent thread-bound sessions are needed later
