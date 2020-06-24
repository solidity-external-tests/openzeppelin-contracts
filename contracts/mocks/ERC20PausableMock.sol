pragma solidity >= 0.7.0;

import "../token/ERC20/ERC20Pausable.sol";

// mock class using ERC20Pausable
contract ERC20PausableMock is ERC20Pausable {
    constructor (
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) ERC20(name, symbol) {
        _mint(initialAccount, initialBalance);
    }

    function pause() external {
        _pause();
    }

    function unpause() external {
        _unpause();
    }
}
