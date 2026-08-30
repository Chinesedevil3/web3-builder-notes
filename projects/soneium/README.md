# Soneium Minato builder notes

## Goal
Track a real creator-oriented contract deployment and interaction on Soneium Minato.

## Builder checklist
- [x] Connect wallet to Soneium Minato
- [x] Deploy one creator-focused contract
- [x] Record contract address and deployment transaction
- [x] Call `publish("gm soneium")`
- [x] Read `latestNote` after the interaction
- [x] Record the interaction transaction

## Deployment log
- Network: Soneium Minato
- Contract: SoneiumCreatorNote
- Contract address: 0xE22E6dCB8f5De3B077Aa12262e0585AE08ad7e6C
- Deploy tx: 0x31df49402b2d662ff0c3497c47d9c91859fd18f92139e9e7c77accd05bc0c21c
- Interaction tx: 0x56a33ac11b3480a2f34b03e4f71511d97b13e708fd5ae697b0e55e8bab813786
- Read result: latestNote = "gm soneium"
- Date: 2026-08-30

## Notes
The contract was deployed and `publish("gm soneium")` was sent successfully. Reading `latestNote` confirmed the stored note. Never commit private keys, seed phrases or wallet secrets.
