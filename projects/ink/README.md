# Ink builder notes

## Goal
Track genuine builder activity on Ink Sepolia, including a first contract deploy and an EAS / SchemaRegistry attestation wrapper.

## Builder checklist
- [x] Connect wallet to Ink Sepolia
- [x] Deploy a tiny contract
- [x] Record contract address and deployment transaction
- [x] Test one contract interaction
- [x] Read contract state after the interaction
- [x] Record the interaction transaction
- [ ] Register schema `address builder,string project,string uri` on SchemaRegistry
- [ ] Record the schema UID
- [ ] Deploy `InkBuilderAttest` through Remix with a browser wallet
- [ ] Call `publish(string project, string uri)`
- [ ] Read `latestAttestationUid` after the interaction
- [ ] Record the deploy and publish transactions

## Remix (Ink Sepolia)
Use Remix Injected Provider and a browser wallet. Do not paste a private key.

- Network Name: Ink Sepolia
- RPC URL: `https://rpc-gel-sepolia.inkonchain.com`
- Chain ID: `763373`
- Block Explorer: `https://explorer-sepolia.inkonchain.com`
- Compiler: `0.8.24`

### Deploy order
1. Compile `eas/IInkSchemaRegistry.sol`. Choose that contract and **+ Add Contract** `0x4200000000000000000000000000000000000020`.
2. Call `register`:
   - schema: `address builder,string project,string uri`
   - resolver: `0x0000000000000000000000000000000000000000`
   - revocable: `true`
3. Copy the schema UID from the Registered event/logs in Remix or the explorer.
4. Compile `contracts/InkBuilderAttest.sol`. Deploy with:
   - `easAddress`: `0x4200000000000000000000000000000000000021`
   - `schemaUid_`: the schema UID from step 3
5. Call `publish` with a project name and a GitHub URI. Confirm in the wallet.
6. Read `latestAttestationUid` (must be non-zero). Also check `latestBuilder`, `latestProject`, and `latestUri`.

Record hashes and UIDs in `deployments/` only after those transactions exist on Ink Sepolia.

## InkCounter deployment log
- Network: Ink Sepolia
- Contract: InkCounter
- Contract address: 0x757c2d89937F5300304bb552eA2a35c469B64573
- Deploy tx: 0x21e06955a91f88696b98ebfa6696fe47161cb3c2e156838bd9ab804d6618b520
- Interaction tx: 0x1ada8b742f197709df72fed4f3eb914fb25bcde34631bcb0b3953c5af0ba74b9
- Date: 2026-08-29

## EAS activity
Not recorded yet. After a real Remix register / deploy / `publish` on Ink Sepolia, add `deployments/<date>-inkbuilderattest.md` with SchemaRegistry, EAS, schema UID, contract address, deploy tx, publish tx, and `latestAttestationUid`.

## Why this matters
InkCounter proves a standard deploy/write/read flow. `InkBuilderAttest` goes further by registering a schema on Ink's SchemaRegistry predeploy and writing a real EAS attestation through the EAS predeploy, then exposing the attestation UID for a simple readback.

## Notes
`increment()` was executed successfully and the InkCounter interaction transaction is recorded above. Never commit private keys, seed phrases or wallet secrets.
