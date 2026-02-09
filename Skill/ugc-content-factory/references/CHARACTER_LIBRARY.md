# Character Library

Reference library of UGC character archetypes and the design process for creating new ones.

---

## Character Archetypes

### For B2C / Consumer Products

| Archetype | Demo | Setting | Energy | Best For |
|-----------|------|---------|--------|----------|
| **Relatable Millennial** | 28-35, casual | Home, kitchen, bedroom | Warm, genuine | Lifestyle, wellness, beauty |
| **Busy Professional** | 30-45, polished casual | Home office, commute | Efficient, practical | Productivity, tech, services |
| **Energetic Gen-Z** | 20-28, trendy | Ring light, bedroom | High, enthusiastic | Fashion, beauty, social apps |
| **Wellness Mom** | 32-42, put-together | Kitchen, family room | Caring, knowledgeable | Health, family, home |
| **Fitness Enthusiast** | 25-40, athletic | Gym, outdoor, kitchen | Motivated, credible | Fitness, supplements, activewear |

### For B2B / Professional Products

| Archetype | Demo | Setting | Energy | Best For |
|-----------|------|---------|--------|----------|
| **Startup Founder** | 28-40, smart casual | Modern office, home office | Driven, authentic | SaaS, tools, services |
| **Marketing Manager** | 28-40, professional casual | Office, conference room | Knowledgeable, relatable | Marketing tools, agencies |
| **Remote Worker** | 25-40, comfortable | Home office, coworking | Practical, genuine | Productivity, remote tools |

---

## Character Design Process

### Step 1: Define Persona

```yaml
CHARACTER BRIEF:

Demographics:
  age_range: "28-35"
  gender: "female"
  ethnicity: "diverse/mixed"

Appearance:
  style: "casual but put-together"
  hair: "medium length, natural"
  vibe: "approachable, real person"

Personality:
  energy: "warm and genuine, not over-the-top"
  speaking_style: "conversational, uses 'honestly' and 'okay so'"
  credibility: "comes across as real customer, not influencer"

Context:
  typical_setting: "bright apartment, natural light"
  wardrobe: "casual basics, no logos"
  props: "product in hand, phone, coffee"
```

### Step 2: Generate Reference Images (Nano Banana Pro)

**Use Nano Banana Pro via `/ai-image-generation`** — no other model. Follow the Photorealistic Pre-Prompt in MODULE_B before generating.

Generate 3-5 reference images. Select best for character consistency.

### Step 3: Lock in fal.ai Elements

Upload selected reference image(s) to fal.ai's Elements endpoint to create character identity lock. This maintains visual consistency across all generated videos.

---

## Choosing a Character

**Match to target audience:**
1. Same demographic as ideal customer (or slightly aspirational)
2. Setting matches where customer would naturally use product
3. Energy level matches brand tone
4. Wardrobe/style signals credibility for the category

**Rule of thumb:** The character should look like someone the target customer follows on social media — relatable, not aspirational celebrity.

---

## Saved Characters & Elements

Before creating new characters or generating new images, **ASK the user** if they have existing assets to reuse.

### Questions to Ask

1. "Do you have an existing character/creator you'd like to reuse? If so, provide the **Element image URL(s)**."
2. "Do you have product images to use as Elements? If so, provide the **product image URL(s)**."
3. "Do you have a preferred seed frame or first-frame image? If so, provide the **image URL**."

### Storing Saved Characters

When a character is approved and locked in fal.ai, record it here for reuse:

```yaml
SAVED CHARACTERS:
# Add approved characters below. Reference by name in future briefs.

# - name: "Kitchen Sarah"
#   archetype: Relatable Millennial
#   element_url: "https://..."
#   reference_images:
#     - "https://..."
#   notes: "Best for wellness, beauty, kitchen testimonials"

# - name: "Gym Alex"
#   archetype: Fitness Enthusiast
#   element_url: "https://..."
#   reference_images:
#     - "https://..."
#   notes: "Best for supplements, activewear, fitness demos"
```

### Storing Saved Product Elements

When a product image is used as an Element, record it here:

```yaml
SAVED PRODUCTS:
# Add product element images below. Reference by name in future briefs.

# - name: "WhiteSmile Kit"
#   element_url: "https://..."
#   notes: "Teeth whitening kit — box and device"

# - name: "GlowSerum Bottle"
#   element_url: "https://..."
#   notes: "Skincare serum — dropper bottle, amber glass"
```

### How Elements Are Used in Generation

Reference saved characters/products in Kling prompts:
- `@Element1` = character (frontal face reference)
- `@Element2` = product (if locked as second element)

```json
{
  "elements": [
    {
      "frontal_image_url": "[character element_url]",
      "reference_images": ["[character reference_images]"]
    },
    {
      "frontal_image_url": "[product element_url]"
    }
  ]
}
```
