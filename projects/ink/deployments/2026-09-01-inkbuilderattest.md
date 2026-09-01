# InkBuilderAttest — Ink Mainnet deployment

- Date: 2026-09-01
- Network: Ink Mainnet
- Chain ID: `57073`
- Compiler: Solidity `0.8.24`
- Deployment path: Remix Browser Extension / Rabby Wallet

## Protocol addresses

- SchemaRegistry: `0x4200000000000000000000000000000000000020`
- EAS: `0x4200000000000000000000000000000000000021`

## Schema

- Schema: `address builder,string project,string uri`
- Resolver: `0x0000000000000000000000000000000000000000`
- Revocable: `true`
- Schema UID: `0x13c2d0e975350f51f2132b160aad18f8f32f239227e6d7428e1ba9c17f52062b`

## Contract deployment

- Contract: `InkBuilderAttest`
- Contract address: `0x57fdd36076F5fCf3176c25Fb814093Abcb3cE994`
- Deploy tx: `0x31eeae7352e11e9b3df40b96b8095d2203f621142c39cce04ed5a1a82e8aceee`
- Constructor EAS address: `0x4200000000000000000000000000000000000021`
- Constructor schema UID: `0x13c2d0e975350f51f2132b160aad18f8f32f239227e6d7428e1ba9c17f52062b`

## EAS publish interaction

- Project: `Ink EAS builder attestation`
- URI: `https://github.com/Chinesedevil3/web3-builder-notes/tree/main/projects/ink`
- Publish tx: `0x070e088573f01eb697a15f12696036de14d870583bb2f0c980f041ce50388304`
- `latestAttestationUid`: pending readback

The publish transaction now exists on Ink Mainnet. The remaining check is to read `latestAttestationUid` from the deployed wrapper and confirm it is non-zero, then record that exact UID here.
