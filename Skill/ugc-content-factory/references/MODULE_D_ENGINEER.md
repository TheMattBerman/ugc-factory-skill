# Module D: Engineer

**Role:** Compile the Visual Beat Sheet + Synchronized Script into fal.ai API calls, execute generation, and manage output.

**Input:** Approved Visual Beat Sheet (Module B) + Approved Synchronized Script (Module C)
**Output:** Generated video via fal.ai Kling 3.0

---

## API Reference (fal.ai)

### Endpoints

| Use Case | Endpoint |
|----------|----------|
| Text-to-Video (Pro) | `fal-ai/kling-video/v3/pro/text-to-video` |
| Text-to-Video (Standard) | `fal-ai/kling-video/v3/standard/text-to-video` |
| Image-to-Video (Pro) | `fal-ai/kling-video/v3/pro/image-to-video` |
| Image-to-Video (Standard) | `fal-ai/kling-video/v3/standard/image-to-video` |
| Create Custom Voice | `fal-ai/kling-video/create-voice` |

**Model selection:**
- Use **standard** model for testing — faster, cheaper
- Use **pro** model for final renders only

---

## JSON Assembly Template

Merge the Visual Beat Sheet (camera/action) with the Synchronized Script (dialogue) into `multi_prompt`:

```json
{
  "duration": "[total seconds from beat sheet]",
  "aspect_ratio": "9:16",
  "generate_audio": true,
  "shot_type": "customize",
  "multi_prompt": [
    {
      "prompt": "[Camera from Beat Sheet], [Subject action from Beat Sheet], [Environment from Beat Sheet], [Lighting], [Texture], says '[Script from Module C]'",
      "duration": "[shot duration from Beat Sheet]"
    }
  ],
  "elements": [
    {
      "frontal_image_url": "[character reference URL]",
      "reference_image_urls": ["[additional angles if available]"]
    }
  ],
  "negative_prompt": "blur, distort, low quality, studio lighting, professional audio",
  "cfg_scale": 0.5
}
```

### Assembly Rules

1. **Each `multi_prompt` entry** = one shot from the Visual Beat Sheet
2. **Prompt formula:** `[Camera] + [Subject doing action] + [Environment] + [Lighting/Texture] + says '[dialogue from Module C]'`
3. **Duration** comes from the Beat Sheet (3s, 4s, or 5s per shot)
4. **Total duration** must equal sum of all shot durations
5. **Never include both `prompt` and `multi_prompt`** — use one or the other
6. **Minimum shot duration is 3 seconds** — Kling rejects anything shorter

### Image-to-Video Variant

```json
{
  "prompt": "[Full scene description with dialogue]",
  "start_image_url": "[seed image URL]",
  "duration": "[total seconds]",
  "aspect_ratio": "9:16",
  "generate_audio": true,
  "elements": [
    {
      "frontal_image_url": "[character reference URL]",
      "reference_image_urls": ["[additional angles]"]
    }
  ],
  "negative_prompt": "blur, distort, low quality, professional lighting"
}
```

---

## Elements Schema (Character Lock)

```json
{
  "elements": [
    {
      "frontal_image_url": "string (REQUIRED - clear frontal face)",
      "reference_image_urls": ["string (REQUIRED - additional angles, can reuse frontal URL)"]
    }
  ]
}
```

Reference characters in prompts as: `@Element1`, `@Element2`, etc.

---

## Multi-Prompt Schema

```json
{
  "multi_prompt": [
    {
      "prompt": "string (prompt for this shot)",
      "duration": "3-15 (seconds for this shot)"
    }
  ],
  "shot_type": "customize"
}
```

Total duration = sum of all shot durations (max 15 seconds per chunk).

---

## Voice IDs (Custom Voices)

Create custom voices via `fal-ai/kling-video/create-voice` (field: `voice_url`, NOT `audio_url`), then reference:
```
The character says <<<voice_1>>> "Your script text here"
```

**CRITICAL: Voice IDs + Elements = MUTUALLY EXCLUSIVE**
- Cannot use `voice_ids` and `elements` in the same API call
- Error: "Custom Voice IDs are not supported with Elements."
- This drives the chunking strategy for videos >15s (see Chunk Mapping below)

---

## Key Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `prompt` | string | Text prompt (or use `multi_prompt` for multi-shot) |
| `duration` | "3"-"15" | Video duration in seconds |
| `aspect_ratio` | enum | "16:9", "9:16", "1:1" |
| `generate_audio` | boolean | Native audio generation (default: true) |
| `multi_prompt` | array | Multi-shot prompts with durations |
| `elements` | array | Character/object references for consistency |
| `voice_ids` | array | Custom voice IDs (max 2 per video) |
| `negative_prompt` | string | What to avoid |
| `cfg_scale` | float | Prompt adherence 0-1 (default: 0.5) |

---

## Queue Management

### When to use queue endpoint
Use the **queue endpoint** (`queue.fal.run`) for any generation over 5 seconds.

```bash
# Submit to queue
curl -X POST "https://queue.fal.run/fal-ai/kling-video/v3/pro/text-to-video" \
  -H "Authorization: Key $FAL_KEY" \
  -H "Content-Type: application/json" \
  -d '{ ... }'

# Returns: {"request_id": "xxx", "status_url": "..."}

# Poll for completion
curl -s "[status_url]" -H "Authorization: Key $FAL_KEY"

# When status = "COMPLETED", fetch result from response_url
```

