#!/bin/bash

source .env

echo "🎯 Getting testnet USDC..."
echo ""

# Get wallet address
WALLET=$(cast wallet address --private-key $PRIVATE_KEY)
echo "💰 Wallet: $WALLET"

# Get current balance
echo ""
echo "📊 Current balance:"
cast balance $WALLET --rpc-url $ARC_TESTNET_RPC_URL

# Request USDC
echo ""
echo "🔄 Requesting USDC from faucet..."

RESPONSE=$(curl -s -X POST https://faucet.circle.com/api/v1/drip \
  -H "Content-Type: application/json" \
  -d '{
    "address": "'$WALLET'",
    "chainId": "63"
  }')

echo "📨 Response: $RESPONSE"
echo ""

# Wait for confirmation
echo "⏳ Waiting 10 seconds for transaction..."
sleep 10

# Check new balance
echo ""
echo "✅ New balance:"
cast balance $WALLET --rpc-url $ARC_TESTNET_RPC_URL

echo ""
echo "🎉 Done!"
