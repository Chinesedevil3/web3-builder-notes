# MilestoneJudge test notes

All tests used the same two public evidence sources:

- https://example.com/
- https://www.iana.org/domains/reserved

## Test 1 — PASSED

Milestone:

`Verify that Example Domain is intended for use in documentation and examples.`

Acceptance criteria:

`The evidence must show that example.com or example domains are reserved or maintained for documentation and illustrative examples.`

Observed result:

`PASSED`

A high confidence score was returned.

## Test 2 — FAILED

Milestone:

`Verify that example.com is intended for production and commercial operations.`

Acceptance criteria:

`The evidence must explicitly show that example.com is intended for real production or commercial operational use.`

Observed result:

`FAILED`

A high confidence score was returned because the supplied evidence directly contradicted production-use intent.

## Test 3 — NEEDS_MORE_EVIDENCE

Milestone:

`Verify that the maintainer of example.com owns a pet cat named Luna.`

Acceptance criteria:

`At least one evidence source must explicitly confirm that the maintainer owns a cat named Luna.`

Observed result:

`NEEDS_MORE_EVIDENCE`

This test verifies that absence of evidence is not treated as contradiction.

## Final clean-instance coverage

The final contract instance was exercised across all three semantic outcomes with persistent state readback through the public view methods.
