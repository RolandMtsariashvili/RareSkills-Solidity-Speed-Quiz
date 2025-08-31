// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IRare {
    function rare(uint256) external;
}
contract TryCatchReason {
    function main(address a, uint256 x) public returns (bytes memory) {
        IRare token = IRare(a);
        try token.rare(x) {
            return "";
        } catch (bytes memory lowLevelData) {
            return lowLevelData;
        }
    }
}
