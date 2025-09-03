// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IRare {
    function rare(uint256, uint256) external;
}

contract LowLevelArgs2 {
    function main(address a, uint256 x, uint256 y) public {
        
        // Will try this here (EncodeCall)
        (bool ok, ) = a.call(abi.encodeCall(IRare.rare, (x, y)));
        require(ok);
        // bonus challenge: use an interface and a high level call to accomplish the same task
        // IRare(a).rare(x, y);

    }
}