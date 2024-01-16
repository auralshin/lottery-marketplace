// import { ethers } from "hardhat";

async function main() {
  const [signer] = await ethers.getSigners();
  const erc20 = await (await ethers.getContractFactory("MockERC20")).deploy();
  const svg = await (await ethers.getContractFactory("SVG")).deploy();
  const randomNumberGenerator = await (
    await ethers.getContractFactory("RandomNumberGenerator")
  ).deploy("0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B", "0x01BE23585060835E02B77ef475b0Cc51aA1e0709");
  const lottery = await (
    await ethers.getContractFactory("ProjectLottery")
  ).deploy(erc20.address, randomNumberGenerator.address, svg.address);

  // kovan
  await Promise.all([
    await randomNumberGenerator.setFee("100000000000000000"),
    await randomNumberGenerator.setKeyHash("0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311"),
    await erc20.faucet("10001000000000000000000000000"),
    await erc20.approve(lottery.address, "10000000000000000000000000000"),
    await randomNumberGenerator.setLotteryAddress(lottery.address),
    await lottery.setOperatorAndInjectorAddresses(signer.address, signer.address),
    await lottery.setStakingAndLiquidityAndWalletAddresses(signer.address, signer.address, signer.address),
  ]);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });