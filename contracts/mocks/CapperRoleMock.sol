pragma solidity >=0.5.0 <0.7.0;

import "../access/roles/CapperRole.sol";

contract CapperRoleMock is CapperRole {
    function removeCapper(address account) public {
        _removeCapper(account);
    }

    function onlyCapperMock() public view onlyCapper {
        // solhint-disable-previous-line no-empty-blocks
    }

    // Causes a compilation error if super._removeCapper is not internal
    function _removeCapper(address account) internal virtual override {
        super._removeCapper(account);
    }
}
