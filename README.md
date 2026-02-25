source .env
cast wallet address --private-key $PRIVATE_KEY ***address***

curl -X POST https://faucet.circle.com/api/v1/drip \
  -H "Content-Type: application/json" \
  -d '{
    "address": "'$WALLET'",
    "chainId": "63"
  }'
