// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {VulnerableToken} from "../src/AllowAnyone.sol";

contract AllowAnyoneTest is Test {
    VulnerableToken token;
    address alice;
    address bob;

    function setUp() public {
        token = new VulnerableToken();
        alice = makeAddr("alice");
        bob = makeAddr("bob");

        token.mint(alice, 1000 ether);
    }

    function test_bug_allow() public {
        assert(token.balanceOf(alice) == 1000 ether);

        vm.prank(bob);
        token.transferFrom(alice, bob, 1000 ether);

        assert(token.balanceOf(alice) == 0);
        assert(token.balanceOf(bob) == 1000 ether);
    }
}
