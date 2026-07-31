---
name: okf-maintain
description: Maintain indexes, lifecycle metadata, and update logs for bundle health.
type: Agent Skill
generated:
  by: process:okr-template/1
  at: 2026-07-31T14:26:00Z
---

# Task

Keep navigation and lifecycle metadata consistent.

# Procedure

1. Reconcile `index.md` entries with current files.
2. Ensure internal links remain valid where possible.
3. Apply lifecycle metadata updates (`status`, `stale_after`) when requested.
4. Preserve permissive conformance (unknown fields/types remain intact).
5. Append a concise, dated `log.md` entry for meaningful updates.

