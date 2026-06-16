// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// This is a simple token to simulate your reward asset
contract MockToken is ERC20 {
    constructor() ERC20("MockReward", "MRWD") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1 million for testing
    }
}