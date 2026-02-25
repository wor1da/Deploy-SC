# Deploy-SC

Deploy Solidity smart contracts on Arc Testnet using Foundry.

## 🚀 Getting Started

### Step 1: Setup Environment
```bash
cp .env.example .env
nano .env
# Add your private key from: cast wallet new
source .env

Step 2: Install Dependencies
bash
forge install foundry-rs/forge-std

Step 3: Build & Test
bash
forge build
forge test -v
