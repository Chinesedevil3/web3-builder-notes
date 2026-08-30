# Arc network builder notes

## Goal
Track real builder activity on Arc Testnet with deployments, contract interactions and native ecosystem primitives.

## Builder checklist
- [x] Confirm the intended Arc Testnet environment
- [x] Connect wallet to Arc Testnet
- [x] Deploy one simple contract
- [x] Record the contract address and deploy transaction
- [x] Call one write function on the deployed contract
- [x] Read contract state after the interaction
- [x] Record the interaction transaction
- [x] Create ERC-8004 agent metadata
- [x] Register an agent identity in the Arc ERC-8004 IdentityRegistry
- [x] Record the native ecosystem registration transaction
- [x] Create an ERC-8183 agentic commerce job
- [x] Set the job budget from the provider wallet
- [x] Approve the ERC-8183 contract to spend 1 USDC
- [x] Fund the ERC-8183 job into USDC escrow
- [x] Create an offchain deliverable artifact for the job
- [x] Submit the deliverable commitment from the provider wallet
- [x] Complete the job from the evaluator wallet

## Deployment log
- Network: Arc Testnet
- Contract: ArcPalette
- Contract address: 0xcCa17c3c5E0f8d9E25d98b3EF157422c0B7428DF
- Deploy tx: 0x84f3d9c7a4552c2fe648ccce6a1568de464c3d7c7d60f579567c181a8fe7024d
- Interaction: `setColor("cosmic purple")`
- Interaction tx: 0x3c1846eec6ae94843f5b70725349e48bef4aa794d13f35df411d65904ed767be
- Date: 2026-08-30

## ERC-8004 identity activity
- Registry: `0x8004A818BFB912233c491871b3d84c89A494BD9e`
- Metadata: `erc8004/agent-metadata.json`
- Registration tx: `0x51441a9e0d16633858755706b41ee6116c2963226d55b9efa97b4b1d83029cfd`
- Date: 2026-08-31

## ERC-8183 agentic commerce activity
- Contract: `0x0747EEf0706327138c69792bF28Cd525089e4583`
- USDC: `0x3600000000000000000000000000000000000000`
- Job ID: `182416`
- Budget: `1 USDC`
- Create job tx: `0x3c237093eb639dab702d2df88e3a7cab82942e462c285b42843f79ea6787cea1`
- Set budget tx: `0x11a1d3c838c22534cad2c0ec771209f4f7d9f52e42b22d1d980900aa066875c9`
- Approve USDC tx: `0x6e4c316610ec5f38c73e04c4ef2c104d3acf471b475ddd27dc258ace51737573`
- Fund tx: `0xb48ac67bdd000c4ad622128dd2ee03d12303dde6e86b921c8a53a7580da82b16`
- Deliverable: `erc8183/deliverable-182416.json`
- Deliverable SHA-256: `0xdc8963d83122bbf865cb5692a94ab5119fde7b52ca3c31c9fa5198611bedd09b`
- Submit tx: `0x01aea78c2d1db670c08add3b9fb43a9b2c3628dc7bedb13ff877c2d2aedfefe6`
- Complete tx: `0xe3569c91dc0010e5b358c8895514a40b54985e98bd8a7ad4038e28862eb5bdb1`
- Status: `Completed`
- Date: 2026-08-31

## Why Arc
Arc is being tested here not only as an EVM deployment target but through ecosystem-native agent identity and agentic commerce primitives. The ERC-8004 registration establishes identity, while the ERC-8183 flow tests scoped work, USDC escrow and settlement rather than repeating generic contract calls.

## Notes
ArcPalette was deployed successfully and a write interaction was recorded. The ERC-8004 registration links an onchain agent identity to public metadata in this repository. The ERC-8183 flow uses separate client/provider roles, a 1 USDC test budget, escrowed funding, a public offchain deliverable committed by hash, and a completed evaluator settlement. Never commit private keys, seed phrases or wallet secrets.
