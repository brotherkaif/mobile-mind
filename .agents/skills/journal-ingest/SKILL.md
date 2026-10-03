---
name: journal-ingest
description: Ingest bullet-journal daily capture files into the OKF v0.2 knowledge base.
type: Agent Skill
generated:
  by: process:okr-template/1
  at: 2026-10-03T00:00:00Z
sources:
  - id: okf-spec-v02-live
    resource: https://raw.githubusercontent.com/GoogleCloudPlatform/knowledge-catalog/refs/heads/main/okf/SPEC.md
    title: Open Knowledge Format Specification v0.2
  - id: bullet-journal-syntax
    resource: /references/bullet-journal-syntax.md
    title: Bullet Journal Capture Syntax
---

# Task

Ingest daily bullet-journal capture files from `assets/raw/journal/` into the curated OKF v0.2 knowledge base under `concepts/`.

# Input contract

Daily capture files are plain-text files named `YYYYMMDD.txt` in `assets/raw/journal/`.
They contain Markdown-formatted content but are intentionally **not** OKF concept files (no frontmatter), preserving frictionless capture.

Capture syntax (ASCII only):

| Sigil | Meaning | Output target |
|---|---|---|
| `- [ ] Task text` | Open task | `concepts/tasks.md` |
| `- [x] Task text` | Completed task | `concepts/tasks.md` (Done section) |
| `- [>] Task text` | Migrated forward; still open | `concepts/tasks.md` (Open, annotated migrated) |
| `- [?] Investigation` | Potential project | `concepts/projects/slug.md` |
| `- @Event name` | Meeting / appointment / milestone | `concepts/events/YYYYMMDD-slug.md` |
| `> insight text` | Learning worth persisting | `concepts/slug.md` |
| `- plain bullet` | Contextual note | Child of parent item |

Rules:
- Indentation is meaning: an indented item is a child of its parent.
- Child notes under an event become that event's notes.
- Child notes under an investigation become project context.
- Only one meaningful indent level; flatten anything deeper than three levels.
- The date comes from the filename, not the body.
- ASCII sigils only; no emoji.

Full syntax reference: [references/bullet-journal-syntax.md](/references/bullet-journal-syntax.md)

# Procedure

For each file in `assets/raw/journal/*.txt` not listed in `.ledger`, oldest first:

1. **Read** `.ledger` to determine already-ingested files.
2. **Parse** the new journal file into typed items, preserving parent-child relationships.
3. **Tasks** → upsert into `concepts/tasks.md`:
   - Open tasks under `# Open`.
   - Done tasks under `# Done`.
   - Format: `- [ ] Task text (YYYY-MM-DD)` or `- [x] Task text (YYYY-MM-DD)`.
   - Migrated tasks: `- [>] Task text (YYYY-MM-DD) migrated`.
   - If the same task appears both open and migrated in one day, later state wins; flag it.
   - Retain done tasks for 30 days, then remove from `concepts/tasks.md` (history remains in raw file and event files).
   - Child notes become sub-bullets under the task.
4. **Events** (`- @...`) → create or overwrite `concepts/events/YYYYMMDD-slug.md`:
   - Slug from the event name (lowercase, hyphenated).
   - Frontmatter `type: Event`.
   - Body: summary, structured notes from child bullets, any decisions or outcomes.
5. **Insights** (`> ...`) → create or merge into `concepts/slug.md`:
   - If the file exists, append the new insight under `# Log` with the capture date.
   - Do not duplicate existing content verbatim.
   - Frontmatter `type: Concept`.
6. **Investigations** (`[?] ...`) → create or merge into `concepts/projects/slug.md`:
   - Match new investigations against existing projects by slug + keywords.
   - If matched, append to the project's `# Log` with the capture date and **flag the match for human review**.
   - If unmatched, create a new project file.
   - Frontmatter `type: Project`.
7. **Append** the processed filename to `.ledger`.
8. **Update indexes**: `concepts/index.md`, `concepts/events/index.md`, `concepts/projects/index.md`.
9. **Append** a summary entry to `log.md`.
10. **Report** counts and any flags.

# Frontmatter conventions

Use strict OKF v0.2 frontmatter on every created or updated concept:

```yaml
---
type: Task List | Event | Concept | Project
title: <display title>
description: <one-line summary>
generated:
  by: agent/journal-ingest
  at: 2026-10-03T12:00:00Z
sources:
  - id: journal-YYYYMMDD
    resource: assets/raw/journal/YYYYMMDD.txt
    title: Journal Entry YYYY-MM-DD
status: stable
---
```

- `generated.at` is the time of the latest ingest that touched the file.
- `sources` must contain structured entries with `resource`; add a new entry each time the file is updated by a new journal ingest.
- Preserve any unknown frontmatter fields already present in an existing concept.

# Cross-references

Link related concepts with bundle-relative Markdown links or `[[slug]]` shorthand. Broken links are acceptable; they can be resolved on later ingests.

# Hard constraints

- **NEVER** write to `assets/raw/`.
- **NEVER** remove entries from `.ledger`.
- **NEVER** modify an existing concept's original `sources` entries.
- **NEVER** invent content, table structures, or facts not present in the raw file.
- **NEVER** duplicate actionable items across files; tasks live only in `concepts/tasks.md`.
- When unsure, leave the item unprocessed and **flag** it rather than guess.

# Output

Return:

1. A brief summary (files processed, tasks/events/insights/projects created or updated).
2. A list of changed files.
3. Any flags requiring human review.
4. A reminder to inspect the updated `concepts/index.md` and `log.md` entries.
