// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IFoo {
    function foo() external;
}

contract LowLevel {
    function main(address a) public returns (bool) {
        (bool ok,) = a.call(abi.encodeWithSignature("foo()"));
        return ok;

        // try IFoo(a).foo() {
        //     return true;
        // } catch {
        //     return false;
        // }
    }
}
