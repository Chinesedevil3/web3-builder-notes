# ProofCourt

ProofCourt is a browser-native GenLayer dApp that combines two accepted Intelligent Contract primitives into one product flow.

## Modes

### Verify a Claim

Uses **EvidenceVerdict** to:

1. accept a factual claim and two public evidence URLs
2. fetch both sources inside GenLayer
3. evaluate the evidence using LLM reasoning
4. reach validator consensus on `SUPPORTED`, `CONTRADICTED`, or `INSUFFICIENT`
5. read the accepted verdict and reasoning back into the UI

### Judge a Milestone

Uses **MilestoneJudge** to:

1. accept a milestone, explicit acceptance criteria, and two evidence URLs
2. distinguish support, contradiction, and absence of decisive evidence
3. map consensus to `PASSED`, `FAILED`, or `NEEDS_MORE_EVIDENCE`
4. return a confidence score and evidence-based reasoning

## Browser architecture

- static HTML/CSS/JavaScript frontend
- GenLayerJS loaded as a browser ES module
- EIP-1193 wallet connection
- Studionet contract reads and writes
- no local CLI or terminal required for the end user

## Current contract configuration

EvidenceVerdict is pinned in the frontend:

`0xABb90F7268a31B0A1015dB442cd9d074b6785153`

MilestoneJudge is currently configurable in the UI and saved to local browser storage. The final accepted deployment address will be pinned after verification.

## Files

- `index.html` — product UI
- `styles.css` — responsive interface
- `app.js` — GenLayerJS wallet + contract integration

## Related accepted primitives

- [EvidenceVerdict](../genlayer-evidence-verdict/)
- [MilestoneJudge](../genlayer-milestone-judge/)
