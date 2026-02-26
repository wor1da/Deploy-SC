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
---
✅ .env is in .gitignore - never pushed to GitHub

✅ .env.example is public - contains placeholder values

✅ Private key stays on your local machine only

📚 Resources
---
Foundry Docs

Arc Network

Solidity Docs

# Deploy Steps
### Step 1: Setup Environment
```bash
cp .env.example .env
nano .env
```
Add to .env:
```bash
ARC_TESTNET_RPC_URL="https://rpc.testnet.arc.network"
PRIVATE_KEY="0x..."  # Your private key
HELLOARCHITECT_ADDRESS=""
Save: Ctrl + X → Y → Enter
```
### Step 2: Load Environment
```bash
source .env
```
### Step 3: Check RPC
```bash
cast chain-id --rpc-url $ARC_TESTNET_RPC_URL
```
Output:
```code
63
```
### Step 4: Check address
```bash
cast wallet address --private-key $PRIVATE_KEY
```
Output:
```code
0x...
```
### Step 5: Check Balance
```bash
WALLET=$(cast wallet address --private-key $PRIVATE_KEY)
cast balance $WALLET --rpc-url $ARC_TESTNET_RPC_URL
```
Output:
```code
100000000000000000000  (100 USDC)
```
### Step 6: Build Contract
```bash
forge clean
forge build
```
Output:
```code
Compiling 1 file with Solc 0.8.30
Compiler run successful!
```
### Step 7: Deploy
```bash
source .env
forge create src/HelloArchitect.sol:HelloArchitect \
  --rpc-url $ARC_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast

Output:
```code
Deployer: 0x....
Deployed to: 0x...
Transaction hash: 0xeba0fcb5e528d586db0aeb2465a8fad0299330a9773ca62818a1827560a67346
```
### Step 8: Save Contract Address
```bash
echo 'HELLOARCHITECT_ADDRESS="0x..."' >> .env
source .env
```
---
## 🚀 Interact
📖 Read - FREE
---
```bash
source .env

cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
  --rpc-url $ARC_TESTNET_RPC_URL
```
Output:

```code
"Hello Architect!"
```
✏️ Write - need gas fee (USDC)
---
Update Greeting
```bash
source .env

cast send $HELLOARCHITECT_ADDRESS "setGreeting(string)" \
  "Hello Arc Testnet!" \
  --rpc-url $ARC_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY
```
Output:
```Code
blockHash               0x1234567890abcdef...
blockNumber             1234568
transactionHash         0xabcdef1234567890...
status                  1 (success)
gasUsed                 26651
```
---
⚡ Script Auto
```bash
./interact.sh
```
