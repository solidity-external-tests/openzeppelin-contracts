pragma solidity >=0.5.0 <0.7.0;

import "../token/ERC20/ERC20.sol";
import "../token/ERC20/ERC20Detailed.sol";

contract ERC20DetailedMock is ERC20, ERC20Detailed {
    constructor (string memory name, string memory symbol, uint8 decimals)
        public
        ERC20Detailed(name, symbol, decimals)
    {
        // solhint-disable-previous-line no-empty-blocks
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
