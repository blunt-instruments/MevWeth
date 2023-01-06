// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "forge-std/Script.sol";

import {MevWeth} from "../src/MevWeth.sol";

contract DeployMevWeth is Script {
    // Produces:
    // 0x00000000008C43efC014746c230049e330039Cb3
    // Using forge create2factory
    bytes32 constant salt = 0x13061f1c1bbc52beabac07a60520c45cf18845c922387ca542de860049e90910;

    // Just for convenience pre-grinding :)
    event codehash(bytes32);

    function setUp() public {}

    function run() public {
        vm.broadcast();
        new MevWeth{salt: salt}();
        emit codehash(keccak256(type(MevWeth).creationCode));
    }
}