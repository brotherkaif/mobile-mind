---
type: Methodology Reference
title: Bullet Journal Capture Syntax
description: Human-facing syntax contract for daily bullet-journal entries in assets/raw/journal/.
generated:
  by: process:okr-template/1
  at: 2026-10-03T00:00:00Z
sources:
  - id: okf-spec-v02-live
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/refs/heads/main/okf/SPEC.md
    title: Open Knowledge Format Specification v0.2
status: stable
---

# Scope

This document defines the ASCII-only syntax used in daily capture files under `assets/raw/journal/`. It is the contract between the human writing the journal and the `journal-ingest` skill that organises it.

# File format

- One file per day.
- Filename: `YYYYMMDD.txt`.
- Location: `assets/raw/journal/`.
- No frontmatter; content starts immediately.
- The date of the entry is always taken from the filename, not the body.

# Sigils

| Sigil | Meaning | Ingest destination |
|---|---|---|
| `- [ ]` | Open task | `concepts/tasks.md` |
| `- [x]` | Completed task | `concepts/tasks.md` (Done) |
| `- [>]` | Migrated forward; still open | `concepts/tasks.md` (Open, annotated) |
| `- [?]` | Investigation / potential project | `concepts/projects/slug.md` |
| `- @` | Event (meeting, appointment, milestone) | `concepts/events/YYYYMMDD-slug.md` |
| `>` | Insight / learning | `concepts/slug.md` |
| `-` | Plain note | Child context of parent item |

# Indentation and nesting

Indentation expresses parent-child relationships:

```text
- @Stand-up
  - Alice blocked on API keys
  - Bob to review PR today
- [ ] Follow up on API keys
  - plain note: contact platform team
```

Rules:
- A child item belongs to the nearest less-indented item above it.
- Use exactly one level of indentation for children.
- Anything indented more than one level beyond its parent should be flattened to one level.

# Examples

## Task lifecycle

```text
- [x] Book dentist appointment (2026-10-01)
- [>] Draft quarterly goals
- [ ] Buy coffee
```

## Event with notes

```text
- @Sprint planning
  - Team committed to 23 points
  - Risk: dependency on infra ticket
```

## Insight

```text
> The fastest way to debug sync issues is to check the ledger first.
```

## Investigation

```text
- [?] Home lab NAS upgrade
  - Need to compare ZFS vs btrfs
  - Budget around £300
```

# Constraints

- ASCII sigils only. No emoji.
- Do not add frontmatter to raw files.
- Keep entries atomic and self-contained.
