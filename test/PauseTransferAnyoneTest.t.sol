// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {VulnerableToken} from "../src/PauseTransferAnyone.sol";

contract PauseTransferAnyoneTest is Test {
    address wallet;
    address alice;
    address bob;

    VulnerableToken token;

    function setUp() public {
        wallet = makeAddr("wallet");
        alice = makeAddr("alice");
        bob = makeAddr("bob");

        token = new VulnerableToken(wallet);

        token.mint(alice, 1000 ether);
    }

    function test_bug_pause() public {
        // wallet address cannot call pause
        vm.prank(wallet);
        vm.expectRevert();
        token.setAllowed();

        assert(token.allowed() == false);

        // anybody else can call pause
        vm.prank(alice);
        token.setAllowed();

        assert(token.allowed() == true);
    }
}
