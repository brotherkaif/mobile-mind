---
name: okf-query
description: Answer questions using only evidence contained in this knowledge bundle.
type: Agent Skill
generated:
  by: process:okr-template/1
  at: 2026-07-31T14:26:00Z
---

# Task

Answer a user query using only files in this bundle.

# Rules

1. Read from `index.md` and linked files progressively.
2. Do not use model memory, web search, or external source URLs as evidence.
3. Cite the bundle files that support each key claim.
4. If the bundle lacks enough evidence, state that explicitly and stop short of guessing.

# Output

Return:

1. Answer.
2. Evidence file paths used.
3. Explicit evidence gaps (if any).

