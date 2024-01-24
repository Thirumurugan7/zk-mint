// Contract based on https://docs.openzeppelin.com/contracts/4.x/erc721
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    event minting(uint indexed  id, string name);

    constructor() ERC721("MyNFT", "MNFT") {}

    function mintNFT(string memory name)
    public
    returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        emit minting(newItemId, name);
       
        return newItemId;
    }

    function settingURI(uint newItemId, string memory tokenURI ) public {
         _setTokenURI(newItemId, tokenURI);

    }
}
