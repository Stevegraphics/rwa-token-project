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
To verify the compliance functionality of the RWA Token, the following test suite was performed in the Remix IDE (Cancun VM):

Compliance Initialization: Verified that the isWhitelisted mapping correctly returns false for unauthorized addresses.

Whitelist Logic: Successfully executed addToWhitelist for a test address, confirming the contract state updates to true upon verification.

Access Restriction: Confirmed that unauthorized addresses are blocked from transferring tokens, triggering the require statement revert.

Circuit Breaker: Verified that the pause() function effectively halts all token transfers, ensuring emergency security control.
