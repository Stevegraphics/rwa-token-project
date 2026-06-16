# RWA Token Implementation
A regulated ERC-20 smart contract for Real-World Asset (RWA) tokenization, featuring KYC-whitelist compliance and emergency pause controls.

## Tech Stack
- Solidity 0.8.20
- OpenZeppelin Contracts
- Hardhat (Testing/Deployment)

## Key Features
- **Whitelist Compliance:** Enforces that only KYC-approved addresses can receive tokens.
- **Circuit Breaker:** Integrated `Pausable` module for security.
- **Access Control:** Restricted admin functions (minting, whitelisting, pausing).

## License
This project is licensed under the MIT License.