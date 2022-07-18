// SPDX-License-Identifier: GPL-3.

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
//Token minted with 21,000,000 supply
contract BetterDollar is ERC20
{      
   constructor() ERC20("BetterDollar", "BUSD") {               
       uint256 initialSupply = 21000000*10**18;
       _mint(msg.sender, initialSupply);
   }

}