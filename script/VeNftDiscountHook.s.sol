// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {VeNftDiscountHook} from "../src/pool-cl/VeNftDiscountHook.sol";
import {CLPoolManager} from "@pancakeswap/v4-core/src/pool-cl/CLPoolManager.sol";
import {PoolKey} from "@pancakeswap/v4-core/src/types/PoolKey.sol";
import {PoolId} from "@pancakeswap/v4-core/src/types/PoolId.sol";
import {Constants} from "@pancakeswap/v4-core/test/pool-cl/helpers/Constants.sol";
import {Currency} from "@pancakeswap/v4-core/src/types/Currency.sol";
import {LPFeeLibrary} from "@pancakeswap/v4-core/src/libraries/LPFeeLibrary.sol";
import {CLPoolParametersHelper} from "@pancakeswap/v4-core/src/pool-cl/libraries/CLPoolParametersHelper.sol";
import {PoolIdLibrary} from "@pancakeswap/v4-core/src/types/PoolId.sol";

contract MyScript is Script {
    using PoolIdLibrary for PoolKey;
    using CLPoolParametersHelper for bytes32;

    VeNftDiscountHook hook;
    Currency currency0;
    Currency currency1;
    PoolKey key;
    PoolId id;

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
        hook = new VeNftDiscountHook(poolManager, nftContractAddress);

        currency0 = Currency.wrap(0x1EE8D4e96c6d18E1909D1a3888d6CC4Ae3456aA0); // TokenA
        currency1 = Currency.wrap(0x2FF7B00EC6AFdd3Fb68D94b08862f9D12D99a92D); // TokenA

        key = PoolKey({
            currency0: currency0,
            currency1: currency1,
            hooks: hook,
            poolManager: poolManager,
            fee: LPFeeLibrary.DYNAMIC_FEE_FLAG,
            // parameters include hook callback and tickSpacing: 10
            parameters: bytes32(uint256(hook.getHooksRegistrationBitmap())).setTickSpacing(10)
        });
        id = key.toId();

        /// Initialize the pool
        poolManager.initialize(key, Constants.SQRT_RATIO_1_1, abi.encode(uint24(3000)));

        vm.stopBroadcast();
    }
}
