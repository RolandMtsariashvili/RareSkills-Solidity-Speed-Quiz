// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract Bytes {
    function main(uint8 z) public pure returns(bytes memory) {
        bytes memory b = new bytes(z);
        for (uint8 i = 0; i < z; i++) {
            b[i] = bytes1(i);
        }
        return b;
   }
}