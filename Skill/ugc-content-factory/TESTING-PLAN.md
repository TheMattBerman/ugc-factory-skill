# UGC Content Factory - Testing Plan

## Overview

This document outlines the testing process to validate the UGC Content Factory system before newsletter publication.

**Goal:** Prove the concept works end-to-end, document what works/doesn't, gather real outputs for newsletter.

---

## Test Matrix

### Phase 1: Component Testing (Do First)

| Test | Tool | What We're Validating | Success Criteria |
|------|------|----------------------|------------------|
| **T1: Character Generation** | Nano Banana | Can we generate consistent character reference images? | 3-5 usable reference images that look like same person |
| **T2: Elements Lock** | fal.ai | Does uploading reference to Elements maintain identity? | Character recognizable across 2+ test generations |
| **T3: Single Shot Video** | fal.ai | Can we generate a simple talking head with character lock? | 5-second video, character matches reference |
| **T4: Lip-Sync Test** | fal.ai | Does native lip-sync work with script? | Audio syncs to mouth movement, natural pacing |
| **T5: Multi-Shot Test** | fal.ai | Does storyboard feature work as documented? | 2-4 shot video with smooth transitions |

### Phase 2: Integration Testing

| Test | Flow | What We're Validating | Success Criteria |
|------|------|----------------------|------------------|
| **T6: Nano → fal.ai Kling 3.0** | Nano Banana image → fal.ai Kling 3.0 Elements | Does generated image work as character reference? | fal.ai Kling 3.0 accepts image, maintains identity |
| **T7: Full Testimonial** | Script → Storyboard → Video | Complete 15-sec testimonial generation | End-to-end video feels like real UGC |
| **T8: Character Variants** | Same script, different characters | Can we swap characters easily? | Both videos feel authentic, different people |
| **T9: Script Variants** | Same character, different scripts | Can we generate multiple scripts efficiently? | 3-5 hook variations with same character |

### Phase 3: Quality Testing

| Test | Focus | What We're Validating | Success Criteria |
|------|-------|----------------------|------------------|
| **T10: Authenticity Check** | Final outputs | Does it feel like real UGC or AI? | Passes the "would I scroll past this" test |
| **T11: Platform Fit** | Format variations | Do outputs work for different platforms? | 9:16 and 1:1 versions both usable |
| **T12: Client Test** | Real product | Can we generate UGC for an actual client product? | Client-ready output (or close) |

---

## Phase 1: Component Tests (Manual)

### T1: Character Generation (Nano Banana)

**Objective:** Generate 3-5 reference images of a consistent character

**Process:**
1. Go to Nano Banana / use `/ai-image-generation`
2. Generate with this prompt:
   ```
   Friendly woman in her early 30s, casual sweater, sitting in
   bright modern kitchen, warm genuine smile, holding phone at
   selfie angle, natural window light, authentic social media
   photo quality, not overly polished
   ```
3. Generate 5 variations
4. Assess: Do they look like the same person?

**What to Document:**
- [ ] Prompt used
- [ ] Generation time
- [ ] How many attempts to get consistency?
- [ ] Save best 3 images for T2

**Success Criteria:**
- At least 3 images that could be the same person
- Natural, not over-rendered
- Appropriate for UGC aesthetic

---

### T2: Elements Lock (fal.ai)

**Objective:** Test character identity preservation

**Process:**
1. Access fal.ai (fal.ai or API)
2. Go to Elements feature
3. Upload best reference image from T1
4. Generate 2 test videos with simple prompt:
   ```
   Woman from reference image sitting in kitchen, talking to camera,
   natural window light, casual conversation, 5 seconds
   ```
5. Compare: Does character match reference?

**What to Document:**
- [ ] Elements upload process (easy/hard?)
- [ ] How similar is generated character to reference?
- [ ] Any drift or inconsistency?
- [ ] Screenshots of comparison

**Success Criteria:**
- Generated character is recognizably the same person
- No major face changes between shots
- Hair, features, vibe consistent

---

### T3: Single Shot Video (fal.ai)

**Objective:** Basic video generation with character

**Process:**
1. Using character from T2
2. Generate simple 5-second video:
   ```
   [Character from Elements] in bright kitchen, looking at camera,
   speaking enthusiastically about a product she's holding,
   natural window light, UGC selfie style, 5 seconds
   ```
3. Evaluate output quality

**What to Document:**
- [ ] Generation time
- [ ] Video quality (4K working?)
- [ ] Motion quality (natural or robotic?)
- [ ] Expression quality
- [ ] Download video for records

**Success Criteria:**
- Video generates successfully
- Character matches reference
- Motion looks natural
- Could pass as real UGC

---

### T4: Lip-Sync Test (fal.ai)

**Objective:** Test native lip-sync with script

**Process:**
1. Use character from previous tests
2. Generate with script:
   ```
   Script: "Okay I have to tell you about this product.
   I've been using it for two weeks and honestly? The
   difference is unreal. If you're dealing with this
   problem, you need to try it."
   ```
