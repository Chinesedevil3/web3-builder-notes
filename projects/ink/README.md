# Ink builder notes

## Goal
Track genuine builder activity on Ink: the original Ink Sepolia counter footprint plus a stronger Ink Mainnet EAS / SchemaRegistry integration.

## Builder checklist
- [x] Connect wallet to Ink Sepolia
- [x] Deploy a tiny contract
- [x] Record contract address and deployment transaction
- [x] Test one contract interaction
- [x] Read contract state after the interaction
- [x] Record the interaction transaction
- [x] Register schema `address builder,string project,string uri` on Ink Mainnet SchemaRegistry
- [x] Record the schema UID
- [x] Deploy `InkBuilderAttest` on Ink Mainnet through Remix with a browser wallet
- [x] Call `publish(string project, string uri)`
- [ ] Read `latestAttestationUid` after the interaction
- [x] Record the EAS wrapper deployment transaction
- [x] Record the publish transaction
- [ ] Record the attestation UID

## Remix (Ink Mainnet EAS upgrade)
Use Remix Browser Extension / Injected Provider and a browser wallet. Do not paste a private key.

- Network Name: Ink
- RPC URL: `https://rpc-gel.inkonchain.com`
- Chain ID: `57073`
- Block Explorer: `https://explorer.inkonchain.com`
- Compiler: `0.8.24`

### Deploy order
1. Compile `eas/IInkSchemaRegistry.sol`. Choose that interface and use **+ Add Contract** with `0x4200000000000000000000000000000000000020`.
2. Call `register`:
   - schema: `address builder,string project,string uri`
   - resolver: `0x0000000000000000000000000000000000000000`
   - revocable: `true`
3. Copy the schema UID from the `Registered` event/logs in Remix or the explorer.
4. Compile `contracts/InkBuilderAttest.sol`. Deploy with:
   - `easAddress`: `0x4200000000000000000000000000000000000021`
   - `schemaUid_`: the schema UID from step 3
5. Call `publish` with a project name and a GitHub URI. Confirm in the wallet.
6. Read `latestAttestationUid` (must be non-zero). Also check `latestBuilder`, `latestProject`, and `latestUri`.

Record hashes and UIDs in `deployments/` only after those transactions exist onchain.

## InkCounter deployment log
- Network: Ink Sepolia
- Contract: InkCounter
- Contract address: `0x757c2d89937F5300304bb552eA2a35c469B64573`
- Deploy tx: `0x21e06955a91f88696b98ebfa6696fe47161cb3c2e156838bd9ab804d6618b520`
- Interaction tx: `0x1ada8b742f197709df72fed4f3eb914fb25bcde34631bcb0b3953c5af0ba74b9`
- Date: 2026-08-29

## EAS Mainnet activity
- Network: Ink Mainnet
- Chain ID: `57073`
- SchemaRegistry: `0x4200000000000000000000000000000000000020`
- EAS: `0x4200000000000000000000000000000000000021`
- Schema: `address builder,string project,string uri`
- Schema UID: `0x13c2d0e975350f51f2132b160aad18f8f32f239227e6d7428e1ba9c17f52062b`
- `InkBuilderAttest`: `0x57fdd36076F5fCf3176c25Fb814093Abcb3cE994`
- Deploy tx: `0x31eeae7352e11e9b3df40b96b8095d2203f621142c39cce04ed5a1a82e8aceee`
- Publish tx: `0x070e088573f01eb697a15f12696036de14d870583bb2f0c980f041ce50388304`
- `latestAttestationUid`: pending readback
- Date: 2026-09-01

## Why this matters
InkCounter proves a standard deploy/write/read flow on the testnet. `InkBuilderAttest` upgrades the footprint on Ink Mainnet by registering a real schema through the canonical SchemaRegistry predeploy and using the EAS predeploy for attestations, while exposing the returned attestation UID for a clear readback.

## Notes
`increment()` was executed successfully on Ink Sepolia and the transaction is recorded above. The EAS wrapper is deployed on Ink Mainnet and `publish` has been executed; the attestation UID readback remains pending. Never commit private keys, seed phrases or wallet secrets.
