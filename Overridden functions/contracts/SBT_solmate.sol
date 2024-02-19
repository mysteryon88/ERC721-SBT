// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "solmate/src/tokens/ERC721.sol";
import {Owned} from "solmate/src/auth/Owned.sol";
import {LibString} from "solmate/src/utils/LibString.sol";

abstract contract Soulbound is ERC721, Owned {
    using LibString for uint256;
    mapping(uint256 tokenId => string) private _tokenURIs;

    constructor(
        string memory _name,
        string memory _symbol
    ) ERC721(_name, _symbol) Owned(msg.sender) {}

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) public override {
        revert("Token is not transferable");
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory baseURI = _baseURI();
        string memory _tokenURI = _tokenURIs[tokenId];

        if (bytes(baseURI).length == 0) {
            return _tokenURI;
        }

        return string.concat(baseURI, _tokenURI);
    }

    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal {
        _tokenURIs[tokenId] = _tokenURI;
    }

    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override returns (bool) {
        return
            interfaceId == 0x49064906 || super.supportsInterface(interfaceId);
    }
}

contract SBTv2 is Soulbound {
    uint256 private _nextTokenId;

    constructor() Soulbound("Soulbound Token", "SBT") {}

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }
}
