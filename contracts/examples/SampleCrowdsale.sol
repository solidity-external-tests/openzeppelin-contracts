pragma solidity >=0.5.0 <0.7.0;

import "../crowdsale/validation/CappedCrowdsale.sol";
import "../crowdsale/distribution/RefundableCrowdsale.sol";
import "../crowdsale/emission/MintedCrowdsale.sol";
import "../token/ERC20/ERC20Mintable.sol";
import "../token/ERC20/ERC20Detailed.sol";

/**
 * @title SampleCrowdsaleToken
 * @dev Very simple ERC20 Token that can be minted.
 * It is meant to be used in a crowdsale contract.
 */
contract SampleCrowdsaleToken is ERC20Mintable, ERC20Detailed {
    constructor () public ERC20Detailed("Sample Crowdsale Token", "SCT", 18) {
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

/**
 * @title SampleCrowdsale
 * @dev This is an example of a fully fledged crowdsale.
 * The way to add new features to a base crowdsale is by multiple inheritance.
 * In this example we are providing following extensions:
 * CappedCrowdsale - sets a max boundary for raised funds
 * RefundableCrowdsale - set a min goal to be reached and returns funds if it's not met
 * MintedCrowdsale - assumes the token can be minted by the crowdsale, which does so
 * when receiving purchases.
 *
 * After adding multiple features it's good practice to run integration tests
 * to ensure that subcontracts works together as intended.
 */
contract SampleCrowdsale is CappedCrowdsale, RefundableCrowdsale, MintedCrowdsale {
    constructor (
        uint256 openingTime,
        uint256 closingTime,
        uint256 rate,
        address payable wallet,
        uint256 cap,
        ERC20Mintable token,
        uint256 goal
    )
        public
        Crowdsale(rate, wallet, token)
        CappedCrowdsale(cap)
        TimedCrowdsale(openingTime, closingTime)
        RefundableCrowdsale(goal)
    {
        //As goal needs to be met for a successful crowdsale
        //the value needs to less or equal than a cap which is limit for accepted funds
        require(goal <= cap, "SampleCrowdSale: goal is greater than cap");
    }

    function _deliverTokens(address beneficiary, uint256 tokenAmount) internal override(Crowdsale, MintedCrowdsale) {
        super._deliverTokens(beneficiary, tokenAmount);
    }

    function _forwardFunds() internal override(Crowdsale, RefundableCrowdsale) {
       super._forwardFunds();
    }

    function _preValidatePurchase(address beneficiary, uint256 weiAmount) internal override(Crowdsale, CappedCrowdsale, TimedCrowdsale) view {
        super._preValidatePurchase(beneficiary, weiAmount);
    }
}
