import { Wallet } from "zksync-ethers";
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { Deployer } from "@matterlabs/hardhat-zksync";
import { vars } from "hardhat/config";

export default async function (hre: HardhatRuntimeEnvironment) {
  console.log("Deploying AbstractCreatorWall...");

  const wallet = new Wallet(vars.get("DEPLOYER_PRIVATE_KEY"));
  const deployer = new Deployer(hre, wallet);
  const artifact = await deployer.loadArtifact("AbstractCreatorWall");
  const contract = await deployer.deploy(artifact);

  console.log(`AbstractCreatorWall deployed to ${await contract.getAddress()}`);
}
