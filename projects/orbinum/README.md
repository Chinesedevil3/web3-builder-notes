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
- [ ] Call `ping()` once
- [ ] Read `totalPings` after the interaction
- [ ] Record the interaction transaction

## Deployment log
- Contract: OrbPing
- Contract address: 0xA337F467d176573f61A704b5cec4605e3b736ff4
- Deploy tx: 0x5fb7d0b2cd9fa109f6c08ac900c473f8b1713343497c53c7d59231115a50a94f
- Date: 2026-08-30

## Notes
Next step is to call `ping()` once, then read `totalPings` to confirm the state change. Never commit private keys, seed phrases or wallet secrets.
