// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import 'openzeppelin-solidity/contracts/token/ERC20/ERC20.sol';

contract MyToken is ERC20 {
  address public admin;

  constructor() ERC20("MyToken", "MTK") {
    _mint(msg.sender, 1000 * 10 ** 18);
    admin = msg.sender;
  } 

  function mint(address to, uint amount) external {
    require(msg.sender == admin, 'only admin');
    _mint(to, amount);
  }

  function burn(uint amount) external {
    _burn(msg.sender, amount);
  }

}
