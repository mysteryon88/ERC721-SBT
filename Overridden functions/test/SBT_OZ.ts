import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { SBT } from "../typechain-types";

describe("SBT OpenZeppelin", function () {
  async function deployOneYearLockFixture() {
    const [owner, otherAccount] = await ethers.getSigners();

    const SBT = await ethers.getContractFactory("SBT");
    const sbt = await SBT.deploy();

    return { sbt, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Right name and symbol", async function () {
      const { sbt } = await loadFixture(deployOneYearLockFixture);

      expect(await sbt.name()).to.equal("Soulbound Token");
      expect(await sbt.symbol()).to.equal("SBT");
    });

    it("Right owner", async function () {
      const { sbt, owner } = await loadFixture(deployOneYearLockFixture);

      expect(await sbt.owner()).to.equal(owner.address);
    });
  });

  describe("Transfer", function () {
    it("Revert transfer", async function () {
      const { sbt, owner, otherAccount } = await loadFixture(
        deployOneYearLockFixture
      );

      await mintNFT(sbt, owner.address, "URI");

      await expect(
        sbt.transferFrom(owner.address, otherAccount.address, 0)
      ).to.be.revertedWith("Token is not transferable");

      await expect(
        sbt["safeTransferFrom(address,address,uint256)"](
          owner.address,
          otherAccount.address,
          0
        )
      ).to.be.revertedWith("Token is not transferable");

      await expect(
        sbt["safeTransferFrom(address,address,uint256,bytes)"](
          owner.address,
          otherAccount.address,
          0,
          "0x"
        )
      ).to.be.revertedWith("Token is not transferable");
    });
  });
});

async function mintNFT(sbt: SBT, owner: string, tokenURI: string) {
  try {
    if (!sbt || !owner || !owner) {
      throw new Error(
        "It is necessary to provide all necessary parameters: sbt, owner and owner.address"
      );
    }

    const transactionReceipt = await sbt.safeMint(owner, tokenURI);

    // console.log("The NFT has been successfully created:", transactionReceipt);
    return transactionReceipt;
  } catch (error) {
    console.error("Error when creating an NFT:", error);
    throw error;
  }
}
