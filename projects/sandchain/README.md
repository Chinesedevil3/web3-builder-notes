# SANDchain Silica builder notes

## Goal
Track a creator-focused contract deployment and interaction on SANDchain Silica.

## Builder checklist
- [x] Connect wallet to SANDchain Silica
- [x] Deploy one creator-focused contract
- [x] Record contract address and deployment transaction
- [x] Call `supportCreator("gm creator nation")`
- [x] Read `totalSupporters` after the interaction
- [x] Record the interaction transaction

## Deployment log
- Network: SANDchain Silica
- Contract: SandCreatorSupport
- Contract address: 0x990a4DeB6a81aC61692E6c2B5b44564a80C3d1Ad
- Deploy tx: 0x6d093ce08a51a75e8a08c14aa7f82fe78d03b36a713518887cbb18e1f99fd894
- Interaction tx: 0x8b255f847b4cbc76daacfac88a427f052010e7e66a5781f8792e1be9e9d8870c
- totalSupporters: 1
- Date: 2026-08-30

## Notes
`supportCreator("gm creator nation")` was sent successfully and `totalSupporters` returned `1`. Never commit private keys, seed phrases or wallet secrets.
