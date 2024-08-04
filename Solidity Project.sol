// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public tokenName;
    string public tokenSymbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balances;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        tokenName = _name;
        tokenSymbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }

    function mint(address _recipient, uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        totalSupply += _amount;
        balances[_recipient] += _amount;
    }

    function burn(address _holder, uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        require(balances[_holder] >= _amount, "Insufficient balance");
        totalSupply -= _amount;
        balances[_holder] -= _amount;
    }
}
