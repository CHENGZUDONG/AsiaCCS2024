// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract UserInfoNFT is ERC721Enumerable, Ownable {
    uint256 private tokenIdCounter;

    struct UserInfo {
        string name;
        uint256 age;
        // Add more user information here as needed
    }

    mapping(uint256 => UserInfo) private userInfos;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        tokenIdCounter = 1;
    }

    function mintUserInfoNFT(string memory name, uint256 age) external onlyOwner {
        UserInfo memory newUserInfo = UserInfo(name, age);
        userInfos[tokenIdCounter] = newUserInfo;
        _mint(msg.sender, tokenIdCounter);
        tokenIdCounter++;
    }

    function getUserInfo(uint256 tokenId) external view returns (string memory, uint256) {
        return (userInfos[tokenId].name, userInfos[tokenId].age);
    }
}
