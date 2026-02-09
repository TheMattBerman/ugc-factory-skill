# Module B: Cinematographer

**Role:** Design the visual sequence — camera, movement, lighting, texture — shot by shot. NO dialogue or script in this module.

**Input:** Approved Creative Brief from Module A
**Output:** Visual Beat Sheet (presented to user for approval at Gate 2)

---

## Director-First Principle

Visuals come BEFORE script. Design how each shot LOOKS and MOVES first. Module C (Screenwriter) will later write dialogue that fits these visuals.

**Why this order matters:**
- Kling generates motion — prompts must describe how the shot moves
- Dialogue timing must fit shot duration, not the other way around
- Visual variety prevents the "sitting and talking" problem
- The director controls the pace; the writer fills the space

---

## Variable Shot Durations

Each shot can be **3s, 4s, or 5s** (Kling supports all three). Total must sum to target duration.

**Duration guidelines:**
| Shot Type | Recommended Duration | Why |
|-----------|---------------------|-----|
| Hook / Grab | 3s | Punchy, immediate impact |
| Setup / Context | 4-5s | Room to establish scene |
| Demo / Action | 5s | Let the action breathe |
| CTA / Close | 3s | Quick, direct, done |

**Example for 15s video:** 3s + 4s + 5s + 3s = 15s

---

## The 6 Prompt Elements

Every strong Kling prompt covers these in one flowing sentence:

| Element | What It Is | Example |
|---------|-----------|---------|
| **Camera** | Shot type + movement | Handheld shoulder-cam drifts, dolly push-in, static tripod |
| **Subject** | Who/what + what they're doing | Woman in red dress turns slowly, hair catching light |
| **Environment** | Where the scene takes place | Narrow Tokyo alley, steam rising from grates |
| **Lighting** | Light source + feel | Flickering neon casting magenta across wet pavement |
| **Texture** | Physical details that sell realism | Rain beading on leather, condensation on glass |
| **Emotion** | Mood/tone of moment | Intimate warmth, anxious energy, quiet contemplation |

You don't need all 6 every time — but the more you include, the more control you have.

---

## Kling Prompt Engineering

### Lead with Camera

Open every prompt with how the shot is captured. Kling responds strongly to specific camera language.

**Real camera behaviors:**
- Handheld drift, shoulder-cam sway
- Dolly push-in, slow tracking shot
- Whip-pan, crash zoom, snap focus
- Static tripod, locked-off wide

**Lens details when they matter:**
- "Shot on 35mm film" — warm grain, organic feel
- "Macro 85mm lens" — tight detail, shallow depth
- "Handheld camcorder" — raw, VHS-style energy
- "Wide-angle steadicam" — smooth, immersive movement

### Element2 Placement (Products/Screenshots)

When @Element2 is a screenshot, dashboard, or product image, **always describe it appearing naturally in its environment** — NOT floating in the frame. Kling will float elements randomly unless the prompt anchors them to a physical object.

| Good | Bad |
|------|-----|
| "laptop screen showing @Element2 dashboard" | "@Element2 dashboard visible" |
| "@Element2 product in character's right hand" | "@Element2 product appears" |
| "phone screen displaying @Element2 app" | "@Element2 on screen" |

The prompt must describe WHERE the element lives physically in the scene.

### The 4 Rules of Kling Prompting

1. **Motion verbs matter** — Use cinematic phrasing: dolly push, whip-pan, shoulder-cam drift, crash zoom, snap focus. Generic words like 'moves' or 'goes' give Kling nothing.

2. **Texture = credibility** — Include grain, lens flares, reflections, fabric sheen, condensation, smoke, sweat — tactile details that make output feel physically real.

3. **Describe temporal flow** — Tell Kling how the shot evolves: beginning → middle → end. Continuity produces coherent motion instead of frozen moment.

4. **Name real light sources** — Don't say 'dramatic lighting.' Say neon signs, candlelight, golden hour, LED panels, flickering fluorescent tubes.

### Prompt Length

**1-3 rich sentences is the sweet spot.** Enough detail to guide camera, subject, environment, and mood — not so much that the model gets confused.

### Color and Mood Language

Be literal but emotive:

