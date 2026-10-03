---
type: Guide
title: Mobile Mind Usage Guide
description: Tool-agnostic workflow for using the Mobile Mind OKF v0.2 knowledge bundle.
generated:
  by: process:okr-template/1
  at: 2026-10-03T00:00:00Z
sources:
  - id: okf-spec-v02-pinned
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/3fcbb9f828c2/okf/SPEC.md
    title: Open Knowledge Format Specification v0.2
  - id: okf-spec-v02-live
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/refs/heads/main/okf/SPEC.md
    title: Open Knowledge Format Specification (live)
---

# Using Mobile Mind

Copy this directory to start a new Mobile Mind project, then rename the copy to your project name.

# Generic agent workflow

1. Start at `/index.md`.
2. Load `/AGENTS.md`.
3. Select the relevant skill in `/.agents/skills/`.
4. Keep answers and edits within that skill boundary.
5. Update indexes and append `/log.md` for meaningful changes.

# Tool entry files

| Tool | Entry file |
|---|---|
| Copilot CLI / GitHub Copilot | `/.github/copilot-instructions.md` |
| Claude CLI | `/CLAUDE.md` |
| Gemini / Antigravity | `/GEMINI.md` |
| OpenCode | `/AGENTS.md` |

# Directory layout

| Path | Purpose |
|---|---|
| `index.md` | Root progressive-disclosure navigation (reserved file). |
| `log.md` | Date-grouped update history (reserved file). |
| `concepts/` | Durable domain knowledge. |
| `references/` | Source-backed evidence and methodology notes. |
| `playbooks/` | Repeatable procedures. |
| `.agents/skills/` | Portable Agent Skills (`SKILL.md` per skill). |
| `assets/raw/` | Raw external materials for ingestion tasks. |
| `outputs/` | Generated outputs such as audits and exports. |

# Metadata rules

1. Every non-reserved markdown file must include YAML frontmatter with non-empty `type`.
2. Use `generated.by` and `generated.at` for provenance.
3. Use `sources` frontmatter for source attribution.
4. Use `status`, `stale_after`, and `verified` when they improve trust/freshness interpretation.
5. Preserve unknown fields when editing existing concepts.

# Notes on methodology reference

The local summary in `/references/okf-v0.2.md` is operational guidance. Upstream OKF specification is authoritative if conflicts occur.[^okf-spec-v02-pinned]

[^okf-spec-v02-pinned]: Source `okf-spec-v02-pinned` in frontmatter.

