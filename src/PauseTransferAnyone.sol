// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VulnerableToken {
    address walletAddress;
    bool public allowed;
    mapping(address => uint256) public balanceOf;

    constructor(address _walletAddress) {
        walletAddress = _walletAddress;
    }

    modifier onlyFromWallet() {
        require(msg.sender != walletAddress);
        _;
    }

    function mint(address _to, uint256 _value) external {
        balanceOf[_to] += _value;
    }

    function setAllowed() external onlyFromWallet {
        allowed = true;
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        require(allowed = true);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }
}