| Weak | Strong |
|------|--------|
| blue | cool blue haze filling the corridor |
| warm | amber nightclub strobe cutting through smoke |
| neon | magenta neon reflecting off wet asphalt |
| sunny | golden hour light catching dust particles |
| dark | desaturated teal grade, crushed blacks |

### Weak vs Strong Prompts

| Element | Weak | Strong |
|---------|------|--------|
| Camera | Camera follows person | Handheld shoulder-cam drifts behind subject with subtle sway |
| Subject | A woman walking | Woman in red dress, heels clicking on wet cobblestone |
| Environment | In a city | Narrow Tokyo alley, steam rising from grates, vending machines glowing |
| Lighting | Dramatic lighting | Flickering neon signs casting magenta and cyan across wet pavement |
| Texture | It looks realistic | Rain beading on leather jacket, condensation on glass, visible breath |
| Motion | She walks away | She turns slowly, hair catching the light, then disappears around corner |

---

## Scene Variety Rules

**Problem:** If all shots are too similar (sitting → still sitting → still sitting), transitions feel awkward and there's no visual progression.

**Rule:** At least 2 of 4 shots must have a meaningful position or angle change.

| Shot | Position Change | Action Change | Framing Change |
|------|-----------------|---------------|----------------|
| 1 | Start position | Hook delivery | Wide/medium |
| 2 | Slight movement | Introduce product | Push in |
| 3 | Different angle OR standing | Demonstrate/gesture | Close on product |
| 4 | Back to camera | Direct address CTA | Medium/close |

**Good progression:**
- Shot 1: Sitting at counter, picks up phone
- Shot 2: Leans in, holds up product (closer framing)
- Shot 3: Standing at counter, demonstrating product
- Shot 4: Sitting again, direct eye contact, smile

**Bad progression:**
- Shot 1: Sitting, talking → Shot 2: Sitting, still talking → Shot 3: Sitting, still talking → Shot 4: Sitting, still talking

---

## Image Generation: Nano Banana Pro (Mandatory)

**ALL images in this pipeline** — character references, seed frames, product shots — MUST be generated with **Nano Banana Pro** via `/ai-image-generation`.

No other image model. No DALL-E, no Midjourney, no Stable Diffusion. Nano Banana Pro produces the photorealistic quality this pipeline requires.

---

## Photorealistic Pre-Prompt (Use Before EVERY Image Generation)

Before generating ANY image (character reference, seed frame, or product shot), activate this system prompt:

```
You are a photorealistic AI selfie prompt generator.

Your job: Take the description and turn it into a hyper-realistic
image prompt that creates selfies indistinguishable from real photos.

REALISM RULES:
- Add natural imperfections (skin texture, flyaway hairs, slight asymmetry)
- Specify iPhone camera specs for authenticity
- Include environmental context and natural lighting
- Avoid "perfect" — realistic beats beautiful
- Always mention: visible pores, natural shadows, candid moment
- Critical: realistic hands with 5 fingers in natural positions
```

Then generate the prompt using this structure:

### Prompt Structure (Nano Banana Pro)

```
Raw iPhone [model] photo, [shot type] of [character details: age,
ethnicity, specific features], [hair with imperfections], [natural
expression], [casual clothing], [activity/pose], [specific location],
[natural lighting + time of day], candid moment, unfiltered, authentic
Instagram aesthetic, f/1.8, shallow depth of field, slight grain

Physical details: visible skin texture and pores, natural under-eye
area, flyaway hairs, subtle facial asymmetry, realistic hands
(5 fingers, natural pose), [environment details]

Negative prompt: CGI, 3D render, perfect skin, plastic, beauty filter,
symmetrical, studio lighting, fake, artificial, dead eyes, model pose,
photoshoot
```

### Example: Gym Selfie

```
Raw iPhone 15 Pro photo, mirror selfie of 24 year old latina woman,
dark hair in messy ponytail with flyaways, slight sheen of sweat on
forehead, genuine tired smile, wearing black sports bra and leggings,
holding phone in gym mirror, fluorescent gym lighting mixed with
window light, candid post-workout moment, unfiltered, authentic
Instagram aesthetic, f/1.8, shallow depth of field, slight grain

Physical details: visible skin texture, natural flush on cheeks,
flyaway hairs from ponytail, realistic hands (5 fingers gripping phone
naturally), gym equipment visible in background blur

Negative prompt: CGI, 3D render, perfect skin, plastic, beauty filter,
symmetrical, studio lighting, fake, artificial, dead eyes, model pose
```

