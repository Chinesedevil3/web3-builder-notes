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

## Verified EAS publish interaction

- Project: `Ink EAS builder attestation`
- URI: `https://github.com/Chinesedevil3/web3-builder-notes/tree/main/projects/ink`
- Publish tx: `0x070e088573f01eb697a15f12696036de14d870583bb2f0c980f041ce50388304`
- Transaction status: `Success`
- Attestation UID: `0xbb461d2de5179984abdf00f559bee1b087cb3048c6d338f6bd059235b4c94f47`
- EAS `Attested` recipient: `0x06a1E61244E6A55FD52375b3faB913Af9249952b`
- EAS `Attested` attester: `0x57fdd36076F5fCf3176c25Fb814093Abcb3cE994`
- EAS `Attested` schema UID: `0x13c2d0e975350f51f2132b160aad18f8f32f239227e6d7428e1ba9c17f52062b`

The Ink explorer confirms the publish transaction succeeded and the canonical EAS contract emitted an `Attested` event with the UID above. A previous zero value seen in Remix was an incorrect/stale wrapper readback and is not used as the protocol attestation record. The wrapper's direct `latestAttestationUid` read can be re-checked on the correct deployed instance as an optional final UI verification.
