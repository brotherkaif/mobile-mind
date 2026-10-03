---
type: Agent Operating Guide
title: Mobile Mind Agent Rules
description: Canonical operating policy for agents maintaining the Mobile Mind OKF v0.2 bundle.
generated:
  by: process:okr-template/1
  at: 2026-10-03T00:00:00Z
sources:
  - id: okf-spec-v02-pinned
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/3fcbb9f828c2/okf/SPEC.md
    title: Open Knowledge Format Specification v0.2
---

# Mission

Maintain this directory as an OKF v0.2-conformant knowledge bundle with clear provenance, trust signals, and navigability.

# Non-negotiable rules

1. Every non-reserved markdown file must have frontmatter and non-empty `type`.
2. Treat `index.md` and `log.md` as reserved file names.
3. Use `generated` metadata for producer/time provenance.
4. Use `sources` frontmatter for evidence attribution.
5. Do not answer catalog queries from model memory or external sources; use only files in this bundle.
6. When evidence is insufficient, say so explicitly.
7. Preserve unknown frontmatter fields during edits.
8. Update relevant indexes and append `log.md` for meaningful changes.

# Standard operations

1. Querying the catalog: `/.agents/skills/okf-query/SKILL.md`
2. Ingesting new source material: `/.agents/skills/okf-ingest/SKILL.md`
3. Ingesting bullet-journal entries: `/.agents/skills/journal-ingest/SKILL.md`
4. Maintaining navigation and lifecycle: `/.agents/skills/okf-maintain/SKILL.md`
5. Auditing conformance/trust/freshness: `/.agents/skills/okf-audit/SKILL.md`

# Output expectations

For each task, report changed files, evidence links used, and any unresolved gaps.

