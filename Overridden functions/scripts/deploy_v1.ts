import { ethers } from "hardhat";

async function main() {
  const SBT = await ethers.deployContract("SBTv1");

  await SBT.waitForDeployment();

  await SBT.safeMint(
    "0x3128ef7F0933cF2bA18f1Ef7280A7b684347B115",
    "https://ipfs.io/ipfs/QmaNMk641puZy1uth85UCM4MZiXB9qUyuverkBo5bPu35n"
  );

  console.log(`SBT deployed to ${SBT.target}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
