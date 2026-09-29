# MilestoneJudge

MilestoneJudge is a reusable GenLayer Intelligent Contract that evaluates whether a milestone satisfies explicit acceptance criteria using multiple public web sources.

## Inputs

- milestone description
- acceptance criteria
- Source A URL
- Source B URL

## Decision model

The contract fetches both evidence sources and classifies their relationship to the milestone as:

- **SUPPORTS** → final status **PASSED**
- **CONTRADICTS** → final status **FAILED**
- **NO_DECISIVE_EVIDENCE** → final status **NEEDS_MORE_EVIDENCE**

A core rule is that missing evidence is not treated as contradiction.

The leader evaluates the evidence first. Validators independently re-run the same evaluation and accept only when they agree on the semantic relation and confidence band.

## Why this is GenLayer-native

- web-native evidence retrieval
- LLM reasoning over untrusted public data
- independent validator execution
- consensus over semantic outputs rather than exact prose
- persistent onchain state
- explicit handling of uncertainty

## Stored state

The contract stores:

- last milestone
- last acceptance criteria
- both evidence sources
- last status
- confidence score
- reasoning
- judgment count

## Tested branches

The final deployed Studio instance was tested across all three outcomes:

- **PASSED**
- **FAILED**
- **NEEDS_MORE_EVIDENCE**

See [TESTS.md](./TESTS.md) for the test cases.

## Source

Main contract: [milestone_judge.py](./milestone_judge.py)

## Status

Prototype deployed and tested in GenLayer Studio on September 29, 2026.
