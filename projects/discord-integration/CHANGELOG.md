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
