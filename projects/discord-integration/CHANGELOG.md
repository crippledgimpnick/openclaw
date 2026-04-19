# CHANGELOG

All notable changes to the Discord integration project should be recorded here.

This log is meant to support:
- review
- debugging
- rollback decisions
- audit trail
- implementation timeline tracking

---

## 2026-04-19

### Discord integration project created
**Files added:**
- `README.md`
- `MASTER_DISCORD_SPEC.md`
- `CHANGELOG.md`
- `docs/DISCORD_INTEGRATION_PLAN.md`

**Reason:**
Nick clarified that Discord integration is a separate project from the GoHighLevel purchasing system and should live in its own root project folder.

**Impact:**
- separated Discord infrastructure planning from GHL documentation
- created a distinct source of truth for Discord scope and security posture
- preserved organized project boundaries from the start

**Rollback notes:**
Safe to revert by moving the Discord documentation back or resetting to the commit that introduced this project folder.

### Runtime validation found live Discord blockers
**Files affected:**
- `docs/DISCORD_INTEGRATION_PLAN.md`
- OpenClaw config updated with explicit `channels.discord.dmPolicy = pairing`

**Reason:**
Nick asked to finish the Discord setup after inviting the bot to the server. Live runtime checks showed the Discord gateway is currently failing to connect because Message Content Intent is not enabled in the Discord Developer Portal, and Discord command authorization is not yet scoped to Nick.

**Impact:**
- confirmed the bot is not fully operational yet
- identified the exact live blocker: gateway close code `4014` due to missing privileged intent
- made DM access policy explicit and safer by setting pairing mode
- narrowed the remaining required inputs to Discord-side intent enablement plus Nick's user/server/channel identifiers

**Rollback notes:**
Remove the explicit `dmPolicy` setting or reset to the prior config if a different DM access model is chosen later.

### Discord scope narrowed to Nick, one server, and one channel
**Files affected:**
- OpenClaw config updated with Discord allowlist scope

**Reason:**
Nick provided the target Discord server, target channel, and Discord username for authorization. The username was resolved to stable Discord user ID `1488920661370863656`, then the runtime config was narrowed to that user, that server, and that channel.

**Impact:**
- removed wildcard guild scope from Discord config
- added `channels.discord.allowFrom` for Nick's account
- scoped guild access to server `1488525272084123870`
- scoped channel access to `1495218262789587034`
- restricted channel-level user access to Nick's resolved Discord ID

**Rollback notes:**
Revert the Discord config to wildcard guild access or reset to the prior config if broader access is intentionally needed later.

### Discord runtime validated after scope lock
**Files affected:**
- `MASTER_DISCORD_SPEC.md`
- `docs/DISCORD_INTEGRATION_PLAN.md`

**Reason:**
After narrowing scope to Nick, the target server, and the target channel, runtime verification was rerun to confirm whether Discord was operational.

**Impact:**
- Discord channel status is now `OK`
- active Discord session detected for channel `1495218262789587034`
- documented the approved server, channel, and resolved user scope in the project docs

**Rollback notes:**
Documentation-only change. Runtime rollback would mean changing the OpenClaw Discord scope configuration if requirements change later.
