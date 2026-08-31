# Soneium builder notes

## Goal
Track real creator-oriented builder activity across Soneium, including both contract deployment activity and ecosystem-native mainnet primitives.

## Builder checklist
- [x] Deploy a creator-focused contract on Soneium Minato
- [x] Call `publish("gm soneium")`
- [x] Read `latestNote` after the interaction
- [x] Record Minato deployment and interaction transactions
- [x] Connect wallet to Soneium Mainnet
- [x] Interact with the Soneium EAS SchemaRegistry predeploy
- [x] Register a creator-oriented schema on Soneium Mainnet
- [x] Record the schema UID
- [x] Create a mainnet attestation using the registered schema
- [ ] Record the attestation UID

## Minato deployment log
- Network: Soneium Minato
- Contract: SoneiumCreatorNote
- Contract address: 0xE22E6dCB8f5De3B077Aa12262e0585AE08ad7e6C
- Deploy tx: 0x31df49402b2d662ff0c3497c47d9c91859fd18f92139e9e7c77accd05bc0c21c
- Interaction: `publish("gm soneium")`
- Interaction tx: 0x56a33ac11b3480a2f34b03e4f71511d97b13e708fd5ae697b0e55e8bab813786
- Read result: latestNote = "gm soneium"
- Date: 2026-08-30

## Mainnet EAS activity
- Network: Soneium Mainnet
- SchemaRegistry: `0x4200000000000000000000000000000000000020`
- EAS: `0x4200000000000000000000000000000000000021`
- Schema: `address creator,string signal,string context`
- Resolver: `0x0000000000000000000000000000000000000000`
- Revocable: `true`
- Registration tx: `0x6c5a31e074170baf6fea8ee14091a13b7a442e806c875eeebced8222f633ba69`
- Schema UID: `0xaaccf0fbc4adacfab19c6b70be80639f3f282064920205a4d0d9dc79830db928`
- Attestation signal: `gm soneium`
- Attestation context: `mainnet creator attestation`
- Attestation tx: `0x0f0607752e8431f9fefb8a91aada5d573dc32b5585afa5b12280b481e29f36e8`
- Date: 2026-08-31

## Why this matters
The Minato activity proves a standard creator-contract deployment flow, while the mainnet SchemaRegistry and EAS interactions use Soneium-native predeploys rather than another generic contract. Registering a schema and then issuing a real creator attestation creates a stronger mainnet builder footprint.

## Notes
Never commit private keys, seed phrases or wallet secrets.
