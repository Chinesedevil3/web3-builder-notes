# X1 EcoChain testnet

## Goal
Track real X1 builder activity with deployed contracts, state-changing interactions and a builder registry rather than repeated counters.

## Builder checklist
- [x] Connect wallet to X1 EcoChain testnet
- [x] Claim testnet funds
- [x] Deploy and interact with X1Counter
- [x] Deploy X1BuilderRegistry
- [x] Register builder profile
- [ ] Publish one build proof
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
- Profile name: ChineseDevil
- Profile URI: https://github.com/Chinesedevil3/web3-builder-notes
- Profile registration tx: 0xd2b3d5c2ee7bc443a98aa322c1f27bdcab3bab3ebe247f9956411b2f4fe42f0c
- Date: 2026-08-31

## Why this matters
X1Counter proves a basic deploy/write/read flow. X1BuilderRegistry adds a more useful builder identity + build-proof registry, giving the X1 footprint a clearer purpose than another generic counter.

## Notes
The earlier Remix VM deployment was local-only and was replaced with real wallet-signed X1 testnet activity. Never commit seed phrases, private keys or wallet secrets.
