# Orbinum builder notes

## Goal
Track real Orbinum builder activity, moving from a basic EVM deploy into Orbinum-specific EVM ↔ Substrate functionality.

## Network
- Network: Orbinum Testnet
- Chain ID: `2700`
- Native currency: `ORB` (18 decimals)
- RPC: `https://rpc-1.testnet.orbinum.io`
- Explorer: `https://explorer.testnet.orbinum.network`
- Mainnet: not live yet

## Builder checklist
- [x] Connect wallet to Orbinum Testnet
- [x] Deploy and interact with `OrbPing`
- [x] Record the first deployment and readback
- [x] Add an Orbinum-native precompile integration contract
- [x] Deploy the first `OrbinumNativePayout` test instance
- [x] Fund the first test instance with testnet ORB
- [x] Confirm EVM → `AccountId32` mapping with `evmToAccountId32`
- [x] Diagnose the first `transferKeepAlive` payout attempt as reverting during gas estimation
- [x] Switch the payout implementation to `Balances.transfer(bytes32,uint256)`
- [x] Deploy the revised `OrbinumNativePayout`
- [ ] Record the revised deployment transaction hash
- [ ] Fund the revised contract with testnet ORB
- [ ] Use Orbinum Balances precompile `0x0000000000000000000000000000000000000802`
- [ ] Pay an `AccountId32` through the native Substrate balances pallet
- [ ] Record the payout transaction and recipient

## First deployment — OrbPing
- Contract: `OrbPing`
- Contract address: `0xA337F467d176573f61A704b5cec4605e3b736ff4`
- Deploy tx: `0x5fb7d0b2cd9fa109f6c08ac900c473f8b1713343497c53c7d59231115a50a94f`
- Interaction tx: `0x6bc776ddeb8a3167a576e6f69e683496b8ce945b597d36ec33afcd9808baa902`
- Confirmed `totalPings`: `1`
- Date: 2026-08-30

## Native upgrade — EVM to Substrate payout

`contracts/OrbinumNativePayout.sol` integrates Orbinum's Balances precompile at:

`0x0000000000000000000000000000000000000802`

### First test instance
- Contract address: `0xc728A922B137C3C926D127Af34Aa3187e0e46F9d`
- Network: Orbinum Testnet (`2700`)
- Deployment tx: pending capture
- Funding amount: `0.1 ORB`
- Funding tx: `0x956b7bb14ff1b54d16f17c84d0bf29bd4dd47d913e0d4adbb837ff142a9df56c`
- EVM recipient: `0x06a1E61244E6A55FD52375b3faB913Af9249952b`
- Derived `AccountId32`: `0x06a1e61244e6a55fd52375b3fab913af9249952b000000000000000000000000`
- Result: `transferKeepAlive` payout reverted during gas estimation with no revert data, so it was not force-sent.

### Revised transfer instance
- Contract address: `0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47`
- Network: Orbinum Testnet (`2700`)
- Deployment tx: pending capture
- Payout implementation: `Balances.transfer(bytes32,uint256)`
- Status: deployed; funding and payout still pending
- Date: 2026-09-04

The revised contract can hold ORB and, under owner control, call `transfer(bytes32,uint256)` on the precompile to move native ORB to an Orbinum `AccountId32`.

This is more meaningful than another generic Solidity contract because the precompile exposes Orbinum's native Substrate balances pallet directly to EVM contracts. A pure Substrate Sr25519/Ed25519 account can receive a payment even though it has no EVM `H160` address.

The helper `evmToAccountId32(address)` also documents Orbinum's unified EVM/Substrate account mapping: an EVM address becomes a 32-byte account ID by appending twelve zero bytes.

## Why this matters

`OrbPing` proves basic EVM compatibility. `OrbinumNativePayout` is the actual ecosystem-specific upgrade: Solidity calling Orbinum runtime functionality through a native precompile and bridging the EVM and Substrate address spaces.

A deeper privacy build can later use the ShieldedPool precompile at `0x0000000000000000000000000000000000000801`, but real shielded transfers require commitments, encrypted memos and ZK proofs generated with the Orbinum SDK, so they are intentionally not faked here.

## Notes
Never commit private keys, seed phrases or wallet secrets. Only mark the native payout flow complete after the revised contract has a real testnet funding transaction and successful precompile-backed payout.
