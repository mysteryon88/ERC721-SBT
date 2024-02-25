import { loadFixture } from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";
import { mintNFT } from "./mint";

describe("SBT Solmate", function () {
  async function deployFixture() {
    const [owner, otherAccount] = await ethers.getSigners();

    const SBT = await ethers.getContractFactory("Soulbound");
    const sbt = await SBT.deploy();
    const receipt = await sbt.deploymentTransaction()?.wait();
    console.log("Gas used for deploy", receipt?.gasUsed);

    return { sbt, owner, otherAccount };
  }

  describe("Deployment", function () {
    it("Right name and symbol", async function () {
      const { sbt } = await loadFixture(deployFixture);

      expect(await sbt.name()).to.equal("Soulbound Token");
      expect(await sbt.symbol()).to.equal("SBT");
    });

    it("Right owner", async function () {
      const { sbt, owner } = await loadFixture(deployFixture);

      expect(await sbt.owner()).to.equal(owner.address);
    });
  });

  describe("Transfer", function () {
    it("Revert transfer", async function () {
      const { sbt, owner, otherAccount } = await loadFixture(deployFixture);

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
