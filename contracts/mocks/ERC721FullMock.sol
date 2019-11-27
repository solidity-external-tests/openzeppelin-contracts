pragma solidity >=0.5.0 <0.7.0;

import "../token/ERC721/ERC721Full.sol";
import "../token/ERC721/ERC721Mintable.sol";
import "../token/ERC721/ERC721MetadataMintable.sol";
import "../token/ERC721/ERC721Burnable.sol";

/**
 * @title ERC721FullMock
 * This mock just provides public functions for setting metadata URI, getting all tokens of an owner,
 * checking token existence, removal of a token from an address
 */
contract ERC721FullMock is ERC721Full, ERC721Mintable, ERC721MetadataMintable, ERC721Burnable {
    constructor (string memory name, string memory symbol) public ERC721Mintable() ERC721Full(name, symbol) {
        // solhint-disable-previous-line no-empty-blocks
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function tokensOfOwner(address owner) public view returns (uint256[] memory) {
        return _tokensOfOwner(owner);
    }

    function setTokenURI(uint256 tokenId, string memory uri) public {
        _setTokenURI(tokenId, uri);
    }

    function _mint(address account, uint256 value) internal override(ERC721, ERC721Full) {
        super._mint(account, value);
    }
    
    function _burn(address account, uint256 value) internal override(ERC721, ERC721Full, ERC721MetadataMintable) {
        super._burn(account, value);
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
