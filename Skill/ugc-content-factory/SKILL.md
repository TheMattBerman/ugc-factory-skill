---
name: ugc-content-factory
description: "Director-First UGC video generation using Kling 3.0 (via fal.ai). Generates authentic AI characters, visuals, scripts, and videos through a 4-module pipeline with user approval gates. Triggers on: ugc, ugc video, ugc creator, testimonial video, user generated content, ai ugc, kling ugc, fal ugc, create ugc ad, ugc content factory."
---

# UGC Content Factory

Generate authentic-feeling UGC video content at scale with consistent AI characters, using Kling 3.0 via fal.ai.

**Core unlock:** Kling 3.0's Elements system locks character identity across videos. Combined with multi-shot storyboards and native lip-sync, you generate an entire UGC library with consistent "creators" — no real humans needed.

**Director-First principle:** Visuals before script. Design how each shot looks and moves FIRST, then write dialogue that fits. The script serves the visuals, not the other way around. This prevents the "sitting and talking" problem and forces visual variety.

---

## Contract

### Input
- **Required:** product/brand name + what it does + target audience
- **Optional:** existing character Element URLs, product image URLs, seed frames, brand voice file, competitor UGC examples
- **Format:** text description, URLs, or brand context file

### Output
- **Produces:** Generated UGC video(s) via fal.ai Kling 3.0, plus creative brief, visual beat sheet, and synchronized script
- **Format:** Video file (MP4), supporting docs inline
- **Downstream:** Paid creative pipeline, social posting, client deliverables

### Validation
- **Pre-conditions:** fal.ai API access, product/audience known
- **Post-conditions:** Video passes quality gate, all 4 stealth checks pass
- **Failure checks:** If character/audience mismatch is unresolvable, flag before generating

---

## Pipeline

```
MODULE A: Creative Director    → Creative Brief        → GATE 1
MODULE B: Cinematographer      → Visual Beat Sheet      → GATE 2
MODULE C: Screenwriter         → Synchronized Script    → GATE 3
MODULE D: Engineer             → fal.ai JSON + Execute  → Output
```

Each gate requires user approval before proceeding. Do not skip gates.

---

## Before entering the pipeline

**Ask the user:**
1. "Do you have an existing character to reuse?" (Element image URL)
2. "Do you have product images to use as Elements?" (image URL)
3. "Do you have a seed frame / first-frame image?" (image URL)

If no → new images generated with Nano Banana Pro via `/ai-image-generation`.

Check `references/CHARACTER_LIBRARY.md` for saved characters/products.

---

## Module A: Creative Director

**Read** `references/MODULE_A_CREATIVE_DIRECTOR.md` for full format/hook/validation details.
Also load: `references/CHARACTER_LIBRARY.md`, `references/SCENE_SETTINGS.md`.

**Core decisions:**
1. Pick ONE content format (Testimonial, Unboxing, Problem/Solution, Comparison, Demo)
2. Pick ONE hook angle (Gatekeep, Skeptic, Fail, Visual Shock)
3. Select character archetype + setting
4. Run Stealth Validation (all 4 checks must pass)

**Stealth Validation (mandatory — content must pass ALL 4):**
- **CAMOUFLAGE:** Would a scroller identify this as an ad in the first 0.5s? If yes → de-polish.
- **VIBE:** Does the viewer leave within 3s? If yes → lead with value before product.
- **INTEGRATION:** When the product appears, does the viewer swipe away? If yes → make product appearance inevitable, not forced.
- **IMPERFECTION:** Does this feel like a marketing team's output? If yes → add messiness, filler words, casual language.

**⛔ GATE 1 output — present to user:**

