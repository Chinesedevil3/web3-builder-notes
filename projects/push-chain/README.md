# Push Chain Donut builder notes

## Goal
Track a real universal-message contract deployment and interaction on Push Chain Donut Testnet.

## Builder checklist
- [x] Connect wallet to Push Chain Donut Testnet
- [x] Deploy one universal-message contract
- [x] Record contract address and deployment transaction
- [x] Call `sendSignal("gm push", "ethereum")`
- [x] Read `totalSignals` after the interaction
- [x] Record the interaction transaction

## Deployment log
- Network: Push Chain Donut Testnet
- Contract: PushUniversalSignal
- Contract address: 0xf0320c444Fd314fb31E2B7A73Dc7373A71e79cF4
- Deploy tx: 0x554512a3b64009f293ba265cd44d06202a3b8c1263933198b0e3261506eadf1b
- Interaction tx: 0x54d76f3106b61c350460919607ec134a78f427fbf866bcce1662bc369263612c
- Read check: `totalSignals = 1`
- Date: 2026-08-30

## Notes
Completed one state-changing message interaction and confirmed the stored signal count on Push Chain Donut Testnet. Never commit private keys, seed phrases or wallet secrets.