3. Enable lip-sync feature, English
4. Evaluate sync quality

**What to Document:**
- [ ] Does mouth movement match words?
- [ ] Natural pacing or robotic?
- [ ] Any desync issues?
- [ ] Audio quality?
- [ ] Compare to no-lip-sync version

**Success Criteria:**
- Lip sync is believable
- Natural speech rhythm
- No obvious desync
- Audio is clear

---

### T5: Multi-Shot Test (fal.ai)

**Objective:** Test storyboard/multi-shot feature

**Process:**
1. Create simple 4-shot storyboard:
   ```
   Shot 1 (3s): Character at kitchen counter, picks up product
   Shot 2 (3s): Close on product in hands
   Shot 3 (4s): Back to character, speaking to camera
   Shot 4 (5s): Character gestures enthusiastically, smiles
   ```
2. Generate with storyboard feature
3. Evaluate transitions and consistency

**What to Document:**
- [ ] Does multi-shot work as expected?
- [ ] Are transitions smooth?
- [ ] Does character stay consistent across shots?
- [ ] How does fal.ai Kling 3.0 interpret shot instructions?
- [ ] Any unexpected behaviors?

**Success Criteria:**
- All 4 shots generate
- Transitions are smooth (not jarring cuts)
- Character consistent throughout
- Follows storyboard reasonably well

---

## Phase 2: Integration Tests

### T6: Nano → fal.ai Kling 3.0 Pipeline

**Objective:** Validate full character creation flow

**Process:**
1. Generate fresh character in Nano Banana (different from T1)
   ```
   Young man in late 20s, casual t-shirt, home office background,
   friendly expression, natural lighting, authentic selfie style
   ```
2. Save best reference image
3. Upload to fal.ai Kling 3.0 Elements
4. Generate 5-second test video
5. Assess character preservation

**What to Document:**
- [ ] Does Nano Banana output format work with fal.ai Kling 3.0?
- [ ] Any quality issues in transfer?
- [ ] Character match percentage
- [ ] Time for full flow

**Success Criteria:**
- Nano Banana image accepted by fal.ai Kling 3.0
- Character preserved in video
- No technical blockers

---

### T7: Full Testimonial (End-to-End)

**Objective:** Generate complete 15-second testimonial video

**Process:**
1. Use established character
2. Full script:
   ```
   "Okay I need to talk about [X]. I've been using it for about
   three weeks now and honestly the difference is wild. Before
   this I was constantly dealing with [problem]. Now I just
   [positive result] every single time. If you're still struggling
   with [pain point], you need to try this. Link's in my bio."
   ```
3. Create 4-shot storyboard:
   ```
   Shot 1 (3s): Hook - character grabs attention
   Shot 2 (5s): Problem/discovery - showing product
   Shot 3 (5s): Result - enthusiasm, gestures
   Shot 4 (2s): CTA - direct to camera
   ```
4. Generate with Elements + lip-sync + storyboard
5. Full quality assessment

**What to Document:**
- [ ] Full generation time
- [ ] Quality of each component
- [ ] Overall authenticity score (1-10)
- [ ] What works? What doesn't?
- [ ] Save full output for newsletter

**Success Criteria:**
- Complete 15-second video
- All features working together
- Passes authenticity test
- Could use for real brand (or close)

---

### T8: Character Variants

**Objective:** Same script, different characters

**Process:**
1. Take script from T7
2. Generate same testimonial with:
   - Original character (female)
   - New character (male, different demo)
   - New character (different ethnicity)
3. Compare outputs

**What to Document:**
- [ ] Time to swap characters
- [ ] Do both feel authentic?
- [ ] Any quality differences?
- [ ] Which demographic works best?

**Success Criteria:**
- Can swap characters easily
- Both versions usable
- Script works across demographics

---

### T9: Script Variants

**Objective:** Same character, different hooks

**Process:**
1. Keep same character
2. Generate 3 script variants:
   - Hook A: "Okay I have to tell you about this..."
   - Hook B: "Stop scrolling. This changed everything..."
   - Hook C: "I was skeptical at first, but..."
3. Same format, different openings
4. Compare engagement potential

**What to Document:**
- [ ] Generation consistency across variants
- [ ] Character stays consistent?
- [ ] Which hook feels strongest?
- [ ] A/B test potential

**Success Criteria:**
- Can generate multiple variants quickly
- Character consistent across all
- Clear hook winner emerges

---

## Phase 3: Quality Tests

### T10: Authenticity Check

**Objective:** Does it pass as real UGC?

**Process:**
1. Take best outputs from previous tests
2. Show to 3-5 people without context
3. Ask: "Is this real or AI-generated?"
4. Gather honest feedback

**What to Document:**
- [ ] How many guessed correctly?
- [ ] What gave it away? (if anything)
- [ ] What was most believable?
- [ ] Specific feedback quotes

**Success Criteria:**
- At least 50% think it's real (or uncertain)
- Feedback actionable for improvement
- No obvious "AI smell"

