// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VulnerableToken {
    mapping(address => uint256) public balanceOf;

    constructor() {}

    function mint(address _to, uint256 _value) external {
        balanceOf[_to] += _value;
    }

    function transferFrom(address _from, address _to, uint256 _value) external {
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
    }
}
