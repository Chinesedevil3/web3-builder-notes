# GIWA Sepolia builder notes

## Goal
Track real builder activity on GIWA Sepolia with deploys, interactions and bridge records.

## Builder checklist
- [x] Connect wallet to GIWA Sepolia
- [x] Deploy one small test contract
- [x] Record contract address and deployment transaction
- [ ] Call one write function on the deployed contract
- [ ] Read contract state after the interaction
- [ ] Record the interaction transaction
- [ ] Optionally record a real bridge test separately

## Contract deployment
- Network: GIWA Sepolia
- Contract: GiwaGuestbook
- Contract address: 0x943d9535a16C55D840A6cd37928394f51F7Be8F5
- Deploy tx: 0xb7e56d1874466204cb22e5cf51c7fe2725128906acd46e9fa06b78d84aab5072
- Date: 2026-08-29

## Notes
Next step is to call `saveNote()` once, then read `totalNotes` or `notes(address)` to confirm the state change. Never commit private keys, seed phrases or wallet secrets.
