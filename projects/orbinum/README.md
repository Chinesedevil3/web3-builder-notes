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
- [x] Deploy `OrbinumNativePayout`
- [ ] Record the `OrbinumNativePayout` deployment transaction hash
- [ ] Fund the deployed contract with testnet ORB
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

Current deployment:
- Contract: `OrbinumNativePayout`
- Contract address: `0xc728A922B137C3C926D127Af34Aa3187e0e46F9d`
- Network: Orbinum Testnet (`2700`)
- Deployment tx: pending capture
- Date: 2026-09-03

The contract can hold ORB and, under owner control, call `transferKeepAlive(bytes32,uint256)` on the precompile to move native ORB to an Orbinum `AccountId32`.

This is more meaningful than another generic Solidity contract because the precompile exposes Orbinum's native Substrate balances pallet directly to EVM contracts. A pure Substrate Sr25519/Ed25519 account can receive a payment even though it has no EVM `H160` address.

The helper `evmToAccountId32(address)` also documents Orbinum's unified EVM/Substrate account mapping: an EVM address becomes a 32-byte account ID by appending twelve zero bytes.

## Why this matters

`OrbPing` proves basic EVM compatibility. `OrbinumNativePayout` is the actual ecosystem-specific upgrade: Solidity calling Orbinum runtime functionality through a native precompile and bridging the EVM and Substrate address spaces.

A deeper privacy build can later use the ShieldedPool precompile at `0x0000000000000000000000000000000000000801`, but real shielded transfers require commitments, encrypted memos and ZK proofs generated with the Orbinum SDK, so they are intentionally not faked here.

## Notes
Never commit private keys, seed phrases or wallet secrets. Only mark the native payout flow complete after the real testnet funding and payout transactions exist.
