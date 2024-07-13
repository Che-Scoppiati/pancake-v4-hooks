# Pancake v4 hooks template

[`Use this Template`](https://github.com/new?owner=pancakeswap&template_name=pancake-v4-hooks-template&template_owner=pancakeswap)

## Prerequisite

1. Install foundry, see https://book.getfoundry.sh/getting-started/installation

## Running test

1. Install dependencies with `forge install`
2. Run test with `forge test`
3. Deploy it to sepolia with `./start.sh`

## Description

This repository contains a custom hook for CL pool types, it allows for a discount if the user is holder of a certain NFT collection.

In this use case, OG users of our application Snappy Knows, will be able to use their og status to receive a discount on the LP fees of my pool.

## Deployment addresses
* NFT brian knows og contract address
  * [sepolia](https://eth-sepolia.blockscout.com/address/0x3C7A65BaE49791fca7F92B2dbF37bBDFbFDD2224) 0x3C7A65BaE49791fca7F92B2dbF37bBDFbFDD2224;
  * [linea mainnet](https://lineascan.build/token/0x186cf0f23ac8f308b7549f8bf7e75fd58e2bdfa7) [blockscout](https://explorer.linea.build/address/0x186cF0F23aC8f308B7549F8Bf7e75Fd58e2BDfA7) 0x186cf0f23ac8f308b7549f8bf7e75fd58e2bdfa7
  * [linea sepolia](https://sepolia.lineascan.build/address/0x832b4559c11d871f7760e4ee0bd22588bc014555) [blockscout](https://explorer.sepolia.linea.build/address/0x832b4559C11D871f7760E4eE0bD22588bC014555) 0x832b4559c11d871f7760e4ee0bd22588bc014555

* PancakeSwap hook Pool contract 
  * [Sepolia contract](https://eth-sepolia.blockscout.com/address/0x76333b4B92Ca51b692FAB95Bf48A77d60681A965?tab=contract) 0x76333b4B92Ca51b692FAB95Bf48A77d60681A965