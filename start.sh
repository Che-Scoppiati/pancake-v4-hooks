# To load the variables in the .env file
source .env

# To deploy and verify our contract
# etherscan
#forge script --chain sepolia script/VeNftDiscountHook.s.sol:MyScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv

# blockscout
forge script --chain sepolia script/VeNftDiscountHook.s.sol:MyScript --verifier=blockscout --verifier-url=https://eth-sepolia.blockscout.com/api/ --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
