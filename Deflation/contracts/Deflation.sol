// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
/**
Example of deflationary token for demonstration only. All functions that have to deal with math operations have to be safe checked!
This token has interesting economics. It burns 15% of value of each transferred effectively removing it from the supply.
It's been pre-mined with 21,000,000 initial supply
*/
contract Deflation is ERC20
{    

    uint256 denominator = 10000;
    uint256 numerator = 1500;

    constructor(string memory name, string memory symbol) ERC20(name,symbol) {
        uint256 initialSupply = 21000000*10**18;
        _mint(msg.sender, initialSupply);
    }

    //This is a function responsible for overriding default behavior and reducing circulating supply
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        uint256 fee = amount / denominator * numerator;
        uint256 valueToTransfer = amount - fee;
        super.transfer(to,valueToTransfer);
        _burn(msg.sender, fee);
        return true;   
    }
}