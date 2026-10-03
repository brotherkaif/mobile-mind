---
type: Methodology Reference
title: OKF v0.2 Operational Summary
description: Concise operational summary for maintaining this bundle under OKF v0.2.
generated:
  by: process:okr-template/1
  at: 2026-07-31T14:26:00Z
sources:
  - id: okf-spec-v02-pinned
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/3fcbb9f828c2/okf/SPEC.md
    title: Open Knowledge Format Specification v0.2
  - id: okf-spec-v02-live
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/refs/heads/main/okf/SPEC.md
    title: Open Knowledge Format Specification (live)
status: stable
verified: { by: human:reviewer, at: 2026-07-31T14:26:00Z }
---

# Scope

This is a practical reference for day-to-day authoring and maintenance in this bundle, not a replacement for the canonical specification.[^okf-spec-v02-pinned]

# Core rules

1. `index.md` and `log.md` are reserved.
2. Every other markdown concept must include frontmatter with non-empty `type`.
3. Provenance is tracked with `generated.by` and `generated.at`.
4. Evidence provenance is tracked in `sources`.
5. Links should be standard markdown links and remain navigable.
6. Unknown fields and unknown concept types should be preserved.

# Trust and freshness

Use optional fields when needed:

- `verified`: list of verification events `{ by, at }`, where `by` is an actor; trust tiers are derived from whether a `human:<id>` actor appears.
- `status`: lifecycle state (`draft`, `stable`, or `deprecated`).
- `stale_after`: absolute ISO 8601 datetime after which content is considered stale.

# Catalog-only query behavior

When answering catalog questions:

1. Use only files in this bundle as evidence.
2. Cite which bundle files support the answer.
3. If evidence is missing or ambiguous, report that gap instead of inventing facts.

# Attested computation guidance

For computation results, store reproducible execution metadata and separate execution from attestation. Failed or unattested results should not be presented as authoritative.

[^okf-spec-v02-pinned]: Source `okf-spec-v02-pinned` in frontmatter.

