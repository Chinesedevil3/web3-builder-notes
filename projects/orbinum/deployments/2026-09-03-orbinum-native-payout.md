# OrbinumNativePayout — Orbinum Testnet

- Date: 2026-09-03
- Network: Orbinum Testnet
- Chain ID: `2700`
- Contract: `OrbinumNativePayout`
- Contract address: `0xc728A922B137C3C926D127Af34Aa3187e0e46F9d`
- Balances precompile: `0x0000000000000000000000000000000000000802`
- Deployment tx: pending capture

## Planned native flow

1. Fund the deployed contract with testnet ORB.
2. Convert an EVM recipient address to Orbinum `AccountId32` or use a native Substrate `AccountId32`.
3. Call `payout(bytes32,uint256)`.
4. The contract calls Orbinum's `Balances.transferKeepAlive` precompile.
5. Record the payout transaction and recipient once verified onchain.

Do not mark the native payout complete until a real funding transaction and successful precompile-backed payout exist.
