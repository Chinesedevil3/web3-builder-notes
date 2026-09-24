# EvidenceVerdict test notes

These tests were run against the deployed GenLayer Studio instance using the contract's `verify_claim` write method.

## Sources

Source A:
`https://example.com/`

Source B:
`https://www.iana.org/domains/reserved`

## Test 1 — SUPPORTED

Claim:

`example.com is maintained for documentation purposes`

Observed result:

`SUPPORTED`

The stored reason reported that the supplied Example Domain and IANA evidence supported the claim.

## Test 2 — CONTRADICTED

Claim:

`example.com is intended for production operations`

Observed result:

`CONTRADICTED`

## Test 3 — INSUFFICIENT

Claim:

`The maintainer of example.com has a pet cat named Luna.`

Observed result:

`INSUFFICIENT`

## Additional execution

Multiple verification writes were finalized/accepted during testing, and the contract's verification counter advanced accordingly.

These tests exercise all three classification branches while using the same reusable consensus primitive.
