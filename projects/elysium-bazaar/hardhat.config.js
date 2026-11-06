require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const accounts = process.env.DEPLOYER_PRIVATE_KEY ? [process.env.DEPLOYER_PRIVATE_KEY] : [];

module.exports = {
  solidity: "0.8.24",
  networks: {
    elysium: {
      url: process.env.ELYSIUM_RPC_URL || "https://testnet-rpc.elysium.kinetiq.xyz",
      chainId: 99801,
      accounts
    }
  }
};
