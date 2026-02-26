#!/bin/bash

source .env

echo "=== HelloArchitect Interaction ==="
echo ""
echo "Current greeting:"
cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
  --rpc-url $ARC_TESTNET_RPC_URL

echo ""
read -p "Enter new greeting: " NEW_GREETING

echo ""
echo "Updating greeting..."
cast send $HELLOARCHITECT_ADDRESS "setGreeting(string)" \
  "$NEW_GREETING" \
  --rpc-url $ARC_TESTNET_RPC_URL \
  --private-key $PRIVATE_KEY

echo ""
echo "New greeting:"
cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
  --rpc-url $ARC_TESTNET_RPC_URL

echo ""
echo "✅ Done!"
