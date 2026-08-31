# X1BuilderRegistry deployment

- Network: X1 EcoChain testnet
- Chain ID: 10778
- Contract: X1BuilderRegistry
- Contract address: 0x83747a438A880F161dD74aB6E86331Be3669FFF0
- Deploy tx: 0x270e2b71fa96ff589d2f258beeaf5660ca5cd458d8f91ce3093820ae0bc16881
- Date: 2026-08-31

## Verified interaction flow
Remix was attached directly to the exact deployed contract address before retrying the builder interactions.

- Profile name: ChineseDevil
- Profile URI: https://github.com/Chinesedevil3/web3-builder-notes
- Profile registration tx: 0xa82ec1feab7855c0196fbc2e42de1579d421ebaf1a5f0ab66949016e0fcd5dde
- Build project: X1 builder registry
- Build proof URI: https://github.com/Chinesedevil3/web3-builder-notes/tree/main/projects/x1-echochain
- Build publication tx: 0x4da159f91089f5fd3234c47b32771b0378aa804966f8768340707f025fda43a7

## Readback
The same attached onchain contract instance was queried after the writes:
- `profiles(wallet)` returned the expected profile and `buildCount = 1`
- `builds(wallet, 1)` returned the expected project and proof URI

Earlier mixed Remix VM interaction hashes are intentionally excluded from the verified X1 record.

Next optional action: verify the contract source on the X1 explorer once indexing/support is available.
