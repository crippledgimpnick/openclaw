# Discord Integration Plan

## Goal
Connect Master Splinter to Discord so Nick can interact through Discord while preserving the same working context, project documentation habits, and practical build authority used in the CLI workflow.

## Important Clarification
Discord access and CLI permissions are related, but they are not exactly the same thing.

### Discord provides
- a communication surface
- DMs and/or server channel access
- thread-based collaboration if enabled
- notifications and easier day-to-day interaction

### CLI/OpenClaw runtime provides
- workspace file access
- tool availability
- shell access
- session behavior
- sandbox and approval policy
- cron/session/subagent behavior

To make Discord feel like the CLI, the Discord channel must be connected to an OpenClaw session that has the same agent/runtime/tool configuration.

## Recommended Setup Model
Use Discord as a communication front end while keeping the same underlying OpenClaw workspace and agent configuration.

Recommended starting model:
1. enable Discord channel support in OpenClaw
2. connect one Discord bot account
3. allow either:
   - direct messages with Nick, or
   - one dedicated private server channel for systems work
4. keep the same workspace while preserving separate project folders by topic
5. use one persistent session or thread-bound session for the project when needed

## Best Option
For this project, the cleanest setup is:
- a dedicated Discord server or private channel for business systems work
- Nick as the authorized user
- thread-based work for major subprojects if needed later
- DMs optional, but private channel is usually better for persistent context and file-heavy collaboration

## Permission Model

### What should match CLI behavior
- same workspace
- same project files
- same documentation discipline
- same planning/orchestration role
- same non-destructive safety rules
- same ability to read, write, and update project files through the agent runtime

### What should be controlled explicitly
- who can message the agent
- which Discord server/channel is enabled
- whether DMs are open, allowlisted, or pairing-based
- whether thread-bound subagent sessions are allowed
- whether moderation/role/channel actions are enabled

## Recommended Security Posture
Use a narrow setup first.

Recommended initial settings:
- one Discord bot token
- one account
- one allowed server
- one allowed channel, or DM pairing with Nick only
- no broad moderation powers unless actually needed
- no unnecessary role/channel management permissions
- thread bindings only if useful later

## Implementation Checklist

### Step 1: Create Discord bot
In Discord Developer Portal:
- create a new application
- add a bot
- copy the bot token
- enable only the intents required by OpenClaw setup

### Step 2: Invite bot to server
Invite the bot to the target server with only the permissions needed for:
- reading messages
- sending messages
- creating threads if desired
- attaching files if needed
- reading message history
- adding reactions if desired

Avoid granting admin unless there is a real reason.

### Step 3: Configure OpenClaw Discord channel
Set up the Discord token and channel configuration under the OpenClaw config for `channels.discord`.

Key areas to configure:
- token
- guild allowlist
- channel allowlist / enabled channels
- DM policy
- allowFrom if using DM allowlists
- optional thread binding behavior

## DM Policy Recommendation
Best starting options:
- `pairing`, if Nick wants controlled DM linking
- `allowlist`, if Nick already knows the user ID(s)

Avoid `open` unless there is a very good reason.

## Channel Recommendation
For business systems work, preferred order:
1. dedicated private Discord channel
2. controlled DM setup
3. broader shared server setup later if needed

## Session Recommendation
If Nick wants continuity similar to this CLI session, use a persistent project-oriented session rather than random isolated runs for everything.

For Discord thread work later, thread-bound persistent ACP/subagent sessions can be useful, but only after the core setup is stable.

## Live Validation Findings
Current runtime findings from OpenClaw status, security audit, and gateway logs:
- Discord channel support is enabled in OpenClaw
- the bot token is configured
- the Discord provider is failing gateway startup with close code `4014`
- the current root cause is missing privileged Message Content Intent in the Discord Developer Portal
- native Discord commands are not yet scoped to an authorized user allowlist, so command access still needs Nick's Discord user ID or pairing approval

## Validation Checklist
After setup, verify:
- the bot responds in the intended Discord location
- only intended users/channels can reach it
- project files remain accessible from the same workspace
- responses preserve role and tone
- no unexpected permission expansion occurred
- documentation updates still land in the project folder

## Operational Rule
Discord becomes another door into the same workshop, not a different brain.

## Recommended Next Actions for Nick
1. create the Discord bot/application
2. decide whether the first surface is DM or a private channel
3. add the bot to the server if using channels
4. configure `channels.discord` in OpenClaw
5. test one message path
6. verify session behavior and allowed scope

## Notes for Future Expansion
Later, if useful, add:
- thread-bound project sessions
- alert delivery to Discord
- changelog/rollout notices in a private ops channel
- task or review notifications

But start narrow.
