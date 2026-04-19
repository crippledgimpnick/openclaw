# Obsidian Setup

This workspace is configured to function as an Obsidian vault.

## Best way to view it from another computer

Recommended approach: use Git.

1. Clone this repository on the other computer.
2. Open the cloned folder in Obsidian as a vault.
3. Pull changes when needed.
4. If you edit from both places, commit and push before switching machines.

## Notes

- The canonical vault path on this machine is this workspace root.
- Obsidian settings live in `.obsidian/`.
- The layered memory model is documented in `OBSIDIAN_MEMORY_SYSTEM.md`.
- Shared vault files live in `Agent-Shared/`.
- OpenClaw private vault files live in `Agent-OpenClaw/`.
- `Agent-Hermes/` is reserved for Hermes.
- Generated runtime state is intentionally ignored in Git:
  - `.openclaw/`
  - `memory/.dreams/`
  - `exports/`
  - transient Obsidian workspace layout files

## Alternative sync options

If you do not want to use Git for day-to-day viewing, the next best options are:
- Obsidian Sync
- Syncthing
- Dropbox/iCloud/Google Drive

In all cases, open the synced local copy in Obsidian rather than editing over a remote mount.
