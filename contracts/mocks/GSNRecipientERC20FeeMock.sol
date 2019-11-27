pragma solidity >=0.5.0 <0.7.0;

import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientERC20Fee.sol";

contract GSNRecipientERC20FeeMock is GSNRecipient, GSNRecipientERC20Fee {
    constructor(string memory name, string memory symbol) public GSNRecipientERC20Fee(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    event MockFunctionCalled(uint256 senderBalance);

    function mockFunction() public {
        emit MockFunctionCalled(token().balanceOf(_msgSender()));
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
        override(IRelayRecipient, GSNRecipientERC20Fee)
        view
        returns (uint256, bytes memory)
    {
        // TODO Implement
        // return super.acceptRelayedCall(relay, from, encodedFunction, transactionFee, gasPrice, gasLimit, nonce, approvalData, value);
        bytes memory ret;
        return (0, ret);
    }

    function _preRelayedCall(bytes memory context) internal override(GSNRecipient, GSNRecipientERC20Fee) returns (bytes32) {
        return super._preRelayedCall(context);
    }

    function _postRelayedCall(
        bytes memory context,
        bool unknown,
        uint256 actualCharge,
        bytes32 unknown2
    )
        internal
        override(GSNRecipient, GSNRecipientERC20Fee)
    {
        super._postRelayedCall(context, unknown, actualCharge, unknown2);
    }
}
