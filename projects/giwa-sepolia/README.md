# GIWA Sepolia builder notes

## Goal
Track real builder activity on GIWA Sepolia with deploys, interactions and GIWA-native identity primitives.

## Builder checklist
- [x] Connect wallet to GIWA Sepolia
- [x] Deploy and test GiwaGuestbook
- [x] Record Guestbook deployment and interaction
- [x] Deploy GiwaVerifiedCreator
- [x] Integrate the GIWA DojangScroll verification contract
- [x] Confirm the connected wallet with `isVerified(address)`
- [x] Publish one verified creator proof
- [x] Record the verified proof transaction

## First contract deployment
- Network: GIWA Sepolia
- Contract: GiwaGuestbook
- Contract address: 0x943d9535a16C55D840A6cd37928394f51F7Be8F5
- Deploy tx: 0xb7e56d1874466204cb22e5cf51c7fe2725128906acd46e9fa06b78d84aab5072
- Interaction tx: 0xf9e3511e481f33329ed97abcbdffe78003529cb31995a2c0fc0bf548516a6f65
- State check: totalNotes = 1
- Date: 2026-08-29

## GIWA-native Dojang build
- Network: GIWA Sepolia
- Contract: GiwaVerifiedCreator
- Contract address: 0xc4bCAE2C2AE55d3f7Fd7b4D95fcfE172e7772962
- Deploy tx: 0x8e79c7a4ebffb41b3a13ba5bdc342ea06f4b01deda062f9734fa94ecb80fcd77
- DojangScroll: 0xd5077b67dcb56caC8b270C7788FC3E6ee03F17B9
- Attester ID: 0xaa92f8c143657dde575de430aecaea6ca91f2e6072339b16932d426895d8d678
- Verification read: `isVerified(wallet) = true`
- Published project: `GIWA verified creator build`
- Proof URI: `https://github.com/Chinesedevil3/web3-builder-notes/tree/main/projects/giwa-sepolia`
- Publish tx: 0x4fbf3cc344b652e24728ae012ca36b6ae77584478ae06296e18d2b593ceaeb89
- Date: 2026-08-31

## Why this matters
The Guestbook proves a standard deploy/write/read flow. GiwaVerifiedCreator goes further by reading GIWA's Dojang verification state and gating creator proof publication behind the network-native identity primitive, then writing a real verified creator proof onchain.

## Notes
Never commit private keys, seed phrases or wallet secrets.
