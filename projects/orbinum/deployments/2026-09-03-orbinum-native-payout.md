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
- EVM recipient: `0x06a1E61244E6A55FD52375b3faB913Af9249952b`
- Derived `AccountId32`: `0x06a1e61244e6a55fd52375b3fab913af9249952b000000000000000000000000`

## Native flow

1. Contract deployed on Orbinum Testnet.
2. Contract funded with testnet ORB.
3. EVM recipient mapped to an Orbinum `AccountId32` using the contract helper.
4. Call `payout(bytes32,uint256)`.
5. The contract calls Orbinum's `Balances.transferKeepAlive` precompile.
6. Record the payout transaction once verified onchain.

Funding and address mapping are recorded. Do not mark the native payout complete until a successful precompile-backed payout exists.


## Revised transfer instance — 2026-09-04

- Contract address: `0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47`
- Payout implementation: `Balances.transfer(bytes32,uint256)`
- Funding tx: `0xf2b7edf2c7c7795ef58aea56cf2d4e744163785c0fff800bf1ebde66cd73f880`
- Funding value reported from Remix: `200000000 wei`
- Payout status: pending
