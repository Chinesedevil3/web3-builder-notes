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
- [x] Fund the revised contract with testnet ORB
- [x] Confirm raw `eth_call` to the Balances precompile succeeds with selector `0x6a467394`
- [x] Send a direct transaction to Orbinum Balances precompile `0x0000000000000000000000000000000000000802`
- [x] Verify the direct precompile transaction succeeded onchain
- [x] Mark the native transfer complete

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
- Funding tx: `0xf2b7edf2c7c7795ef58aea56cf2d4e744163785c0fff800bf1ebde66cd73f880`
- Funding value reported from Remix: `200000000 wei`
- Status: deployed and funded; wrapper payout itself was not used as the final proof
- Date: 2026-09-04

The revised contract can hold ORB and, under owner control, call `transfer(bytes32,uint256)` on the precompile to move native ORB to an Orbinum `AccountId32`.

This is more meaningful than another generic Solidity contract because the precompile exposes Orbinum's native Substrate balances pallet directly to EVM contracts. A pure Substrate Sr25519/Ed25519 account can receive a payment even though it has no EVM `H160` address.

The helper `evmToAccountId32(address)` also documents Orbinum's unified EVM/Substrate account mapping: an EVM address becomes a 32-byte account ID by appending twelve zero bytes.

## Direct native precompile transaction

A raw `eth_call` using `transfer(bytes32,uint256)` with selector `0x6a467394` returned `0x`, confirming that the precompile accepted the calldata shape.

A real wallet transaction was then sent directly to the native Balances precompile and verified on the Orbinum explorer:

- Target precompile: `0x0000000000000000000000000000000000000802`
- Function selector: `0x6a467394` (`transfer(bytes32,uint256)`)
- Recipient `AccountId32`: `0x06a1e61244e6a55fd52375b3fab913af9249952b000000000000000000000000`
- Amount encoded: `1` base unit
- Transaction hash: `0x1c553820bc0aeb07d7cc2977bdaadd62e22efa6a306db4356369324698391088`
- Explorer result: **Success**
- Block: `#702413`
- Gas used: `26,572`
- Input size: `68 bytes`
- Selector shown by explorer: `0x6a467394`

## Why this matters

`OrbPing` proves basic EVM compatibility. The direct Balances-precompile transaction is the ecosystem-specific proof: EVM tooling successfully called Orbinum runtime functionality through a native precompile using the EVM ↔ Substrate account mapping.

A deeper privacy build can later use the ShieldedPool precompile at `0x0000000000000000000000000000000000000801`, but real shielded transfers require commitments, encrypted memos and ZK proofs generated with the Orbinum SDK, so they are intentionally not faked here.

## Final status

**Complete.** Orbinum's native Balances precompile was called successfully onchain from an EVM wallet using `transfer(bytes32,uint256)`. The explorer confirms the real transaction succeeded.

The earlier failed `transferKeepAlive` wrapper attempt remains documented as part of the debugging history rather than being rewritten as a success.

## Notes
Never commit private keys, seed phrases or wallet secrets.
