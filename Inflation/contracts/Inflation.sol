// SPDX-License-Identifier: GPL-3.

pragma solidity 0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
/**
That’s another example of ERC-20, in this implementation the owner of the contract is rewarded with 15% tax of value of each transfer. 
The reward is not taken as a cut of transferred value but minted effectively increasing the total supply of the token
This token is pre-minted with 21,000,000 initial supply
 */
contract Inflation is ERC20
{    
    uint256 denominator = 100;
    uint256 numerator = 15;
    address owner;

    constructor(string memory name, string memory symbol) ERC20(name,symbol) {
        uint256 initialSupply = 21000000*10**18;
        owner = msg.sender;
        _mint(msg.sender, initialSupply);
    }

    function mintReward(uint256 reward, address recipient) internal {
         _mint(recipient, reward);

    }

    function _beforeTokenTransfer(address from, address to, uint256 value) internal virtual override{
        uint256 reward = value / denominator * numerator;
        mintReward(reward,owner);
        super._beforeTokenTransfer(from, to, value);
    }

}