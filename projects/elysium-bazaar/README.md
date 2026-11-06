# Elysium Bazaar

A minimal, non-custodial-in-the-user-wallet NFT marketplace prototype for Kinetiq Elysium Testnet (chain ID 99801).

## MVP scope

- ERC-721 only
- Sellers escrow an NFT into the marketplace when creating a fixed-price listing
- Buyers purchase with the chain's native currency (HYPE on Elysium)
- Sellers can cancel and reclaim their NFT
- No marketplace fee in this first version
- No royalties in this first version
- No ERC-1155, offers, auctions, or automatic collection indexing yet

## Safety and status

This is an experimental testnet prototype, not audited software. Do not use it with valuable NFTs or mainnet funds. The contract has not been deployed or tested against Elysium in this repository yet. Unit tests use a local mock ERC-721.

The marketplace does not magically provide inventory: NFT owners must list their own existing ERC-721 tokens. A token must be approved for transfer to the marketplace before listing.

## Contract

See [ElysiumBazaar.sol](contracts/ElysiumBazaar.sol).

The contract holds each listed NFT in escrow. A purchase sends the NFT to the buyer and the exact HYPE payment to the seller in the same transaction. If either transfer fails, the transaction reverts.

## Local setup

Requires Node.js 20+.

```bash
npm install
cp .env.example .env
npm test
```

## Elysium Testnet deployment

Set `ELYSIUM_RPC_URL` and `DEPLOYER_PRIVATE_KEY` in `.env`. Never share or commit the private key. Use a separate test wallet with only testnet funds.

```bash
npm run deploy:elysium
```

Expected network: chain ID `99801`. The deploy script checks the chain ID before deploying.

## Next steps

1. Run local tests.
2. Verify the current official Elysium Testnet RPC and explorer.
3. Deploy only after reviewing the contract and confirming the wallet/network.
4. Build the browser UI after the contract behavior is tested.
