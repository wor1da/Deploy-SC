#!/bin/bash
source .env
echo "📖 Current greeting:"
cast call $HELLOARCHITECT_ADDRESS "getGreeting()(string)" \
  --rpc-url $ARC_TESTNET_RPC_URL
