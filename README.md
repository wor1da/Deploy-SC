# Deploy-SC

Deploy Solidity smart contracts on Arc Testnet using Foundry.

## 🚀 Getting Started

### Step 1: Setup Environment
```bash
cp .env.example .env
nano .env
# Add your private key from: cast wallet new
source .env
```
### Step 2: Install Dependencies
```bash
forge install foundry-rs/forge-std
```
### Step 3: Build & Test
```bash
forge build
forge test -v
```
### Step 4: Get Testnet USDC

Visit: https://faucet.circle.com

Select: Arc Testnet

Paste: Your wallet address (from cast wallet address --private-key $PRIVATE_KEY)

Request: USDC
### OR run
```bash
./get_usdc.sh
```
### Step 5: Deploy Contract
```bash
source .env
forge create src/HelloArchitect.sol:HelloArchitect \
  --rpc-url $ARC_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast
```
Sava contract to .env
```bash
echo 'HELLOARCHITECT_ADDRESS="0x..."' >> .env
source .env
```
### Step 6: Verify Deployment
```bash
cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
  --rpc-url $ARC_TESTNET_RPC_URL
```
Check on explorer: https://testnet.arcscan.app
### Step 7: Interact with Contract
```bash
# Read greeting
cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
  --rpc-url $ARC_TESTNET_RPC_URL

# Update greeting
cast send $HELLOARCHITECT_ADDRESS "setGreeting(string)" \
  "Hello Arc Testnet!" \
  --rpc-url $ARC_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY
```
---
🔐 Security
✅ .env is in .gitignore - never pushed to GitHub
✅ .env.example is public - contains placeholder values
✅ Private key stays on your local machine only



