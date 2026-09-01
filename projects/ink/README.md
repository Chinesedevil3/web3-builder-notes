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
- [x] Confirm a successful `publish(string project, string uri)` interaction
- [ ] Re-check `latestAttestationUid` directly on the correct wrapper instance in Remix
- [x] Record the EAS wrapper deployment transaction
- [x] Record the verified publish transaction and attestation UID

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
6. Read `latestAttestationUid`. Also check `latestBuilder`, `latestProject`, and `latestUri`.

Record hashes and UIDs in `deployments/` only after those transactions exist onchain and the expected protocol event is verified.

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
- Publish status: `Success`
- Attestation UID: `0xbb461d2de5179984abdf00f559bee1b087cb3048c6d338f6bd059235b4c94f47`
- EAS event recipient: `0x06a1E61244E6A55FD52375b3faB913Af9249952b`
- EAS event attester: `0x57fdd36076F5fCf3176c25Fb814093Abcb3cE994`
- EAS event schema UID: `0x13c2d0e975350f51f2132b160aad18f8f32f239227e6d7428e1ba9c17f52062b`
- Date: 2026-09-01

## Why this matters
InkCounter proves a standard deploy/write/read flow on the testnet. `InkBuilderAttest` upgrades the footprint on Ink Mainnet by registering a real schema through the canonical SchemaRegistry predeploy and producing a real EAS attestation through the EAS predeploy.

## Notes
`increment()` was executed successfully on Ink Sepolia and the transaction is recorded above. The Ink Mainnet publish transaction is confirmed successful by the explorer and its canonical EAS `Attested` event records the attestation UID above. An earlier zero read in Remix came from an instance/readback mismatch and is not used as the attestation record; the direct wrapper read can be re-checked separately. Never commit private keys, seed phrases or wallet secrets.
