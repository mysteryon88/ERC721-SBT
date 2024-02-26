// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Soulbound} from "../src/SBT.sol";

contract SoulboundTest is Test {
    Soulbound public sbt;

    function setUp() public {
        sbt = new Soulbound();
    }

    function test_Deployed() public {
        assertEq(sbt.name(), "Soulbound Token");
        assertEq(sbt.symbol(), "SBT");
        assertEq(sbt.owner(), address(this));
    }

    function test_safeMint() public {
        sbt.safeMint(msg.sender, "uri");
        assertEq(sbt.balanceOf(msg.sender), 1);
        assertEq(sbt.ownerOf(0), msg.sender);
        assertEq(sbt.tokenURI(0), "uri");
    }

    // renounceOwnership()
    function test_transferOwnership() public {
        sbt.transferOwnership(address(0));
        assertEq(sbt.owner(), address(0));
    }

    function testFail_safeMint() public {
        vm.prank(address(0));
        sbt.safeMint(msg.sender, "uri");
    }

    // function testFail_transferFrom() public {
    //     test_safeMint();
    //     vm.prank(msg.sender);
    //     sbt.transferFrom(msg.sender, address(3), 0);
    // }

    // function testFail_safeTransferFrom() public {
    //     test_safeMint();
    //     vm.prank(msg.sender);
    //     sbt.safeTransferFrom(msg.sender, address(3), 0);
    // }

    // function testFail_safeTransferFromWhitData() public {
    //     test_safeMint();
    //     vm.prank(msg.sender);
    //     sbt.safeTransferFrom(msg.sender, address(3), 0, "0x00");
    // }
}
