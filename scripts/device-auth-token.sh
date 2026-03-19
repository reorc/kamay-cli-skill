#!/usr/bin/env bash
# Device Authorization - Step 2: Poll for token
# Usage: bash scripts/device-auth-token.sh <device_code> <code_verifier>

set -euo pipefail

API_BASE="https://kamay.test.reorc.cloud"

if [ $# -lt 2 ]; then
  echo "Usage: bash scripts/device-auth-token.sh <device_code> <code_verifier>"
  exit 1
fi

DEVICE_CODE="$1"
CODE_VERIFIER="$2"

RESPONSE=$(curl -s -X POST "${API_BASE}/api/v1/auth/device/token" \
  -H "Content-Type: application/json" \
  -d "{\"device_code\": \"$DEVICE_CODE\", \"code_verifier\": \"$CODE_VERIFIER\"}")

CODE=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('code', -1))" 2>/dev/null || echo "-1")

if [ "$CODE" = "4602" ]; then
  echo "PENDING"
  echo ""
  echo ">>> Authorization pending. The user has not authorized yet."
  echo ">>> Ask the user to complete the browser authorization, then re-run this command."
  exit 0
fi

if [ "$CODE" != "0" ]; then
  MSG=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('message', 'unknown error'))" 2>/dev/null || echo "unknown error")
  echo "ERROR: Token request failed (code=$CODE): $MSG"
  exit 1
fi

API_KEY=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['access_token'])")

echo "API_KEY=$API_KEY"
echo ""
echo ">>> Authorization successful! Save the key by running:"
echo "    kamay auth apikey --key \"$API_KEY\""
