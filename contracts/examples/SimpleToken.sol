pragma solidity >=0.5.0 <0.7.0;

import "../GSN/Context.sol";
import "../token/ERC20/ERC20.sol";
import "../token/ERC20/ERC20Detailed.sol";

/**
 * @title SimpleToken
 * @dev Very simple ERC20 Token example, where all tokens are pre-assigned to the creator.
 * Note they can later distribute these tokens as they wish using `transfer` and other
 * `ERC20` functions.
 */
contract SimpleToken is Context, ERC20, ERC20Detailed {

    /**
     * @dev Constructor that gives _msgSender() all of existing tokens.
     */
    constructor () public ERC20Detailed("SimpleToken", "SIM", 18) {
        _mint(_msgSender(), 10000 * (10 ** uint256(decimals())));
    }

    function totalSupply() public override(IERC20, ERC20) view returns (uint256) {
        return super.totalSupply();
    }

    function balanceOf(address account) public override(IERC20, ERC20) view returns (uint256) {
        return super.balanceOf(account);
    }

    function transfer(address recipient, uint256 amount) public override(IERC20, ERC20) returns (bool) {
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override(IERC20, ERC20) returns (bool) {
        return super.transferFrom(sender, recipient, amount);
    }

    function approve(address spender, uint256 amount) public override(IERC20, ERC20) returns (bool) {
        return super.approve(spender, amount);
    }

    function allowance(address owner, address spender) public override(IERC20, ERC20) view returns (uint256) {
        return super.allowance(owner, spender);
    }
}
