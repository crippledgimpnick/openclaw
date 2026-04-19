# Obsidian Memory System

This document defines the layered memory model for OpenClaw in this vault.

## Layer 1: Built-in memory
Always present, compact, and intentionally small.

Practical implementation in this workspace:
- `MEMORY.md` for durable compact facts and pointers
- `USER.md` for compact user profile context
- `TOOLS.md` for compact environment facts that truly need to stay close at hand

Rule:
- Keep this layer small.
- Prefer pointers over long prose.
- If a detail is not worth injecting every turn, it belongs in Layer 3 instead.

## Layer 2: Operating doctrine
Always present behavior and identity files.

Files:
- `AGENTS.md`
- `IDENTITY.md`
- `SOUL.md`
- `USER.md`

Purpose:
- workspace rules
- role and orchestration doctrine
- personality, values, and judgment
- compact user context

## Layer 3: Obsidian vault memory
Large, shared, on-demand working memory.

### Shared space
`Agent-Shared/`
- `user-profile.md`
- `project-state.md`
- `decisions-log.md`

### Hermes private space
`Agent-Hermes/`
- reserved for Hermes

### OpenClaw private space
`Agent-OpenClaw/`
- `working-context.md`
- `daily/YYYY-MM-DD.md`
- other OpenClaw-private operating notes as needed

## Layer 4: Session search
Searchable recall across past conversations and indexed memory.

Implementation:
- `memory_search`
- indexed session transcripts when available
- memory files and daily logs

Use this when Nick references prior work, dates, preferences, decisions, or cross-session context.

## Read cadence
OpenClaw should read Layer 3 files:
- on session start
- after compaction or reset-like loss of active context
- when detailed project or user context is needed
- before resuming substantial interrupted work

Minimum startup read set when present:
- `Agent-Shared/user-profile.md`
- `Agent-Shared/project-state.md`
- `Agent-OpenClaw/working-context.md`
- today’s `Agent-OpenClaw/daily/YYYY-MM-DD.md`

## Write cadence
OpenClaw should write Layer 3 files:
- at task start
- every 3 to 5 tool calls during substantial work, or at natural checkpoints
- at task completion
- when corrected by Nick
- before session end when there is meaningful state to preserve

Write targets:
- `Agent-OpenClaw/working-context.md` for current state and next actions
- today’s `Agent-OpenClaw/daily/YYYY-MM-DD.md` for chronology and checkpoints
- `Agent-Shared/decisions-log.md` for durable shared decisions
- `Agent-Shared/project-state.md` when project status materially changes
- `Agent-Shared/user-profile.md` when shared user preferences or recurring corrections change

## Automatic vs behavior-driven
Important distinction:
- Layer 4 search is automatic/tool-backed.
- Layers 1 and 2 are runtime-injected or startup-loaded.
- Layer 3 behavior is primarily doctrine-driven, not magic runtime enforcement.

That means OpenClaw must actively follow the read/write cadence. The vault structure supports the behavior, but the behavior still has to be executed intentionally.

## Guardrails
- Do not touch `Agent-Hermes/` unless Nick explicitly asks.
- Keep Layer 1 compact.
- Do not duplicate full project specs into shared memory files.
- Use project folders as source of truth for project implementation detail.
- Promote only durable cross-agent decisions into `decisions-log.md`.
