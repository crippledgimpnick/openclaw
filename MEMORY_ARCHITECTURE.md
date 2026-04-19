# MEMORY_ARCHITECTURE.md

How information should be stored for Master Splinter.

## 1. MEMORY.md
Use for durable long-term memory.

Keep here:
- stable identity
- who Nick is
- Nick's business model
- Nick's standing priorities
- durable project structure rules
- source-of-truth document locations
- long-term operating rules
- stable environment facts that matter repeatedly

Do not keep here:
- temporary blockers
- one-off experiments
- implementation chatter
- daily progress logs
- details already owned by project docs unless they are globally important

Rule of thumb:
If future-me will need it weeks from now across many sessions, it belongs here.

## 2. daily memory files (`memory/YYYY-MM-DD.md`)
Use for session and timeline memory.

Keep here:
- what happened today
- decisions made today
- blockers encountered
- setup changes made
- issue history
- important debugging trail
- notable user preferences learned during the day

Do not keep here:
- full project specs
- permanent duplicated reference material

Rule of thumb:
If it matters for history, sequence, troubleshooting, or recall of recent work, it goes here.

## 3. project docs
Use project folders for project-specific truth.

Keep here:
- specs
- plans
- changelogs
- workflows
- SOPs
- implementation details
- scope decisions
- project constraints
- project-specific IDs, rules, and rollout notes

Rule of thumb:
If it belongs to one project more than to me globally, it belongs in that project's folder.

## 4. changelogs
Use each project's `CHANGELOG.md` for meaningful project changes.

Keep here:
- structural changes
- scope changes
- documentation changes
- configuration changes relevant to the project
- rollback context

Rule of thumb:
If someone may later ask "what changed and when?", log it there.

## 5. AGENTS.md / SOUL.md / IDENTITY.md / USER.md / TOOLS.md / BOOT.md
These are special-purpose files.

- `AGENTS.md`: workspace rules and operating constraints
- `SOUL.md`: personality, tone, values, and orchestration doctrine
- `IDENTITY.md`: who I am
- `USER.md`: who Nick is and how I should help
- `TOOLS.md`: environment-specific notes and setup references
- `BOOT.md`: short startup checklist

## Quick decision framework
Ask:
1. Is this durable across many sessions?
   - yes -> `MEMORY.md`
2. Is this mainly about today or recent chronology?
   - yes -> `memory/YYYY-MM-DD.md`
3. Is this tied to one project's buildout or governance?
   - yes -> that project's folder
4. Is this a record of meaningful project change?
   - yes -> that project's `CHANGELOG.md`
5. Is this about core workspace behavior, identity, user profile, or setup notes?
   - yes -> one of the root files

## Anti-clutter rules
- Do not duplicate project specs into `MEMORY.md`
- Do not turn daily memory into a second changelog unless timing/debugging matters
- Do not store temporary noise in long-term memory
- Prefer one authoritative location per kind of information
