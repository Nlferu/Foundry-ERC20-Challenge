// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";
import {console} from "forge-std/console.sol";

contract DeployOurToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1_000_000 ether; // 1 million tokens with 18 decimal places
    uint256 public DEFAULT_ANVIL_PRIVATE_KEY = vm.envUint("PRIVATE_KEY");
    uint256 public deployerKey;

    function run() external returns (OurToken) {
        if (block.chainid == 31337) {
            deployerKey = DEFAULT_ANVIL_PRIVATE_KEY;
        } else {
            deployerKey = vm.envUint("S_PRIVATE_KEY");
        }
        vm.startBroadcast(deployerKey);
        OurToken ourToken = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ourToken;
    }
}
