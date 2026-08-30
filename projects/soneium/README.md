# Soneium Minato builder notes

## Goal
Track a real creator-oriented contract deployment and interaction on Soneium Minato.

## Builder checklist
- [x] Connect wallet to Soneium Minato
- [x] Deploy one creator-focused contract
- [x] Record contract address and deployment transaction
- [ ] Call `publish("gm soneium")`
- [ ] Read `latestNote` after the interaction
- [ ] Record the interaction transaction

## Deployment log
- Network: Soneium Minato
- Contract: SoneiumCreatorNote
- Contract address: 0xE22E6dCB8f5De3B077Aa12262e0585AE08ad7e6C
- Deploy tx: 0x31df49402b2d662ff0c3497c47d9c91859fd18f92139e9e7c77accd05bc0c21c
- Date: 2026-08-30

## Notes
Next step is to publish one note, then read `latestNote` to confirm the state change. Never commit private keys, seed phrases or wallet secrets.
