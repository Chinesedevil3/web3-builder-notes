# X1BuilderRegistry deployment

- Network: X1 EcoChain testnet
- Chain ID: 10778
- Contract: X1BuilderRegistry
- Contract address: 0x83747a438A880F161dD74aB6E86331Be3669FFF0
- Deploy tx: 0x270e2b71fa96ff589d2f258beeaf5660ca5cd458d8f91ce3093820ae0bc16881
- Date: 2026-08-31

## Interaction status
The real deployment currently reads back an empty profile (`name = ""`, `buildCount = 0`). Remix also showed old VM contract instances alongside the real X1 deployment. Previous profile/build transaction hashes are therefore not recorded here as verified interactions.

Next action: attach Remix directly to the exact onchain contract address, register the profile again, read it back, then publish and read back build #1.
