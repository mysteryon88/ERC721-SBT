// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Soulbound} from "../src/SBT.sol";

contract SoulboundScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Soulbound sbt = new Soulbound();
        
        sbt.safeMint(0x3128ef7F0933cF2bA18f1Ef7280A7b684347B115,
         "https://ipfs.io/ipfs/QmaNMk641puZy1uth85UCM4MZiXB9qUyuverkBo5bPu35n");

        vm.stopBroadcast();
    }
}
