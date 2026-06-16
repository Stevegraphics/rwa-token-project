// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StakingVault is ReentrancyGuard, Ownable {
    using SafeERC20 for IERC20;

    IERC20 public immutable stakingToken;
    IERC20 public immutable rewardToken;

    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public rewardDebt; // Tracks rewards already paid

    uint256 public rewardRate = 100; // Reward tokens per block (simplified)

    event Staked(address indexed user, uint256 amount);
    event Unstaked(address indexed user, uint256 amount);
    event RewardClaimed(address indexed user, uint256 amount);

    constructor(address _stakingToken, address _rewardToken) Ownable(msg.sender) {
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
    }

    // Deposits tokens
    function stake(uint256 _amount) external nonReentrant {
        require(_amount > 0, "Amount must be > 0");
        stakingToken.safeTransferFrom(msg.sender, address(this), _amount);
        stakedBalance[msg.sender] += _amount;
        emit Staked(msg.sender, _amount);
    }

    // Withdraws tokens + claims basic reward
    function unstake(uint256 _amount) external nonReentrant {
        require(stakedBalance[msg.sender] >= _amount, "Insufficient balance");
        stakedBalance[msg.sender] -= _amount;
        stakingToken.safeTransfer(msg.sender, _amount);
        emit Unstaked(msg.sender, _amount);
    }

    // Admin can fund the vault with reward tokens
    function depositRewards(uint256 _amount) external onlyOwner {
        rewardToken.safeTransferFrom(msg.sender, address(this), _amount);
    }
}