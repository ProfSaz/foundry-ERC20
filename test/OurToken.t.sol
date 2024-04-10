// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {OurToken} from "../src/OurToken.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    uint256 public constant STARTING_BALANCE = 100 ether;
    OurToken public ourToken;
    DeployOurToken public deployer;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() external view {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(bob));
        console.log(ourToken.balanceOf(msg.sender));
        console.log(ourToken.balanceOf(bob));
    }

    function testTransfer() external {
        uint256 transferAmount = 5 ether;
        vm.prank(bob);
        ourToken.transfer(alice, transferAmount);
        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    function testTransferFromWorks() external {
        uint256 initialAmount = 10 ether;

        vm.prank(bob);
        ourToken.approve(alice, initialAmount);

        uint256 transferAmount = 5 ether;
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);

        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
        assertEq(ourToken.balanceOf(alice), transferAmount);
    }
}
