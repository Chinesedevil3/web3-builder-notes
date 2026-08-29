# X1 EcoChain testnet

## Goal
Track real testnet activity and small builder experiments without spam commits.

## Builder checklist
- [ ] Confirm current network/RPC details from the official X1 testnet app or wallet prompt
- [x] Connect wallet
- [x] Claim testnet funds
- [ ] Send a normal test transaction
- [x] Deploy one tiny test contract
- [x] Record contract address and transaction hash below
- [x] Test one interaction with the deployed contract

## Deployment log
- Network: X1 EcoChain testnet (custom chain 10778 in Remix/Rabby)
- Contract: X1Counter
- Contract address: 0xEE855e37907D0e69aB8bDdbb2BD5900e7EA2f0C2
- Deploy tx: 0x8ac1b50db07631b2aafd9ecf63cbfd3f3f4769bb366b68535f933279b20ae0a9
- Interaction tx: 0x2b673bfb639674d47b7d94848a37d276f1ceeb8a4dd6ed0de943016be9437847
- Observed count after interactions: 4
- Date: 2026-08-29

## Notes
The earlier Remix VM deployment was local-only and has been replaced here with the real wallet-signed X1 testnet deployment. The deployed counter was successfully written to and read back from chain. Never commit seed phrases, private keys or wallet secrets.
