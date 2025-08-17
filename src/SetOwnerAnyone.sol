// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VulnerableToken {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    function setOwner(address _newOwner) external {
        owner = _newOwner;
    }
}
