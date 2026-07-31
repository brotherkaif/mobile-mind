---
name: okf-audit
description: Audit bundle conformance, trust signals, freshness, and computation attestation readiness.
type: Agent Skill
generated:
  by: process:okr-template/1
  at: 2026-07-31T14:26:00Z
---

# Task

Audit this bundle for OKF quality and reliability signals.

# Checks

1. Non-reserved markdown files missing frontmatter or non-empty `type`.
2. Legacy metadata patterns (`timestamp`, body `# Citations`) in maintained docs.
3. Missing or weak `sources` provenance where claims depend on external evidence.
4. Trust/freshness coverage (`verified`, `status`, `stale_after`) where useful.
5. Attested-computation records clearly separate execution and attestation state.

# Output

Write findings to `outputs/audit-YYYY-MM-DD.md` and summarize remediation steps.

