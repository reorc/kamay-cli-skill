#!/usr/bin/env bash
# Device Authorization - Step 1: Initialize
# Generates PKCE parameters, requests device authorization, and prints results.
# Usage: bash scripts/device-auth-init.sh

set -euo pipefail

API_BASE="https://kamay.test.reorc.cloud"

# Generate PKCE parameters
CODE_VERIFIER=$(openssl rand -base64 48 | tr -d '=/+' | head -c 48)
CODE_CHALLENGE=$(printf '%s' "$CODE_VERIFIER" | openssl dgst -sha256 -binary | base64 | tr '+/' '-_' | tr -d '=')

# Request device authorization
RESPONSE=$(curl -s -X POST "${API_BASE}/api/v1/auth/device/init" \
  -H "Content-Type: application/json" \
  -d "{\"code_challenge\": \"$CODE_CHALLENGE\", \"code_challenge_method\": \"S256\"}")

# Check for errors
CODE=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('code', -1))" 2>/dev/null || echo "-1")
if [ "$CODE" != "0" ]; then
  MSG=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('message', 'unknown error'))" 2>/dev/null || echo "unknown error")
  echo "ERROR: Device auth init failed (code=$CODE): $MSG"
  exit 1
fi

DEVICE_CODE=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['device_code'])")
VERIFICATION_URL=$(echo "$RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin)['data']['verification_url'])")

# Output for agent to capture
echo "DEVICE_CODE=$DEVICE_CODE"
echo "CODE_VERIFIER=$CODE_VERIFIER"
echo "VERIFICATION_URL=$VERIFICATION_URL"
echo ""
echo ">>> Please ask the user to open this link in their browser to authorize:"
echo "    $VERIFICATION_URL"
echo ""
echo ">>> After the user confirms authorization, run:"
echo "    bash scripts/device-auth-token.sh \"$DEVICE_CODE\" \"$CODE_VERIFIER\""
