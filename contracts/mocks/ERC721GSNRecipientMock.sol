pragma solidity >=0.5.0 <0.7.0;

import "../token/ERC721/ERC721.sol";
import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";

/**
 * @title ERC721GSNRecipientMock
 * A simple ERC721 mock that has GSN support enabled
 */
contract ERC721GSNRecipientMock is ERC721, GSNRecipient, GSNRecipientSignature {
    constructor(address trustedSigner) public GSNRecipientSignature(trustedSigner) { }
    // solhint-disable-previous-line no-empty-blocks

    function mint(uint256 tokenId) public {
        _mint(_msgSender(), tokenId);
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
        uint256 value
    )
        external
        virtual
        override(GSNRecipientSignature, IRelayRecipient)
        view
        returns (uint256, bytes memory)
    {
        // TODO Implement
        // return super.acceptRelayedCall(relay, from, encodedFunction, transactionFee, gasPrice, gasLimit, nonce, approvalData, value);
        bytes memory ret;
        return (0, ret);
    }

    function _preRelayedCall(bytes memory context) internal override(GSNRecipient, GSNRecipientSignature) returns (bytes32) {
        super._preRelayedCall(context);
    }

    function _postRelayedCall(bytes memory a, bool b, uint256 c, bytes32 d) internal override(GSNRecipient, GSNRecipientSignature) {
        super._postRelayedCall(a, b, c, d);
    }

    function _msgData() internal override(Context, GSNRecipient) view returns (bytes memory) {
        return super._msgData();
    }

    function _msgSender() internal override(Context, GSNRecipient) view returns (address payable) {
        return super._msgSender();
    }

}
