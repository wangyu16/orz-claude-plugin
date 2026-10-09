# CLAUDE.md — orz-claude-plugin

Guidance for AI agents working in this repository.

> **orz family:** this repo is one member of the orz family — before changing anything another member depends on, read the family docs via [`../CLAUDE.md`](../CLAUDE.md) (contracts, shared rules, release order, and drift ledger in `../docs/`).

`skills/*` are vendored copies of the canonical `orz-<x>/orz-<x>-skills/`
folders. Never edit them here: change the canonical skill, then run
`scripts/sync-skills.sh` followed by `scripts/sync-skills.sh --check`.
