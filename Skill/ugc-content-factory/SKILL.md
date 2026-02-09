---
name: ugc-content-factory
description: "Director-First UGC content generation using Kling 3.0 (via fal.ai). Generates authentic AI characters, visuals, scripts, and videos through a 4-module pipeline with user approval gates. Triggers on: ugc, ugc video, ugc creator, testimonial video, user generated content."
---

# UGC Content Factory

Generate authentic-feeling UGC content at scale with consistent AI characters.

**Use this skill when:** You need UGC-style video content (testimonials, reviews, unboxings, demos) without hiring real creators.

**The unlock:** Kling 3.0's Elements system (via fal.ai) locks character identity across multiple videos. Combined with multi-shot storyboards and native lip-sync, you can generate an entire UGC library with consistent "creators."

---

## Director-First Pipeline

**Key principle:** Visuals before script. Design how each shot looks and moves FIRST, then write dialogue that fits. The script serves the visuals, not the other way around.

```
MODULE A: Creative Director    → Creative Brief        → GATE 1 (user approves)
                                                          │
MODULE B: Cinematographer      → Visual Beat Sheet      → GATE 2 (user approves)
                                                          │
MODULE C: Screenwriter         → Synchronized Script    → GATE 3 (user approves)
                                                          │
MODULE D: Engineer             → fal.ai JSON + Execute  → Output
```

**Variable durations:** Each shot can be 3s, 4s, or 5s. Hooks are punchy (3s), demos breathe (5s). Total must sum to target duration.

---

## Before You Start: Existing Assets Check

Before entering the pipeline, **ASK the user:**

1. "Do you have an **existing character** to reuse? (Provide Element image URL)"
2. "Do you have **product images** to use as Elements? (Provide image URL)"
3. "Do you have a **seed frame** / first-frame image? (Provide image URL)"

If yes → use those URLs in the pipeline. If no → new images will be generated with **Nano Banana Pro** via `/ai-image-generation`.

Check `references/CHARACTER_LIBRARY.md` for any previously saved characters/products.

---

## How to Execute

### Phase A: Creative Director

**Read** `references/MODULE_A_CREATIVE_DIRECTOR.md` before proceeding.

Also load for reference:
- `references/CHARACTER_LIBRARY.md` (character archetypes + saved characters)
- `references/SCENE_SETTINGS.md` (setting options)

**Tasks:**
1. Select content format (Testimonial, Unboxing, Problem/Solution, Comparison, Demo)
2. Choose hook angle (Gatekeep, Skeptic, Fail, Visual Shock)
3. Select character archetype and setting (or reuse saved character)
4. Run Stealth Validation (4 mandatory checks)
5. Present **Creative Brief** to user

**⛔ GATE 1:** Present Creative Brief. STOP. Wait for user approval before proceeding.

---

### Phase B: Cinematographer

**Read** `references/MODULE_B_CINEMATOGRAPHER.md` before proceeding.

**Tasks:**
1. Design shot-by-shot visual sequence (NO dialogue)
2. Assign variable durations (3s/4s/5s per shot)
3. Apply Kling prompt engineering (6 elements, 4 rules)
4. Verify scene variety (2-of-4 position/angle changes)
5. Generate seed images if using I2V workflow (**Nano Banana Pro** via `/ai-image-generation` — use Photorealistic Pre-Prompt)
6. Present **Visual Beat Sheet** to user

**⛔ GATE 2:** Present Visual Beat Sheet. STOP. Wait for user approval before proceeding.

---

### Phase C: Screenwriter

**Read** `references/MODULE_C_SCREENWRITER.md` before proceeding.

**Tasks:**
1. Calculate word budget per shot (~2.5 words/sec)
2. Write dialogue fitted to shot durations
3. Apply 4 Audio Rules (sync, cadence, room sound, bridge)
4. Map script to Beat Sheet (script-to-beat-sheet template)
5. Run script quality check
6. Present **Synchronized Script** to user

**⛔ GATE 3:** Present Synchronized Script. STOP. Wait for user approval before proceeding.

---

### Phase D: Engineer

**Read** `references/MODULE_D_ENGINEER.md` before proceeding.

**Tasks:**
1. Assemble Visual Beat Sheet + Script into `multi_prompt` JSON
2. Run compilation checklist
3. Submit to fal.ai (standard for test, pro for final)
4. Use queue endpoint for anything over 5 seconds
5. Present output with quality check

---

## Character Setup (One-Time)

Before first video with a new character:

1. Define persona brief (see CHARACTER_LIBRARY.md)
2. Generate 3-5 reference images via **Nano Banana Pro** (`/ai-image-generation`) — use Photorealistic Pre-Prompt from MODULE_B
3. Select best reference image(s)
4. Upload to fal.ai Kling 3.0 Elements
5. Save character to CHARACTER_LIBRARY.md "Saved Characters" section for reuse

---

## Integration with Other Skills

| Skill | Use For |
|-------|---------|
| `/ai-image-generation` | Character reference images via Nano Banana |
| `/ai-talking-head` | Fallback for single-shot videos |
| `/hooks` | Generate hook variations for A/B testing |
| `/direct-response-copy` | Script optimization for conversion |
| `/brand-voice` | Ensure scripts match client voice |

---

## The 80/20

80% of UGC success comes from:
1. **Right character** for target audience
2. **Specific, genuine-sounding script** (not marketing speak)
3. **Appropriate casual setting** (not studio)
4. **Strong hook** in first 2 seconds

Get these right and the rest is optimization.

---

## Quick Tips

**Do:**
- Lead with imperfection — slightly off framing, natural pauses, filler words
- Use specific details — "3 weeks" not "a while"
- Match character to audience demographic
- Keep it short — 15-30 seconds, not 60+

**Don't:**
- Over-polish — if it looks like an ad, it fails
- Use marketing language — "revolutionary" = instant scroll-past
- Skip the visual design phase — visuals drive everything
- Fight the shot durations — adapt the script to the visuals

---

## Module Reference Files

All detailed instructions are in `references/`:

| File | Content | Lines |
|------|---------|-------|
| `MODULE_A_CREATIVE_DIRECTOR.md` | Formats, hooks, stealth validation, creative brief | ~250 |
| `MODULE_B_CINEMATOGRAPHER.md` | Visual design, Kling prompting, beat sheet | ~300 |
| `MODULE_C_SCREENWRITER.md` | Audio rules, sync, script templates, mapping | ~250 |
| `MODULE_D_ENGINEER.md` | API reference, JSON assembly, queue management | ~200 |
| `CHARACTER_LIBRARY.md` | Archetypes, design process | ~100 |
| `SCENE_SETTINGS.md` | Setting tables and selection rules | ~50 |
