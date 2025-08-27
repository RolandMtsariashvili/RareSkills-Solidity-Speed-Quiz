// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract StringIndex {
    function main(string memory str, uint256 index) public pure returns (string memory) {
        // return the character at index in str
        // assume str only consists of ascii characters
        bytes memory result = new bytes(1);
        result[0] = bytes(str)[index];

        return string(result);
    } 
}