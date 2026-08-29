# Arc network builder notes

## Goal
Track real builder activity on Arc Testnet with deployments and contract interactions.

## Builder checklist
- [x] Confirm the intended Arc Testnet environment
- [x] Connect wallet to Arc Testnet
- [x] Deploy one simple contract
- [x] Record the contract address and deploy transaction
- [ ] Call one write function on the deployed contract
- [ ] Read contract state after the interaction
- [ ] Record the interaction transaction

## Deployment log
- Network: Arc Testnet
- Contract: ArcPalette
- Contract address: 0xcCa17c3c5E0f8d9E25d98b3EF157422c0B7428DF
- Deploy tx: 0x84f3d9c7a4552c2fe648ccce6a1568de464c3d7c7d60f579567c181a8fe7024d
- Date: 2026-08-30

## Notes
Next step is to call `setColor("cosmic purple")`, then read `color` to confirm the state change. Never commit private keys, seed phrases or wallet secrets.
