pragma solidity >=0.5.0 <0.7.0;

import "./ERC721Metadata.sol";
import "../../access/roles/MinterRole.sol";


/**
 * @title ERC721MetadataMintable
 * @dev ERC721 minting logic with metadata.
 */
abstract contract ERC721MetadataMintable is ERC721, ERC721Metadata, MinterRole {
    /**
     * @dev Function to mint tokens.
     * @param to The address that will receive the minted tokens.
     * @param tokenId The token id to mint.
     * @param tokenURI The token URI of the minted token.
     * @return A boolean that indicates if the operation was successful.
     */
    function mintWithTokenURI(address to, uint256 tokenId, string memory tokenURI) public onlyMinter returns (bool) {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return true;
    }

    function _burn(address owner, uint256 tokenId) internal virtual override(ERC721, ERC721Metadata) {
        super._burn(owner, tokenId);
    }

    function transferFrom(address from, address to, uint256 tokenId) public virtual override(ERC721, ERC721Metadata) {
        super.transferFrom(from, to, tokenId);
    }

    function approve(address to, uint256 tokenId) public virtual override(ERC721, ERC721Metadata) {
        super.approve(to, tokenId);
    }

    function balanceOf(address owner) public virtual override(ERC721, ERC721Metadata) view returns (uint256) {
        return super.balanceOf(owner);
    }

    function isApprovedForAll(address owner, address operator) public virtual override(ERC721, ERC721Metadata) view returns (bool) {
        return super.isApprovedForAll(owner, operator);
    }

    function getApproved(uint256 tokenId) public virtual override(ERC721, ERC721Metadata) view returns (address) {
        return super.getApproved(tokenId);
    }

    function ownerOf(uint256 tokenId) public virtual override(ERC721, ERC721Metadata) view returns (address) {
        return super.ownerOf(tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId) public virtual override(ERC721, ERC721Metadata) {
        super.safeTransferFrom(from, to, tokenId);
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public virtual override(ERC721, ERC721Metadata) {
        super.safeTransferFrom(from, to, tokenId, _data);
    }

    function setApprovalForAll(address to, bool approved) public virtual override(ERC721, ERC721Metadata) {
        super.setApprovalForAll(to, approved);
    }

    function supportsInterface(bytes4 interfaceId) external virtual override(ERC721, ERC721Metadata) view returns (bool) {
        // TODO Implement
        // return super.supportsInterface(interfaceId);
        return false;
    }
}
