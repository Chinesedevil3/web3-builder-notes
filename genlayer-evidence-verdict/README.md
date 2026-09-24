# EvidenceVerdict

A reusable GenLayer Intelligent Contract for evaluating factual claims against multiple public web sources.

## What it does

EvidenceVerdict accepts:

- a factual claim
- Source A URL
- Source B URL

The contract fetches both sources through GenLayer web access, treats the page contents as untrusted evidence, and asks an LLM to classify the claim as one of:

- **SUPPORTED**
- **CONTRADICTED**
- **INSUFFICIENT**

The leader performs the initial evaluation. Validators independently repeat the evidence evaluation and accept the result only when their core verdict matches the leader verdict.

## Why GenLayer

The primitive depends on GenLayer-native features rather than acting as a thin LLM wrapper:

- nondeterministic web access
- LLM reasoning over public evidence
- independent validator execution
- consensus on a stable semantic output
- persistent contract state and read methods

## Stored state

The contract stores:

- last claim
- both source URLs
- accepted verdict
- accepted reasoning
- verification count

## Tested flows

The deployed Studio contract was tested end-to-end with multiple claims and both evidence URLs.

Observed branches:

- **SUPPORTED** — a claim supported by Example Domain / IANA evidence
- **CONTRADICTED** — a claim contradicted by the same evidence
- **INSUFFICIENT** — a claim not established by either source

The write transactions reached GenLayer consensus and the stored results were successfully read back through the contract's public view methods.

## Source

Main contract: [evidence_verdict.py](./evidence_verdict.py)

Test notes: [TESTS.md](./TESTS.md)

## Status

Prototype deployed and tested in GenLayer Studio on September 24, 2026.
