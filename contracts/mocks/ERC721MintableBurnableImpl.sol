pragma solidity >=0.5.0 <0.7.0;

import "../token/ERC721/ERC721Full.sol";
import "../token/ERC721/ERC721Mintable.sol";
import "../token/ERC721/ERC721MetadataMintable.sol";
import "../token/ERC721/ERC721Burnable.sol";

/**
 * @title ERC721MintableBurnableImpl
 */
contract ERC721MintableBurnableImpl is ERC721Full, ERC721Mintable, ERC721MetadataMintable, ERC721Burnable {
    constructor () public ERC721Mintable() ERC721Full("Test", "TEST") {
        // solhint-disable-previous-line no-empty-blocks
    }

    function _burn(address owner, uint256 tokenId) internal override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super._burn(owner, tokenId);
    }

    function _mint(address to, uint256 tokenId) internal override(ERC721, ERC721Full) {
        super._mint(to, tokenId);
    }

    function _transferFrom(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Full) {
        super._transferFrom(from, to, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super.transferFrom(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId) public override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super.approve(to, tokenId);
    }

    function balanceOf(address owner) public override(ERC721, ERC721Full, ERC721MetadataMintable) view returns (uint256) {
        return super.balanceOf(owner);
    }

    function getApproved(uint256 tokenId) public override(ERC721, ERC721Full, ERC721MetadataMintable) view returns (address) {
        return super.getApproved(tokenId);
    }

    function isApprovedForAll(address owner, address operator) public override(ERC721, ERC721Full, ERC721MetadataMintable) view returns (bool) {
        return super.isApprovedForAll(owner, operator);
    }

    function ownerOf(uint256 tokenId) public override(ERC721, ERC721Full, ERC721MetadataMintable) view returns (address) {
        return super.ownerOf(tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    function setApprovalForAll(address to, bool approved) public override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super.setApprovalForAll(to, approved);
    }

    function supportsInterface(bytes4 interfaceId) external override(ERC721, ERC721Full, ERC721MetadataMintable) view returns (bool) {
        // TODO Implement
        // return super.supportsInterface(interfaceId);
        return false;
    }
}
