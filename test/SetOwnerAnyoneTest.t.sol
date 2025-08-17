// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {VulnerableToken} from "../src/SetOwnerAnyone.sol";

contract SetOwnerAnyoneTest is Test {
    VulnerableToken token;
    address owner;
    address alice;

    function setUp() public {
        owner = makeAddr("owner");
        alice = makeAddr("alice");
        token = new VulnerableToken(owner);
    }

    function test_bug_owner() public {
        assert(token.owner() == owner);

        vm.prank(alice);
        token.setOwner(alice);

        assert(token.owner() == alice);
    }
}
