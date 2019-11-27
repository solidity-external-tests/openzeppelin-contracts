pragma solidity >=0.5.0 <0.7.0;

import "../token/ERC20/ERC20Pausable.sol";
import "./PauserRoleMock.sol";

// mock class using ERC20Pausable
contract ERC20PausableMock is ERC20Pausable, PauserRoleMock {
    constructor (address initialAccount, uint256 initialBalance) public {
        _mint(initialAccount, initialBalance);
    }

    function _removePauser(address account) internal override(PauserRole, PauserRoleMock) {
        super._removePauser(account);
    }
}
