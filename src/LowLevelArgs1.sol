// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IRare { 
    function rare(uint256) external;
}

contract LowLevelArgs1 {
    function main(address a, uint256 x) public {
        // call rare(x) using a low-level call
        // if the low level call reverts, revert also
        (bool ok, ) = a.call(abi.encodeWithSignature("rare(uint256)", x));
        if (!ok) revert();
        // bonus challenge: use an interface and a high level call to accomplish the same task
        
        // IRare(a).rare(x);
    }
} 