# Elysium Bazaar

A browser-first fixed-price ERC-721 marketplace prototype for Kinetiq Elysium Testnet (chain ID 99801).

## Current status
- Solidity marketplace contract: written
- Local Hardhat tests: written
- GitHub Actions CI: configured to compile and run tests
- Browser frontend: initial MVP written
- Testnet deployment: not yet done
- Public listings: none until NFT owners list their tokens

## Work without Terminal
The project is maintained directly in GitHub. GitHub Actions installs dependencies, compiles the contract, and runs the tests in GitHub's hosted runner. The frontend is plain HTML, CSS, and JavaScript and can be hosted with GitHub Pages.

## MVP scope
- ERC-721 only
- Sellers escrow an NFT when creating a fixed-price listing
- Buyers purchase with native HYPE
- Sellers can cancel and reclaim their NFT
- No fees, royalties, ERC-1155, offers, or auctions in this first version

## Important safety notes
Experimental testnet software, not audited. Do not use with valuable NFTs or mainnet funds. The contract has not yet been deployed or verified on Elysium. Review all transactions before signing. Never share a seed phrase or private key.

## Next steps
1. Get the GitHub Actions compile and test run green.
2. Review the contract and deploy it from a browser-based Solidity environment using a dedicated test wallet.
3. Add the deployed contract address to frontend/app.js.
4. Enable GitHub Pages and test listing, buying, and cancelling with test NFTs.
