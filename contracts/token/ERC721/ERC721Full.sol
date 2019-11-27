pragma solidity >=0.5.0 <0.7.0;

import "./ERC721.sol";
import "./ERC721Enumerable.sol";
import "./ERC721Metadata.sol";

/**
 * @title Full ERC721 Token
 * @dev This implementation includes all the required and some optional functionality of the ERC721 standard
 * Moreover, it includes approve all functionality using operator terminology.
 *
 * See https://eips.ethereum.org/EIPS/eip-721
 */
contract ERC721Full is ERC721, ERC721Enumerable, ERC721Metadata {
    constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }

    function supportsInterface(bytes4 interfaceId) external virtual override(ERC721, ERC721Enumerable, ERC721Metadata) view returns (bool) {
        // TODO Implement
        // return super.supportsInterface(interfaceId);
        return false;
    }

    function isApprovedForAll(address owner, address operator) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) view returns (bool) {
        return super.isApprovedForAll(owner, operator);
    }

    function getApproved(uint256 tokenId) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) view returns (address) {
        return super.getApproved(tokenId);
    }

    function balanceOf(address owner) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) view returns (uint256) {
        return super.balanceOf(owner);
    }

    function approve(address to, uint256 tokenId) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) {
        super.approve(to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) {
        super.transferFrom(from, to, tokenId);
    }

    function _transferFrom(address from, address to, uint256 tokenId) internal virtual override(ERC721, ERC721Enumerable) {
        super._transferFrom(from, to, tokenId);
    }

    function _mint(address to, uint256 tokenId) internal virtual override(ERC721, ERC721Enumerable) {
        super._mint(to, tokenId);
    }

    function _burn(address owner, uint256 tokenId) internal virtual override(ERC721, ERC721Enumerable, ERC721Metadata) {
        super._burn(owner, tokenId);
    }

    function ownerOf(uint256 tokenId) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) view returns (address) {
        return super.ownerOf(tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) {
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    function setApprovalForAll(address to, bool approved) public virtual override(ERC721, ERC721Enumerable, ERC721Metadata) {
        super.setApprovalForAll(to, approved);
    }
}
