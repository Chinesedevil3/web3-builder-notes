# Orbinum builder notes

Orbinum is EVM-compatible, so this folder is for small Solidity experiments and real deployment records.

## Network
- Testnet chain ID: 2700
- Native currency: ORB
- RPC: https://rpc-1.testnet.orbinum.io
- Explorer: https://explorer.testnet.orbinum.network

## Builder checklist
- [x] Connect wallet to Orbinum Testnet
- [x] Deploy one small contract
- [x] Record contract address and deployment transaction
- [x] Call `ping()` once
- [x] Read `totalPings` after the interaction
- [x] Record the interaction transaction

## Deployment log
- Contract: OrbPing
- Contract address: 0xA337F467d176573f61A704b5cec4605e3b736ff4
- Deploy tx: 0x5fb7d0b2cd9fa109f6c08ac900c473f8b1713343497c53c7d59231115a50a94f
- Interaction tx: 0x6bc776ddeb8a3167a576e6f69e683496b8ce945b597d36ec33afcd9808baa902
- Confirmed `totalPings`: 1
- Date: 2026-08-30

## Notes
`ping()` was sent successfully and `totalPings` was read back as `1`, confirming the state change. Never commit private keys, seed phrases or wallet secrets.
