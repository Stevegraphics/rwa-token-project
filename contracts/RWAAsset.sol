// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract RWAAsset is ERC20, Ownable, Pausable {
    mapping(address => bool) public isWhitelisted;

    constructor() ERC20("RealWorldAsset", "RWA") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    function addToWhitelist(address user) external onlyOwner {
        isWhitelisted[user] = true;
    }

    function pause() public onlyOwner { _pause(); }
    function unpause() public onlyOwner { _unpause(); }

    function _update(address from, address to, uint256 value) internal override whenNotPaused {
        require(from == address(0) || isWhitelisted[to], "Compliance Error: Recipient not whitelisted");
        super._update(from, to, value);
    }
}