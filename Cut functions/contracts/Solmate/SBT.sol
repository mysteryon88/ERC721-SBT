// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "./ERC721/ERC721.sol";
import {Owned} from "./Owned.sol";

contract Soulbound is ERC721, Owned {
    uint256 private _nextTokenId;

    constructor() ERC721("Soulbound Token", "SBT") Owned(msg.sender) {}

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    function baseURI() internal pure returns (string memory) {
        return super._baseURI();
    }
}
