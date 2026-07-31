---
name: okf-ingest
description: Ingest new source material into the bundle with OKF v0.2-compliant provenance and navigation updates.
type: Agent Skill
generated:
  by: process:okr-template/1
  at: 2026-07-31T14:26:00Z
---

# Task

Convert new source material into bundle concepts/references while preserving conformance.

# Procedure

1. Store raw inputs in `assets/raw/` when applicable.
2. Create or update reference concepts with `sources` metadata.
3. Update related concepts/playbooks with grounded links.
4. Preserve unknown metadata fields in existing documents.
5. Refresh affected `index.md` files.
6. Append meaningful changes to `log.md`.

# Guardrails

1. Do not invent `verified` status.
2. Do not replace existing evidence without reason.
3. Keep claims tied to attributable sources.

