// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract Create2Factory {
    constructor() {
        bytes memory runtime = hex"602a60005260206000f3"; // returns "0x602a..."
        assembly {
            return(add(runtime, 0x20), mload(runtime))
        }
    }
}

contract DeployCreate2 is Script {
    function run() external {
        vm.startBroadcast();

        Create2Factory factory = new Create2Factory();
        console.log("CREATE2 factory deployed at:", address(factory));

        vm.stopBroadcast();
    }
}
