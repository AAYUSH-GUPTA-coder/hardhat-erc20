// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;

interface tokenRecipient {
  function receiveApproval(
    address _from,
    uint256 _value,
    address _token,
    bytes calldata _extraData
  ) external;
}

contract ManualToken {
    // Public variables of the token
  string public name;
  string public symbol;
  uint8 public decimals = 18;
  // 18 decimals is the strongly suggested default, avoid changing it
  uint256 public totalSupply;

    uint initialSupply;
    mapping (address => uint) public balanceOf;
    mapping(address => mapping(address => uint256)) public allownace;

    constructor(uint256 initialSupply, string memory tokenName, string memory tokenSymbol) {
        totalSupply = initialSupply * 10**uint(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol
    }

    function transfer(address from, address to, uint256 amount){
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
    }

    function transferFrom(address _from, address _to, uint256 _allowance) public returns(bool success) {
        require(_value <= allownace[_from][msg.sender]);
        allownace[_from][msg.sender] -= value;
        transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value)
    public
    returns (bool success)
  {
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
}