#!/bin/bash

# UGC Content Factory - fal.ai API Test Script
# Run this to validate your fal.ai connection and test basic video generation

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=================================="
echo "UGC Content Factory - API Test"
echo "=================================="

# Check for FAL_KEY
if [ -z "$FAL_KEY" ]; then
    echo -e "${RED}ERROR: FAL_KEY not set${NC}"
    echo "Run: source ~/.zshrc"
    echo "Or set: export FAL_KEY='your-key-here'"
    exit 1
fi

echo -e "${GREEN}✓ FAL_KEY found${NC}"

# Test 1: Simple text-to-video (5 seconds)
echo ""
echo "=================================="
echo "TEST 1: Basic Text-to-Video (5s)"
echo "=================================="

RESPONSE=$(curl -s -X POST "https://fal.run/fal-ai/kling-video/v3/standard/text-to-video" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "prompt": "Woman in her 30s sitting in bright kitchen, talking to camera with warm genuine smile, natural window light, casual sweater, authentic UGC selfie style, slight room reverb in audio",
    "duration": "5",
    "aspect_ratio": "9:16",
    "generate_audio": true,
    "negative_prompt": "blur, distort, low quality, studio lighting, professional audio, perfect skin"
  }')

# Check for error
if echo "$RESPONSE" | grep -q "error"; then
    echo -e "${RED}ERROR in response:${NC}"
    echo "$RESPONSE" | jq .
    exit 1
fi

# Extract video URL
VIDEO_URL=$(echo "$RESPONSE" | jq -r '.video.url // .request_id // "pending"')

if [ "$VIDEO_URL" = "pending" ] || [ -z "$VIDEO_URL" ]; then
    REQUEST_ID=$(echo "$RESPONSE" | jq -r '.request_id')
    echo -e "${YELLOW}Video queued. Request ID: $REQUEST_ID${NC}"
    echo "Poll for result with:"
    echo "curl -s 'https://fal.run/fal-ai/kling-video/v3/standard/text-to-video/requests/$REQUEST_ID' -H 'Authorization: Key \$FAL_KEY'"
else
    echo -e "${GREEN}✓ Video generated!${NC}"
    echo "URL: $VIDEO_URL"
fi

echo ""
echo "=================================="
echo "Full response:"
echo "=================================="
echo "$RESPONSE" | jq .

echo ""
echo "=================================="
echo "Next Steps:"
echo "=================================="
echo "1. Check the video URL above"
echo "2. If queued, poll for completion with the request ID"
echo "3. Once working, test with elements for character consistency"
