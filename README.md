# Soulbound token (ERC721)

- In the first case, I override the functions of the libraries to achieve compatibility with the ERC721 standard. I took two libraries as a basis: [OpenZeppelin v5.0.1](https://github.com/OpenZeppelin/openzeppelin-contracts/) and [Solmate v6.2.0](https://github.com/transmissions11/solmate). Added storage URI to Solmate libraries

- In the second case, I cut out the code unnecessary for SBT, while maintaining compatibility with ERC721.
