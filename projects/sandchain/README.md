# SANDchain Silica builder notes

## Goal
Track a creator-focused contract deployment and interaction on SANDchain Silica.

## Builder checklist
- [x] Connect wallet to SANDchain Silica
- [x] Deploy one creator-focused contract
- [x] Record contract address and deployment transaction
- [ ] Call `supportCreator("gm creator nation")`
- [ ] Read `totalSupporters` after the interaction
- [ ] Record the interaction transaction

## Deployment log
- Network: SANDchain Silica
- Contract: SandCreatorSupport
- Contract address: 0x990a4DeB6a81aC61692E6c2B5b44564a80C3d1Ad
- Deploy tx: 0x6d093ce08a51a75e8a08c14aa7f82fe78d03b36a713518887cbb18e1f99fd894
- Date: 2026-08-30

## Notes
Next step is to call `supportCreator("gm creator nation")`, then read `totalSupporters` to confirm the state change. Never commit private keys, seed phrases or wallet secrets.
