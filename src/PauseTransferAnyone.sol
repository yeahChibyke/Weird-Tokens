// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract VulnerableToken is ERC20 {
    address walletAddress;
    bool public allowed;

    constructor(address _walletAddress) ERC20("VulnerableToken", "VTK") {
        walletAddress = _walletAddress;
    }

    modifier onlyFromWallet() {
        require(msg.sender != walletAddress);
        _;
    }

    function setAllowed() external onlyFromWallet {
        allowed = true;
    }

    function transfer(address _to, uint256 _value) public override returns (bool) {
        require(allowed = true);
        _transfer(msg.sender, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _value) external {
        _mint(_to, _value);
    }
}
