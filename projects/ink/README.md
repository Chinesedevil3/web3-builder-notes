# Ink builder notes

## Goal
Track genuine activity and simple builder experiments on Ink.

## Builder checklist
- [x] Connect wallet to Ink Sepolia
- [x] Deploy a tiny contract
- [x] Record contract address and deployment transaction
- [ ] Test one contract interaction
- [ ] Read contract state after the interaction
- [ ] Record the interaction transaction

## Deployment log
- Network: Ink Sepolia
- Contract: InkCounter
- Contract address: 0x757c2d89937F5300304bb552eA2a35c469B64573
- Deploy tx: 0x21e06955a91f88696b98ebfa6696fe47161cb3c2e156838bd9ab804d6618b520
- Date: 2026-08-29

## Notes
Next step is to call `increment()` once, then read `count` to confirm the state change. Never commit private keys, seed phrases or wallet secrets.