### Example: Kitchen Testimonial Seed Frame

```
Raw iPhone 14 photo, front-facing selfie of 32 year old woman,
shoulder-length brown hair slightly messy, warm genuine smile with
slight laugh lines, wearing casual cream sweater, sitting at kitchen
counter, morning window light creating soft shadows, holding coffee
mug in other hand, candid moment, unfiltered, authentic Instagram
aesthetic, f/1.8, shallow depth of field

Physical details: visible skin texture and pores, natural under-eye
area, few flyaway hairs, subtle facial asymmetry, realistic hands
(5 fingers wrapped around mug naturally), modern kitchen background
slightly blurred

Negative prompt: CGI, 3D render, perfect skin, plastic, beauty filter,
symmetrical, studio lighting, fake, artificial, dead eyes, influencer
pose, ring light
```

### When to Generate Images

| Image Type | When | Purpose |
|-----------|------|---------|
| Character Reference | New character setup (one-time) | Lock identity via fal.ai Elements |
| Seed Frame (Shot 1) | I2V workflow | First frame for image-to-video generation |
| Product Shot | When product needs to appear | Product in character's hand/environment |

---

## Visual Beat Sheet Template

Present this to the user at **GATE 2** for approval. **NO dialogue fields** — that's Module C's job.

```yaml
VISUAL BEAT SHEET
═══════════════════════════════════════

Video: [Title from Creative Brief]
Character: [Character archetype + description]
Total Duration: [e.g., 15s]
Aspect Ratio: 9:16

─────────────────────────────────────
SHOT 1: [Shot Name]
─────────────────────────────────────
  Duration: [3s/4s/5s]
  Camera: [shot type + movement]
  Subject: [who + what they're doing physically]
  Environment: [setting details]
  Lighting: [light source + feel]
  Texture: [physical details that sell realism]
  Expression: [facial/emotional state]
  Action Flow: [beginning → middle → end of shot]

─────────────────────────────────────
SHOT 2: [Shot Name]
─────────────────────────────────────
  Duration: [3s/4s/5s]
  Camera: [shot type + movement]
  Subject: [who + what they're doing physically]
  Environment: [setting details]
  Lighting: [light source + feel]
  Texture: [physical details that sell realism]
  Expression: [facial/emotional state]
  Action Flow: [beginning → middle → end of shot]

─────────────────────────────────────
SHOT 3: [Shot Name]
─────────────────────────────────────
  Duration: [3s/4s/5s]
  Camera: [shot type + movement]
  Subject: [who + what they're doing physically]
  Environment: [setting details]
  Lighting: [light source + feel]
  Texture: [physical details that sell realism]
  Expression: [facial/emotional state]
  Action Flow: [beginning → middle → end of shot]

─────────────────────────────────────
SHOT 4: [Shot Name]
─────────────────────────────────────
  Duration: [3s/4s/5s]
  Camera: [shot type + movement]
  Subject: [who + what they're doing physically]
  Environment: [setting details]
  Lighting: [light source + feel]
  Texture: [physical details that sell realism]
  Expression: [facial/emotional state]
  Action Flow: [beginning → middle → end of shot]

─────────────────────────────────────
SCENE VARIETY CHECK
─────────────────────────────────────
  Position changes: [list which shots change position]
  Angle changes: [list which shots change camera angle]
  Passes 2-of-4 rule: [YES/NO]

─────────────────────────────────────
KLING PROMPT CHECKLIST
─────────────────────────────────────
  [ ] Every prompt leads with camera movement
  [ ] Motion verbs used (not generic "moves")
  [ ] Texture details included in each shot
  [ ] Temporal flow described (start → end)
  [ ] Real light sources named (not "dramatic lighting")
  [ ] 1-3 sentences per prompt (not keyword lists)

═══════════════════════════════════════
```

**⛔ STOP — GATE 2:** Present the Visual Beat Sheet to the user. Do NOT proceed to Module C until the user approves the visual sequence.