---

### T11: Platform Fit

**Objective:** Test format variations

**Process:**
1. Generate same content in:
   - 9:16 (TikTok/Reels)
   - 1:1 (Square feed)
   - 4:5 (Instagram portrait)
2. Evaluate each format

**What to Document:**
- [ ] Does character framing work for all ratios?
- [ ] Any cropping issues?
- [ ] Quality differences?
- [ ] Platform-specific issues?

**Success Criteria:**
- All formats usable
- Character visible/framed correctly
- No major quality loss

---

### T12: Client Test

**Objective:** Generate UGC for real product

**Process:**
1. Pick an Emerald Digital client product
2. Create character matching their target demo
3. Write testimonial script for their product
4. Generate full 15-second UGC
5. Evaluate: Is this client-ready?

**What to Document:**
- [ ] Product: [which client/product]
- [ ] Full output quality
- [ ] Would client approve? Why/why not?
- [ ] What would need to change?
- [ ] Time investment for client-ready

**Success Criteria:**
- Output is close to usable for client
- Clear path to client-ready quality
- ROI math works (time vs cost of real UGC)

---

## Tracking Template

### Test Log

```markdown
## Test: [T# - Name]
**Date:** YYYY-MM-DD
**Duration:** X minutes

### Setup
- Tools used: [Nano Banana / fal.ai / etc.]
- Character: [reference if applicable]
- Prompt/Script: [exact text used]

### Results
- Output: [URL or file path]
- Quality score: [1-10]
- Issues encountered: [list]
- Surprises: [unexpected findings]

### Screenshots
[attach relevant screenshots]

### Verdict
- [ ] PASS - Works as expected
- [ ] PARTIAL - Works with caveats
- [ ] FAIL - Does not work

### Notes for Newsletter
[What's interesting to share from this test?]
```

---

## Success Summary Template

After completing all tests, fill out:

```markdown
## UGC Content Factory - Test Summary

**Date completed:** YYYY-MM-DD
**Total testing time:** X hours

### Component Results
| Test | Result | Notes |
|------|--------|-------|
| T1 Character Gen | PASS/PARTIAL/FAIL | |
| T2 Elements Lock | PASS/PARTIAL/FAIL | |
| T3 Single Shot | PASS/PARTIAL/FAIL | |
| T4 Lip-Sync | PASS/PARTIAL/FAIL | |
| T5 Multi-Shot | PASS/PARTIAL/FAIL | |

### Integration Results
| Test | Result | Notes |
|------|--------|-------|
| T6 Nano→fal.ai Kling 3.0 | PASS/PARTIAL/FAIL | |
| T7 Full Testimonial | PASS/PARTIAL/FAIL | |
| T8 Character Variants | PASS/PARTIAL/FAIL | |
| T9 Script Variants | PASS/PARTIAL/FAIL | |

### Quality Results
| Test | Result | Notes |
|------|--------|-------|
| T10 Authenticity | PASS/PARTIAL/FAIL | |
| T11 Platform Fit | PASS/PARTIAL/FAIL | |
| T12 Client Test | PASS/PARTIAL/FAIL | |

### Key Learnings
1. [Major learning]
2. [Major learning]
3. [Major learning]

### What Works
- [List what works well]

### What Doesn't Work (Yet)
- [List issues/limitations]

### Newsletter Ready?
- [ ] Yes - proceed with draft
- [ ] Partial - need to adjust claims
- [ ] No - need more testing

### Best Outputs for Newsletter
1. [URL/file - what it shows]
2. [URL/file - what it shows]
3. [URL/file - what it shows]
```

---

## Quick Start: Minimum Viable Test

If you want to validate the core concept quickly, run these 4 tests:

1. **T1: Character Gen** - Can we make consistent characters?
2. **T2: Elements Lock** - Does fal.ai Kling 3.0 preserve them?
3. **T4: Lip-Sync** - Does speech work?
4. **T7: Full Testimonial** - Does end-to-end work?

This gives you the core pipeline validation in ~1-2 hours.

---

## Tools Needed

- [ ] fal.ai access (fal.ai - Ultra subscription or API)
- [ ] Nano Banana / Replicate API access
- [ ] Screen recording (optional, for newsletter content)
- [ ] Storage for outputs

---

## Timeline Estimate

| Phase | Time | Notes |
|-------|------|-------|
| Phase 1: Component Tests | 2-3 hours | Can be done in one session |
| Phase 2: Integration Tests | 2-3 hours | After Phase 1 passes |
| Phase 3: Quality Tests | 1-2 hours | Need external feedback |
| Documentation | 1 hour | Summarize findings |
| **Total** | **6-9 hours** | Spread over 2-3 days ideal |

---

## After Testing

Once tests complete:

1. Update SKILL.md with any learnings
2. Refine prompts based on what worked
3. Document any API quirks discovered
4. Finalize newsletter draft with real examples
5. Save best outputs for newsletter images/demos
