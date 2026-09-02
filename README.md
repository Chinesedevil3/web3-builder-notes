# web3-builder-notes

Creative Web3 experiments, onchain builds, and AI-assisted prototypes.

I am not presenting this repo as the work of a traditional software engineer. I am learning by shipping: turning ideas into small real projects, using official ecosystem primitives where possible, deploying onchain, and documenting the actual transactions and results.

## Featured builds

| Project | Network | What I built | Status |
|---|---|---|---|
| [Arc](projects/arc/) | Arc Testnet | ERC-8004 agent identity + full ERC-8183 agentic-commerce flow with USDC escrow, deliverable commitment, submission and settlement | Strong / complete |
| [GIWA](projects/giwa-sepolia/) | GIWA Sepolia | `GiwaVerifiedCreator` integrated with GIWA Dojang verification and published a verified creator proof | Strong / complete |
| [Soneium](projects/soneium/) | Soneium Mainnet + Minato | Creator contract on Minato, then a mainnet EAS schema registration and creator attestation | Strong / complete |
| [Ink](projects/ink/) | Ink Mainnet + Sepolia | Upgraded from a basic Sepolia contract to a mainnet `InkBuilderAttest` wrapper using SchemaRegistry + EAS with a verified attestation UID | Strong / complete |
| [Push Chain](projects/push-chain/) | Push Donut Testnet | EVM contract + state interaction + Push-native Universal Transaction originating from Ethereum Sepolia | Strong / complete |
| [X1 EcoChain](projects/x1-echochain/) | X1 Testnet | Builder registry with an onchain profile, published build proof, and verified readbacks | Good / complete |
| [Orbinum](projects/orbinum/) | Orbinum Testnet | First Solidity deployment, state-changing interaction, and readback | Basic / upgrade planned |

## What is inside

- Solidity contracts and small protocol integrations
- Real deployment and interaction records
- Mainnet and testnet experiments
- Agent identity / agentic-commerce flows
- EAS / SchemaRegistry attestations
- Universal transaction experiments
- Builder notes, transaction hashes, contract addresses, UIDs, and readbacks

Each project folder keeps its own README and deployment records. I keep old experiments when they are part of the learning history instead of rewriting them to look cleaner than they really were.

## Working principles

- Use real onchain activity, not invented deployment records
- Prefer chain-native primitives over repeating generic counters
- Verify network details and protocol addresses from current official docs
- Never commit private keys, seed phrases, wallet secrets, or sensitive `.env` files
- Keep failed, corrected, or superseded experiments documented when they matter to the history
- Use AI tools as a building assistant, while keeping the project idea, decisions, wallet approvals, and final verification under human control

## Current direction

The next phase is less about collecting deployments on more chains and more about shipping projects that have a clear reason to exist.

- **Orbinum:** improve the current basic footprint only if there is a meaningful ecosystem-native direction
- **Monad:** build a small original NFT / art project with a real visual identity, mint experience, public repo, and launch story
- **Base:** build a more complete product-style app with a frontend, wallet/payment flow, and a real user use case

## Repo structure

```text
projects/
  arc/
  giwa-sepolia/
  soneium/
  ink/
  push-chain/
  x1-echochain/
  orbinum/
  abstract/
  seismic/
  rise-chain/
  dac/
  sandchain/
  trex/
```

Some folders are complete footprints; others are parked experiments or incomplete scaffolds. The featured table above is the best place to start.
