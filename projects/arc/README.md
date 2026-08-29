# Arc network builder notes

## Goal
Track real builder activity on Arc Testnet with deployments and contract interactions.

## Builder checklist
- [x] Confirm the intended Arc Testnet environment
- [x] Connect wallet to Arc Testnet
- [x] Deploy one simple contract
- [x] Record the contract address and deploy transaction
- [x] Call one write function on the deployed contract
- [x] Read contract state after the interaction
- [x] Record the interaction transaction

## Deployment log
- Network: Arc Testnet
- Contract: ArcPalette
- Contract address: 0xcCa17c3c5E0f8d9E25d98b3EF157422c0B7428DF
- Deploy tx: 0x84f3d9c7a4552c2fe648ccce6a1568de464c3d7c7d60f579567c181a8fe7024d
- Interaction: `setColor("cosmic purple")`
- Interaction tx: 0x3c1846eec6ae94843f5b70725349e48bef4aa794d13f35df411d65904ed767be
- Date: 2026-08-30

## Notes
ArcPalette was deployed successfully and a write interaction was recorded. The current color can be read with `color()`. Never commit private keys, seed phrases or wallet secrets.
