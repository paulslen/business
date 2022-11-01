pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract is Ownable {

  struct Investment {
  mapping (address => uint256) equityBalance;
  string ticker;
  uint8 holders;
  uint256 lastPrice;
}

  mapping(address => bool) public receivedStartUp;
  mapping(address => uint256) public playUSDBalance;
  Investment[] investments;

  constructor() payable {
    // what should we do on deploy?
    
  }

  function buyInvestment(uint256 _amount) public {

  }

  function addInvestment(string calldata _ticker, uint256 _lastPrice) public onlyOwner {
    investments.push(Investment({ticker: _ticker, holders: 0, lastPrice: _lastPrice}));
  }

  // to support receiving ETH by default
  receive() external payable {}
  
  fallback() external payable {}

  function contractBalance() public view returns (uint256) {
    return address(this).balance;
  }
}
pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTProject is ERC721, Ownable {

  constructor() ERC721("Pauls NFTs", "PN") {}

  function letsMint (address _to, uint256 _id) public onlyOwner {
    _safeMint(_to, _id);
  }

}