### Chunk Mapping (for videos > 15s) — Story-Driven

**Only chunk when total duration exceeds 15s.** Multi-prompt handles everything within a single 15s chunk.

Chunk around **story beats**, not mechanical 15s intervals. The **product chunk** (where @Element2 appears) is the anchor point.

**Two types of chunks:**
1. **Element chunk** — uses Elements (@Element1/@Element2) + `generate_audio`. No `voice_ids`.
2. **Voice chunk** — uses `voice_ids` + seed frame (last frame of prior chunk). No `elements`.

**Chunking logic:**
- Any chunk needing @Element2 (product) = Element chunk
- Any chunk NOT needing product = Voice chunk (if custom voice needed)
- Generate Element chunks first (they produce audio)
- Extract voice from best-sounding Element chunk → `fal-ai/kling-video/create-voice` (field: `voice_url`)
- Apply `voice_ids` to all Voice chunks

**Example: 25s video, product appears at ~20s:**
```
Chunk 1 (0-15s): Story setup, no product.
  → Element chunk: @Element1 + generate_audio
  → Voice established here

Chunk 2 (15-22s): Product reveal.
  → Element chunk: @Element1 + @Element2 + generate_audio

Chunk 3 (22-25s): Closing/CTA.
  → Voice chunk: voice_id (from chunk 1 or 2) + seed frame
  → No elements needed
```

**Fallback:** If product MUST appear in a Voice chunk, composite product into the seed frame image.

---

## API Gotchas

| Error | Cause | Fix |
|-------|-------|-----|
| `prompt and multi_prompt cannot both be provided` | Including both fields | Remove `prompt` field entirely when using `multi_prompt` |
| `duration "2" not in allowed values` | Shot duration under 3s | Minimum duration per shot is **3 seconds** |
| Timeout on long videos | Using sync endpoint for 10+ sec | Use **queue endpoint** for anything over 5s |
| `Custom Voice IDs are not supported with Elements` | Using `voice_ids` + `elements` together | They are **mutually exclusive** — use story-driven chunking |
| `field required: voice_url` | Using `audio_url` in create-voice | Field name is `voice_url`, NOT `audio_url` |
| `reference_image_urls` missing | Using `reference_images` (wrong name) | Correct field: `reference_image_urls` (plural, with underscore) |

---

## Common Generation Artifacts

These are model issues, not workflow issues — reroll if you see them:
- **Object morphing** — Phone turning into product, props changing shape
- **Extra limbs** — Additional hands or fingers appearing
- **Face drift** — Character looking slightly different mid-video
- **Audio desync** — Lip movement not matching speech

**Fix:** Reroll the generation. These are stochastic failures, not prompt problems.

---

## Compilation Checklist

Before submitting to fal.ai, verify:

### JSON Validity
- [ ] `multi_prompt` array has correct number of shots
- [ ] Each shot has both `prompt` and `duration` fields
- [ ] `shot_type` is set to `"customize"` when using multi_prompt
- [ ] No `prompt` field at top level when using `multi_prompt`
- [ ] All durations are strings ("3", "4", "5")
- [ ] Sum of shot durations equals total duration

### Content Integrity
- [ ] Visual descriptions match approved Beat Sheet
- [ ] Dialogue matches approved Script
- [ ] Character reference URL is valid
- [ ] Elements array is properly formatted
- [ ] Negative prompt includes anti-studio terms

### Quality Settings
- [ ] Aspect ratio is 9:16 (vertical for UGC)
- [ ] `generate_audio` is true
- [ ] `cfg_scale` is 0.5 (default)
- [ ] Using standard model for test, pro for final

---

## Variant Generation

After an approved video, generate variants:

**Script variants:**
- Same character + same setting + different script angle
- 3-5 hook variations for A/B testing

**Character variants:**
- Same script + different character
- Test which persona resonates

**Format variants:**
- 9:16 (TikTok/Reels)
- 1:1 (Feed)
- 4:5 (Instagram portrait)

---

## Output Format

### Single Video Output

```markdown
## UGC Video Generated

**Character:** [Name/ID]
**Format:** [Testimonial/Unboxing/etc.]
**Duration:** [X] seconds
**Aspect:** 9:16

**Script:**
> [Full script text]

**Video URL:** [URL]

**Quality Check:**
- [x] Character consistency
- [x] Natural delivery
- [x] Lip-sync accurate
- [x] Authentic feel

**Next Steps:**
- [ ] Approve for use
- [ ] Generate script variants
- [ ] Generate character variants
- [ ] Request adjustments
```

### Batch Output

```markdown
## UGC Batch Generated

**Campaign:** [Campaign name]
**Character:** [Name/ID]
**Videos Generated:** [N]

| # | Format | Script Hook | Duration | URL | Status |
|---|--------|-------------|----------|-----|--------|
| 1 | Testimonial | "Okay I have to tell you..." | 15s | [URL] | Ready |
| 2 | Problem/Solution | "I used to struggle with..." | 15s | [URL] | Ready |

**Approve all or select specific videos for revision.**
```
