pragma solidity >=0.5.0 <0.7.0;

import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";

contract GSNRecipientSignatureMock is GSNRecipientSignature {
    constructor(address trustedSigner) public GSNRecipientSignature(trustedSigner) {
        // solhint-disable-previous-line no-empty-blocks
    }

    event MockFunctionCalled();

    function mockFunction() public {
        emit MockFunctionCalled();
    }

    function _preRelayedCall(
        bytes memory context
    )
        internal
        override
        returns (bytes32)
    {
        return super._preRelayedCall(context);
    }

    function _postRelayedCall(
        bytes memory context,
        bool success,
        uint256 actualCharge,
        bytes32 preRetVal
    ) 
        internal
        override
    {
        super._postRelayedCall(context, success, actualCharge, preRetVal);
    }
}
