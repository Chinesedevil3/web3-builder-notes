# OrbinumNativePayout — Orbinum Testnet

- Date: 2026-09-03
- Network: Orbinum Testnet
- Chain ID: `2700`
- Contract: `OrbinumNativePayout`
- Contract address: `0xc728A922B137C3C926D127Af34Aa3187e0e46F9d`
- Balances precompile: `0x0000000000000000000000000000000000000802`
- Deployment tx: pending capture
- Funding amount: `0.1 ORB`
- Funding tx: `0x956b7bb14ff1b54d16f17c84d0bf29bd4dd47d913e0d4adbb837ff142a9df56c`

## Native flow

1. Contract deployed on Orbinum Testnet.
2. Contract funded with testnet ORB.
3. Convert an EVM recipient address to Orbinum `AccountId32` or use a native Substrate `AccountId32`.
4. Call `payout(bytes32,uint256)`.
5. The contract calls Orbinum's `Balances.transferKeepAlive` precompile.
6. Record the payout transaction and recipient once verified onchain.

Funding is now recorded. Do not mark the native payout complete until a successful precompile-backed payout exists.
