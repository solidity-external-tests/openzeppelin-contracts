pragma solidity >=0.5.0 <0.7.0;

import "../access/roles/MinterRole.sol";

contract MinterRoleMock is MinterRole {
    function removeMinter(address account) public {
        _removeMinter(account);
    }

    function onlyMinterMock() public view onlyMinter {
        // solhint-disable-previous-line no-empty-blocks
    }

    // Causes a compilation error if super._removeMinter is not internal
    function _removeMinter(address account) internal virtual override {
        super._removeMinter(account);
    }
}
