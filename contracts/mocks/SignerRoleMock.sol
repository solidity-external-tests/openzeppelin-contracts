pragma solidity >=0.5.0 <0.7.0;

import "../access/roles/SignerRole.sol";

contract SignerRoleMock is SignerRole {
    function removeSigner(address account) public {
        _removeSigner(account);
    }

    function onlySignerMock() public view onlySigner {
        // solhint-disable-previous-line no-empty-blocks
    }

    // Causes a compilation error if super._removeSigner is not internal
    function _removeSigner(address account) internal override {
        super._removeSigner(account);
    }
}
