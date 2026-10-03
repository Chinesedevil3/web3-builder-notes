# SourceConflictResolver

A reusable GenLayer Intelligent Contract for adjudicating conflicting or uneven public web sources around a factual claim.

## Decisions

- **SOURCE_A_STRONGER**
- **SOURCE_B_STRONGER**
- **BOTH_COMPATIBLE**
- **UNRESOLVED**

The contract does not merely classify a claim as true or false. It compares the evidentiary relationship between two sources and determines whether one is materially stronger, both are compatible, or neither can reliably resolve the claim.

## GenLayer-native behavior

- public web retrieval from two independent URLs
- LLM reasoning over untrusted evidence
- explicit source-quality comparison
- independent validator re-evaluation
- consensus over decision + confidence band
- persistent state and result readback

## Stored state

The contract stores:

- last claim
- both source URLs
- decision
- confidence score
- reasoning
- resolution count

## Tested branches

The deployed Studio instance was tested across all four outcomes:

- **BOTH_COMPATIBLE** — 95 confidence
- **SOURCE_A_STRONGER** — 90 confidence
- **SOURCE_B_STRONGER** — 95 confidence
- **UNRESOLVED** — 95 confidence

The final resolution counter reached **4**.

See [TESTS.md](./TESTS.md) for the scenarios.

## Status

Prototype deployed and tested in GenLayer Studio on October 3, 2026.
