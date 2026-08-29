# GIWA Sepolia builder notes

## Goal
Track real builder activity on GIWA Sepolia with deploys, interactions and bridge records.

## Builder checklist
- [x] Connect wallet to GIWA Sepolia
- [x] Deploy one small test contract
- [x] Record contract address and deployment transaction
- [x] Call one write function on the deployed contract
- [x] Read contract state after the interaction
- [x] Record the interaction transaction
- [ ] Optionally record a real bridge test separately

## Contract deployment
- Network: GIWA Sepolia
- Contract: GiwaGuestbook
- Contract address: 0x943d9535a16C55D840A6cd37928394f51F7Be8F5
- Deploy tx: 0xb7e56d1874466204cb22e5cf51c7fe2725128906acd46e9fa06b78d84aab5072
- Interaction tx: 0xf9e3511e481f33329ed97abcbdffe78003529cb31995a2c0fc0bf548516a6f65
- State check: totalNotes = 1
- Date: 2026-08-29

## Notes
GiwaGuestbook was deployed and successfully tested with a write (`saveNote`) and read (`totalNotes`) interaction. Never commit private keys, seed phrases or wallet secrets.
