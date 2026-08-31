# X1 EcoChain testnet

## Goal
Track real X1 builder activity with deployed contracts, state-changing interactions and a builder registry rather than repeated counters.

## Builder checklist
- [x] Connect wallet to X1 EcoChain testnet
- [x] Claim testnet funds
- [x] Deploy and interact with X1Counter
- [x] Deploy X1BuilderRegistry
- [ ] Register builder profile on the real X1 deployment
- [ ] Publish one build proof on the real X1 deployment
- [ ] Read back stored profile/build state
- [ ] Verify source on the X1 explorer if available

## First deployment
- Network: X1 EcoChain testnet (chain 10778)
- Contract: X1Counter
- Contract address: 0xEE855e37907D0e69aB8bDdbb2BD5900e7EA2f0C2
- Deploy tx: 0x8ac1b50db07631b2aafd9ecf63cbfd3f3f4769bb366b68535f933279b20ae0a9
- Interaction tx: 0x2b673bfb639674d47b7d94848a37d276f1ceeb8a4dd6ed0de943016be9437847
- Observed count after interactions: 4
- Date: 2026-08-29

## Builder registry deployment
- Network: X1 EcoChain testnet (chain 10778)
- Contract: X1BuilderRegistry
- Contract address: 0x83747a438A880F161dD74aB6E86331Be3669FFF0
- Deploy tx: 0x270e2b71fa96ff589d2f258beeaf5660ca5cd458d8f91ce3093820ae0bc16881
- Date: 2026-08-31

## Interaction correction
A Remix readback on the real X1 deployment returned an empty profile (`name = ""`, `buildCount = 0`). The Remix terminal also showed old Remix VM instances mixed with the real network instance, including a VM `publishBuild` revert with `register profile first`. Because the previously supplied profile/build transaction hashes could not be reconciled with the state of the real deployment, they are intentionally not treated as verified X1 interactions here.

## Why this matters
X1Counter proves a basic deploy/write/read flow. X1BuilderRegistry adds a more useful builder identity + build-proof registry. The next interactions should be made against the exact deployed address on chain and then read back before being recorded.

## Notes
Never commit seed phrases, private keys or wallet secrets.
