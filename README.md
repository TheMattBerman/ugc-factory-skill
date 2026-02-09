# UGC Content Factory

**Director-first UGC content generation** using Kling 3.0 (via [fal.ai](https://fal.ai)). Generate authentic-feeling AI character videos—testimonials, unboxings, demos—through a 4-module pipeline with approval gates. No real creators required.

By **Matthew Berman** — [@themattberman](https://x.com/themattberman) · [Big Players](https://bigplayers.co) · [Emerald Digital](https://emerald.digital)

---

## What It Does

- **Creative Director** → Brief (format, hook, character, setting)
- **Cinematographer** → Visual beat sheet (shot-by-shot, no dialogue yet)
- **Screenwriter** → Script synced to shot durations
- **Engineer** → fal.ai JSON + execution → video

**Principle:** Visuals before script. Design how each shot looks and moves first, then write dialogue that fits. The script serves the visuals.

Kling 3.0’s **Elements** system locks character identity across videos, so you can build a consistent “creator” library.

---

## Requirements

- **fal.ai** — Kling 3.0 video generation. Get an API key at [fal.ai](https://fal.ai).
- **Optional:** An image model (e.g. for character reference images). The skill references “Nano Banana Pro” via an `/ai-image-generation` skill if you have one; you can also supply your own reference image URLs.

**Credentials:** This repo contains no API keys or secrets. You supply a fal.ai key via the `FAL_KEY` environment variable only. `.env` is gitignored; use `.env.example` as a template. Do not commit keys or `.env`.

---

## Installation

### 1. Clone the repo

```bash
git clone https://github.com/themattberman/ugc-content-factory.git
cd ugc-content-factory
```

### 2. Install the skill (Cursor / Claude Code)

Copy the skill folder into your AI assistant’s skills directory so the skill is available by name (e.g. “ugc content factory” or “ugc-content-factory”):

- **Cursor:** e.g. `~/.cursor/skills/` or your project’s skills path — copy the entire `Skill/ugc-content-factory` folder (including `references/` and `SKILL.md`).
- **Claude Code / Codex:** e.g. `~/.claude/skills/` — same: copy `Skill/ugc-content-factory` so that `SKILL.md` and `references/` sit inside one `ugc-content-factory` (or `ugc_content_factory`) folder.

Exact paths depend on your setup; the important part is that the skill’s `SKILL.md` and `references/` directory are together and recognized by your tool.

### 3. Set your API key

```bash
# Option A: export in shell (e.g. add to ~/.zshrc or ~/.bashrc)
export FAL_KEY="your-fal-ai-api-key"

# Option B: copy .env.example to .env, add your FAL_KEY, then load .env in your shell
cp .env.example .env
```

Get your key from [fal.ai](https://fal.ai) (dashboard or API settings).

### 4. (Optional) Test fal.ai

From the repo root, with `FAL_KEY` set:

```bash
cd Skill/ugc-content-factory
./test-fal-api.sh
```

Requires `curl` and `jq`. The script runs a simple text-to-video call to confirm your key and endpoint work.

---

## Usage

Invoke the skill with phrases like:

- **ugc** / **ugc video** / **ugc creator**
- **testimonial video** / **user generated content**

The skill will:

1. Ask whether you have existing assets (character image URL, product images, seed frame).
2. Run **Module A (Creative Director)** and present a Creative Brief → **Gate 1** (you approve).
3. Run **Module B (Cinematographer)** and present a Visual Beat Sheet → **Gate 2** (you approve).
4. Run **Module C (Screenwriter)** and present a Synchronized Script → **Gate 3** (you approve).
5. Run **Module D (Engineer)** to build fal.ai payloads and execute generation.

Reference docs live in `Skill/ugc-content-factory/references/` (e.g. `MODULE_A_CREATIVE_DIRECTOR.md` through `MODULE_D_ENGINEER.md`, plus `CHARACTER_LIBRARY.md` and `SCENE_SETTINGS.md`). The skill instructs the AI to read these when running each phase.

---

## Repo Layout

```
ugc-content-factory/
├── README.md
├── LICENSE
├── .gitignore
├── .env.example
└── Skill/
    └── ugc-content-factory/
        ├── SKILL.md              # Main skill definition and pipeline
        ├── test-fal-api.sh       # Optional: test fal.ai connection
        ├── TESTING-PLAN.md       # Testing checklist for the pipeline
        └── references/
            ├── MODULE_A_CREATIVE_DIRECTOR.md
            ├── MODULE_B_CINEMATOGRAPHER.md
            ├── MODULE_C_SCREENWRITER.md
            ├── MODULE_D_ENGINEER.md
            ├── CHARACTER_LIBRARY.md
            └── SCENE_SETTINGS.md
```

---

## Author & Links

- **Matthew Berman** — [@themattberman](https://x.com/themattberman)
- **Big Players** — [bigplayers.co](https://bigplayers.co) — data-driven growth tactics and AI for scaling
- **Emerald Digital** — [emerald.digital](https://emerald.digital) — growth and creative agency

---

## License

MIT. See [LICENSE](LICENSE).
