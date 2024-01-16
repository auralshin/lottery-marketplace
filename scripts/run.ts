import hre from "hardhat";

const main = async () => {
  const Greeter = await hre?.ethers.getContractFactory("Greeter");
  const greeter = await Greeter.deploy("Hello, Hardhat!");

  await greeter.deployed();
};

main();
