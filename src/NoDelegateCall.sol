// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.28;
import {console} from 'forge-std/console.sol';

contract NoDelegateCall {
    // your code here
    // hint: https://www.rareskills.io/post/nodelegatecall

    address private immutable _self;

    constructor() {
        _self = address(this);
    }

    function meaningOfLifeAndEverything() public view returns (uint256 fourtyTwo) {
        // your code here
        // this function should be callable, but not delegatecallable
        // it should return 42
        require(address(this) == _self); 
        fourtyTwo = 42;
    }
}