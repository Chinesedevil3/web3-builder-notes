# web3-builder-notes

Creative Web3 experiments, onchain builds, and AI-assisted prototypes.

I'm a creator and artist learning by shipping real onchain projects. I use AI as a building tool, work with official ecosystem primitives where possible, and document the actual contracts, transactions, failures, fixes, and results.

## Featured builds

| Project | Network | What I built | Status |
|---|---|---|---|
| [Arc](projects/arc/) | Arc Testnet | ERC-8004 agent identity + full ERC-8183 agentic-commerce flow with USDC escrow, deliverable commitment, submission and settlement | Strong / complete |
| [Orbinum](projects/orbinum/) | Orbinum Testnet | Native Balances-precompile transfer using Orbinum's EVM ↔ Substrate account mapping, verified successful onchain | Strong / complete |
| [Soneium](projects/soneium/) | Soneium Mainnet + Minato | Creator contract on Minato, then a mainnet EAS schema registration and creator attestation | Strong / complete |
| [Ink](projects/ink/) | Ink Mainnet + Sepolia | Upgraded from a basic Sepolia contract to a mainnet `InkBuilderAttest` wrapper using SchemaRegistry + EAS with a verified attestation UID | Strong / complete |
| [GIWA](projects/giwa-sepolia/) | GIWA Sepolia | `GiwaVerifiedCreator` integrated with GIWA Dojang verification and published a verified creator proof | Strong / complete |
| [Push Chain](projects/push-chain/) | Push Donut Testnet | EVM contract + state interaction + Push-native Universal Transaction originating from Ethereum Sepolia | Strong / complete |
| [X1 EcoChain](projects/x1-echochain/) | X1 Testnet | Builder registry with an onchain profile, published build proof, and verified readbacks | Good / complete |

## What is inside

- Real deployment and interaction records
- Solidity contracts and protocol integrations
- Mainnet and testnet experiments
- Agent identity / agentic-commerce flows
- EAS / SchemaRegistry attestations
- Universal transaction experiments
- Builder notes with transaction hashes, contract addresses, UIDs, readbacks, failures, and fixes

Each project folder keeps its own README and deployment records. Older experiments stay in the repo when they are useful learning history, but the featured builds above are the strongest place to start.

## Working principles

- Use real onchain activity, not invented deployment records
- Prefer chain-native primitives over repeating generic counters
- Verify network details and protocol addresses from current official docs
- Never commit private keys, seed phrases, wallet secrets, or sensitive `.env` files
- Keep failed, corrected, or superseded experiments documented when they matter to the history
- Use AI as a building assistant while keeping the project idea, creative direction, wallet approvals, and final verification under human control

## Now building

- **Monad:** a small original NFT / art project with a real visual identity, mint experience, public repo, and launch story
- **Base:** a more complete product-style app with a frontend, wallet/payment flow, and a real user use case

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

Some folders are complete footprints; others are parked experiments or incomplete scaffolds.
