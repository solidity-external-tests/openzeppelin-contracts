pragma solidity >=0.5.0 <0.7.0;

import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";

contract GSNRecipientSignatureMock is GSNRecipient, GSNRecipientSignature {
    constructor(address trustedSigner) public GSNRecipientSignature(trustedSigner) {
        // solhint-disable-previous-line no-empty-blocks
    }

    event MockFunctionCalled();

    function mockFunction() public {
        emit MockFunctionCalled();
    }

    function acceptRelayedCall(
        address relay,
        address from,
        bytes calldata encodedFunction,
        uint256 transactionFee,
        uint256 gasPrice,
        uint256 gasLimit,
        uint256 nonce,
        bytes calldata approvalData,
        uint256 maxPossibleCharge
    )
        external
        override(IRelayRecipient, GSNRecipientSignature)
        view
        returns (uint256, bytes memory)
    {
        // TODO Implement
        return super.acceptRelayedCall(relay, from, encodedFunction, transactionFee, gasPrice, gasLimit, nonce, approvalData, maxPossibleCharge);
    }

    function _preRelayedCall(
        bytes memory context
    )
        internal
        override(GSNRecipient, GSNRecipientSignature)
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
        override(GSNRecipient, GSNRecipientSignature)
    {
        super._postRelayedCall(context, success, actualCharge, preRetVal);
    }
}
