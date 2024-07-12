// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {VeNftDiscountHook} from "../src/pool-cl/VeNftDiscountHook.sol";
import {CLPoolManager} from "@pancakeswap/v4-core/src/pool-cl/CLPoolManager.sol";

contract MyScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Deploy VeNftDiscountHook.sol
        // 1. get address of sepolia CL Pool Manager (https://developer.pancakeswap.finance/contracts/v4/resources/addresses#addresses)
        address poolManagerAddress = 0x97e09cD0E079CeeECBb799834959e3dC8e4ec31A;
        CLPoolManager poolManager = CLPoolManager(poolManagerAddress);

        // 2. get address of sepolia Erc721 contract
        address nftContractAddress = 0xD0bB5823D31C9544f60611D1A8F5434349d20025;

        // 3. deploy VeNftDiscountHook.sol
        VeNftDiscountHook hook = new VeNftDiscountHook(poolManager, nftContractAddress);

        vm.stopBroadcast();
    }
}
