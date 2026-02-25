#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Deploy-SC: Build & Test${NC}"
echo -e "${BLUE}========================================${NC}\n"

echo -e "${BLUE}[1/3] Cleaning...${NC}"
forge clean && echo -e "${GREEN}✓ Clean successful${NC}\n" || exit 1

echo -e "${BLUE}[2/3] Compiling...${NC}"
forge build && echo -e "${GREEN}✓ Build successful${NC}\n" || exit 1

echo -e "${BLUE}[3/3] Testing...${NC}"
forge test -v && echo -e "\n${GREEN}✓ All tests passed!${NC}\n" || exit 1
