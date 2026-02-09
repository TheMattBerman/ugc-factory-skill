# Module C: Screenwriter

**Role:** Write dialogue and script that fits the approved Visual Beat Sheet. The script is written TO the visuals, not the other way around.

**Input:** Approved Visual Beat Sheet from Module B
**Output:** Synchronized Script (presented to user for approval at Gate 3)

---

## Director-First Principle

The Visual Beat Sheet is LOCKED. You are writing dialogue to fit existing shot durations and visual actions. Do not change shot durations or camera directions — adapt the words to the visuals.

---

## The 4 Audio Rules

### Rule 1: Synchronization (~2.5 words/sec)
Kling's lip-sync works best at natural conversational pace.

| Shot Duration | Word Budget | Example |
|---------------|-------------|---------|
| 3 seconds | 7-8 words | "Okay I have to tell you about this" |
| 4 seconds | 9-10 words | "I've been using it for three weeks and honestly" |
| 5 seconds | 12-13 words | "The difference is unreal, before I was struggling with this every day" |

**Critical:** Going over budget causes rushed delivery or audio desync. Going under leaves awkward dead air. Hit the word count.

### Rule 2: Authentic Cadence
Real UGC audio sounds like a person talking to their phone, not reading a script.

**Include:**
- Filler words: "honestly," "like," "okay so," "you guys"
- Self-corrections: "It's not— well, it IS but not like that"
- Casual interjections: "wait," "no but seriously," "I'm not kidding"
- Natural pauses (count as ~0.5 words in budget)

**Avoid:**
- Marketing jargon: "revolutionary," "game-changing," "best-in-class"
- Perfect grammar: nobody talks in complete sentences
- "Announcer voice" delivery cues
- Product name in every sentence

### Rule 3: Room Sound
Prompt additions for authentic audio when using `generate_audio: true`:
```
Natural conversational speech, casual room acoustics,
slight background ambience, authentic self-recorded quality,
not studio-produced, genuine casual delivery
```

### Rule 4: The Bridge
The moment the product is mentioned should feel inevitable, not forced.

**Good bridge:** "...and then my friend told me about [product] and I was like whatever, but I tried it and—"
**Bad bridge:** "That's why I use [product], the revolutionary new solution for—"

The product should arrive as a natural detail in the story, not a pivot point.

---

## Script Templates by Format

### Testimonial Script
```
Shot 1 (hook): "Okay I have to tell you about [product]"
Shot 2 (setup): "I've been using it for [time] and honestly?"
Shot 3 (payoff): "[Specific result]. Before this I was [struggle]"
Shot 4 (CTA): "If you [pain point], you need to try this"
```

### Unboxing Script
```
Shot 1 (reveal): "Look what just came in"
Shot 2 (reaction): "Oh wow, okay... [initial reaction]"
Shot 3 (thoughts): "First impressions? [quality/design comment]"
Shot 4 (anticipation): "I'll update you after I try it"
```

### Problem/Solution Script
```
Shot 1 (problem): "I used to struggle with [specific pain]"
Shot 2 (discovery): "Then I found [product]"
Shot 3 (transformation): "Now [specific positive result]"
Shot 4 (recommendation): "If you deal with [pain], try this"
```

### Comparison/Switch Script
```
Shot 1 (previous): "I used to use [competitor]"
Shot 2 (switch reason): "But then I switched because [trigger]"
Shot 3 (difference): "The difference is [specific improvement]"
Shot 4 (verdict): "Not going back"
```

### Demo/Tutorial Script
```
Shot 1 (hook): "Let me show you how I [use case]"
Shot 2 (demo): "You just [step 1], then [step 2]"
Shot 3 (result): "And then [outcome]"
Shot 4 (easy): "That's literally it"
```

---

## Script-to-Beat-Sheet Mapping

Take the Visual Beat Sheet and add dialogue. Each shot gets a `Script` field added:

```yaml
SYNCHRONIZED SCRIPT
═══════════════════════════════════════

Video: [Title]
Character: [from Beat Sheet]
Total Duration: [from Beat Sheet]

─────────────────────────────────────
SHOT 1: [Shot Name from Beat Sheet]
─────────────────────────────────────
  Duration: [from Beat Sheet — DO NOT CHANGE]
  Word Budget: [duration × 2.5 words]
  Script: "[exact dialogue, word count noted]"
  Word Count: [actual count] / [budget]
  Delivery Notes: [casual, excited, genuine, etc.]

─────────────────────────────────────
SHOT 2: [Shot Name from Beat Sheet]
─────────────────────────────────────
  Duration: [from Beat Sheet — DO NOT CHANGE]
  Word Budget: [duration × 2.5 words]
  Script: "[exact dialogue, word count noted]"
  Word Count: [actual count] / [budget]
  Delivery Notes: [casual, excited, genuine, etc.]

─────────────────────────────────────
SHOT 3: [Shot Name from Beat Sheet]
─────────────────────────────────────
  Duration: [from Beat Sheet — DO NOT CHANGE]
  Word Budget: [duration × 2.5 words]
  Script: "[exact dialogue, word count noted]"
  Word Count: [actual count] / [budget]
  Delivery Notes: [casual, excited, genuine, etc.]

─────────────────────────────────────
SHOT 4: [Shot Name from Beat Sheet]
─────────────────────────────────────
  Duration: [from Beat Sheet — DO NOT CHANGE]
  Word Budget: [duration × 2.5 words]
  Script: "[exact dialogue, word count noted]"
  Word Count: [actual count] / [budget]
  Delivery Notes: [casual, excited, genuine, etc.]

─────────────────────────────────────
SCRIPT QUALITY CHECK
─────────────────────────────────────
  [ ] Hook grabs attention in first 2 seconds
  [ ] Specific details used (not generic praise)
  [ ] Natural language (not marketing speak)
  [ ] Clear CTA at end
  [ ] Word counts within budget for all shots
  [ ] Includes at least one filler word or self-correction
  [ ] Product bridge feels natural, not forced
  [ ] Script works with the visual actions (not fighting them)

─────────────────────────────────────
FULL SCRIPT (CONTINUOUS)
─────────────────────────────────────
  "[Complete script as one paragraph for review]"

  Total Word Count: [X] words
  At ~2.5 words/sec = [Y] seconds of speech
  Video Duration: [Z] seconds
  Sync Check: [PASS/FAIL]

═══════════════════════════════════════
```

---

## What Makes UGC Scripts Believable

1. **Specificity** — "I've been using this for 3 weeks" not "I love this product"
2. **Casual language** — "Honestly?" "Okay so" "You guys"
3. **Imperfect delivery** — Natural pauses, filler words, self-corrections
4. **Genuine reactions** — Not always positive, natural emotional arc
5. **Conversational rhythm** — Sounds like telling a friend, not presenting

## Common Script Mistakes

1. **Too polished** — Reads like copy, not conversation
2. **Generic praise** — "This product is amazing" (no one talks like this)
3. **Over-mentioning product** — Name once or twice max
4. **Marketing voice** — "Revolutionary," "game-changing" = instant scroll-past
5. **Too long** — UGC scripts should be tight. 15 seconds = ~37 words total.

**⛔ STOP — GATE 3:** Present the Synchronized Script to the user. Do NOT proceed to Module D until the user approves the script.
