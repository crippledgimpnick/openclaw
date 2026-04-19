# MASTER DISCORD SPEC

## Document Role
This is the governing specification for the Discord integration project.

If any supporting note, draft, or setup document conflicts with this file, this file takes precedence until formally updated.

## Project Owner
Nick

## System Builder / Orchestrator
Master Splinter

## Project Mission
Connect Discord to the OpenClaw runtime in a way that gives Nick a practical working interface to Master Splinter while preserving the same workspace, discipline, and operational authority used in the CLI.

## Scope
This project covers:
- Discord bot setup guidance
- OpenClaw Discord channel configuration
- access control decisions
- channel or DM scoping
- validation and testing
- future Discord operating model decisions

This project does not cover:
- GoHighLevel purchasing workflow design
- CRM pipeline architecture
- sales-agent scripting
- unrelated project documentation

## Core Design Decisions

### 1. Discord is a surface, not a separate brain
Discord should connect into the same OpenClaw workspace and runtime behavior used in CLI work.

### 2. Discord work remains a separate project from GHL work
All Discord planning and setup documents live under `projects/discord-integration/`.

### 3. Security starts narrow
Initial setup should be limited to:
- one Discord bot/account
- one trusted server or controlled DMs
- one allowed user or one allowed private channel to start
- minimal bot permissions

### 4. Runtime capability does not require Discord admin power
Matching CLI capability should mean matching the underlying OpenClaw session behavior, not granting unnecessary Discord administrator privileges.

## Recommended Starting Model
Preferred order:
1. one dedicated private Discord channel
2. controlled DM access if desired
3. broader server usage only after validation

## Permission Standard
Recommended bot permissions:
- View Channel
- Send Messages
- Read Message History
- Attach Files
- Add Reactions
- Create Threads, only if needed

Avoid `Administrator` unless a real operational need exists.

## Access Control Standard
Preferred early posture:
- narrow guild scope
- narrow channel scope
- DM policy set to `pairing` or `allowlist`
- no open inbound surface unless deliberately chosen

## Validation Standard
The setup is not considered successful until all of the following are true:
- the bot responds in the intended Discord location
- only intended users or channels can reach it
- the same workspace remains accessible
- project documentation remains separated by project folder
- no unnecessary Discord permissions are granted

## Documentation Standard
All meaningful Discord-related decisions or changes should update:
- `CHANGELOG.md`
- this master spec, if the change affects scope or security posture
- supporting setup docs, if procedure changes

## Open Questions
These still require Nick's decision:
- private channel or DM first
- target server ID
- target channel ID
- whether DMs should be enabled at all
- whether thread-based project sessions are desired later

## Definition of Success
Version 1 is successful when:
- Nick can work with Master Splinter from Discord
- the runtime behavior matches the established workspace workflow
- channel/user scope is intentionally limited
- documentation and project separation remain clean
