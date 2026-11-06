# Elysium Radar

A lightweight, read-only network activity dashboard for Kinetiq's Elysium Testnet.

**Network:** Elysium Testnet  
**Chain ID:** 99801  
**Native gas token:** HYPE  
**RPC:** `https://testnet-rpc.elysium.kinetiq.xyz`

## What it shows

- Latest block height and timestamp
- Transactions included in the latest blocks
- Transaction count and gas used per block
- Recent transaction hashes, sender/recipient and value
- Contract-creation transaction count in the sampled blocks
- Automatic refresh every 5 seconds

## Run locally

No build step or API key is required.

1. Clone the repository.
2. Open a terminal in this folder.
3. Run:

```bash
python3 -m http.server 8000
```

4. Visit http://localhost:8000

The dashboard calls the public Elysium Testnet JSON-RPC endpoint directly from the browser. If the RPC provider blocks browser CORS requests, use a local proxy or an RPC provider endpoint with browser access enabled.

## Technical notes

This is a read-only prototype. It does not connect a wallet, request signatures, submit transactions, or ask for private keys. It polls standard EVM JSON-RPC methods: `eth_chainId`, `eth_blockNumber`, and `eth_getBlockByNumber`.

The contract-creation figure counts transactions with a null `to` field in the sampled blocks; it is not a count of verified successful deployments.

## Verification checklist

- [ ] Confirm chain ID is 99801
- [ ] Confirm latest block height matches an independent explorer
- [ ] Compare a displayed transaction hash with the explorer
- [ ] Test refresh and RPC error states
- [ ] Capture screenshots for the project portfolio

## Scope and limitations

This is an independent community dashboard, not an official Kinetiq product or block explorer. Data is limited to the most recent sampled blocks and is not a historical analytics indexer.
