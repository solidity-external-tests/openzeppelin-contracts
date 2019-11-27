pragma solidity >=0.5.0 <0.7.0;

import "../lifecycle/Pausable.sol";
import "./PauserRoleMock.sol";

// mock class using Pausable
contract PausableMock is Pausable, PauserRoleMock {
    bool public drasticMeasureTaken;
    uint256 public count;

    constructor () public {
        drasticMeasureTaken = false;
        count = 0;
    }

    function normalProcess() external whenNotPaused {
        count++;
    }

    function drasticMeasure() external whenPaused {
        drasticMeasureTaken = true;
    }

    function _removePauser(address account) internal override(PauserRole, PauserRoleMock) {
        super._removePauser(account);
    }
}