| Field | Content |
|-------|---------|
| Product | [name] |
| Target Audience | [who] |
| Content Format | [which one] |
| Hook Angle | [which one] |
| Audio Hook | [exact opening line] |
| Visual Hook | [what's on screen] |
| Character | [archetype + specifics] |
| Setting | [environment + details] |
| Target Duration | [seconds] |
| Stealth: Camouflage | PASS/FAIL + note |
| Stealth: Vibe | PASS/FAIL + note |
| Stealth: Integration | PASS/FAIL + note |
| Stealth: Imperfection | PASS/FAIL + note |

STOP. Wait for approval.

---

## Module B: Cinematographer

**Read** `references/MODULE_B_CINEMATOGRAPHER.md` for Kling prompt engineering, shot design, and image generation details.

**Core decisions:**
1. Design shot-by-shot visual sequence (NO dialogue yet)
2. Assign variable durations: 3s (punchy hooks), 4s (setup), 5s (demos that breathe)
3. Apply the 6 prompt elements: Camera, Subject, Environment, Lighting, Texture, Emotion
4. Verify scene variety: at least 2 of 4 shots must change position or angle
5. Generate seed images if using I2V workflow (Nano Banana Pro only)

**4 rules of Kling prompting (always apply):**
1. Lead with cinematic camera verbs (dolly push, whip-pan, shoulder-cam drift)
2. Include texture details (grain, reflections, condensation, fabric sheen)
3. Describe temporal flow (beginning → middle → end of each shot)
4. Name real light sources (not "dramatic lighting" — say neon signs, golden hour, fluorescent tubes)

**⛔ GATE 2 output — present to user:**

For each shot:
| Field | Content |
|-------|---------|
| Shot # | Sequential |
| Duration | 3s / 4s / 5s |
| Camera | Shot type + movement |
| Subject | Who + physical action |
| Environment | Setting details |
| Lighting | Light source + feel |
| Texture | Physical details that sell realism |
| Expression | Facial/emotional state |
| Action Flow | Beginning → middle → end |

Plus scene variety check (passes 2-of-4 rule?) and Kling prompt checklist.

STOP. Wait for approval.

---

## Module C: Screenwriter

**Read** `references/MODULE_C_SCREENWRITER.md` for audio rules, script templates, and sync mapping.

**The Visual Beat Sheet is LOCKED.** Write dialogue that fits existing shot durations. Do not change durations or camera directions.

**Core rules:**
- **Word budget:** ~2.5 words/sec (3s = 7-8 words, 4s = 9-10 words, 5s = 12-13 words)
- **Authentic cadence:** Include filler words ("honestly," "like," "okay so"), self-corrections, natural pauses
- **No ad-speak:** Ban "revolutionary," "game-changing," "best-in-class." Nobody talks like that.
- **The bridge:** Product mention must feel inevitable, not forced. It's a detail in a story, not a pivot point.
- **Product name:** Once, maybe twice. Not more.

**Dialogue litmus test:** Read it aloud. If it sounds like copy, rewrite it.

**⛔ GATE 3 output — present to user:**

For each shot:
| Field | Content |
|-------|---------|
| Shot # | From beat sheet |
| Duration | From beat sheet (DO NOT CHANGE) |
| Word Budget | Duration × 2.5 |
| Script | Exact dialogue |
| Word Count | Actual / budget |
| Delivery Notes | Tone direction |

Plus: full continuous script, total word count, sync check (PASS/FAIL).

STOP. Wait for approval.

---

## Module D: Engineer

**Read** `references/MODULE_D_ENGINEER.md` for API reference, JSON assembly, chunking strategy, and gotchas.

**Core execution:**
1. Merge Visual Beat Sheet + Script into `multi_prompt` JSON
2. Run compilation checklist
3. Submit to fal.ai (standard for test, pro for final)
4. Use queue endpoint for anything over 5s
5. Present output with quality check

**Critical API constraints:**
- `voice_ids` and `elements` are mutually exclusive — drives chunking strategy for >15s videos
- Minimum shot duration is 3 seconds
- Don't include both `prompt` and `multi_prompt`
- Use `voice_url` (not `audio_url`) for create-voice endpoint

---

## Quality Gate (before delivering final output)

Every output must pass ALL of these:

- [ ] Character feels native to the target audience (not a model, not a stock photo)
- [ ] Script sounds like a real person, not a marketer (read it aloud)
- [ ] First 2 seconds create genuine stop power
- [ ] Setting feels plausible and incidental, not staged
- [ ] Visual sequence varies enough (no 4 shots of sitting-and-talking)
- [ ] Dialogue fits shot durations (sync check passes)
- [ ] Product enters after the hook, not during it
- [ ] No ad-speak in dialogue
- [ ] One core message, not three
- [ ] Works with sound off (text overlays carry the story if used)
- [ ] All 4 stealth checks still pass on final output
- [ ] A real person scrolling would not immediately identify this as an ad

If any check fails, fix before delivering. Do not note the issue and move on.

---

## The 80/20

80% of UGC success comes from:
1. **Right character** for target audience
2. **Specific, genuine-sounding script** (not marketing speak)
3. **Appropriate casual setting** (not studio)
4. **Strong hook** in first 2 seconds

Get these right and the rest is optimization.

---

## Integration with other skills

| Skill | Use for |
|-------|---------|
| `/ai-image-generation` | Character reference images via Nano Banana Pro |
| `/hooks` | Generate hook variations for A/B testing |
| `/direct-response-copy` | Script optimization for conversion |
| `/brand-voice` | Ensure scripts match client voice |

---

## Reference files

| File | When to read | Content |
|------|-------------|---------|
| `MODULE_A_CREATIVE_DIRECTOR.md` | Gate 1 | Formats, hooks, stealth validation, creative brief template |
| `MODULE_B_CINEMATOGRAPHER.md` | Gate 2 | Visual design, Kling prompting, beat sheet template, Nano Banana prompts |
| `MODULE_C_SCREENWRITER.md` | Gate 3 | Audio rules, sync, script templates, mapping template |
| `MODULE_D_ENGINEER.md` | Execution | API reference, JSON assembly, queue management, chunking |
| `CHARACTER_LIBRARY.md` | Gate 1 | Archetypes, saved characters, design process |
| `SCENE_SETTINGS.md` | Gate 1 | Setting tables and selection rules |
| `TESTING-PLAN.md` | When validating | Component, integration, and quality test matrix |
