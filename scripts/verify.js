const { ethers } = require("hardhat");
require("@nomiclabs/hardhat-etherscan");

async function main() {
  await hre.run("verify:verify", {
    address: "0x2e747c31c57c09BF1c9Ecff6a943bA4CA4B2f8cA",
    constructorArguments: [50],
    contract: "contracts/OurToken.sol:OurToken",
  });
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
