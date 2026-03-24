# Video Ad Generator

> 从产品信息生成完整视频广告，包含创意策划、概念图、分镜脚本、参考图和视频生成。

## Use Cases

- 用户说"帮我做个产品视频" "video ad" "视频广告" "做个短视频"
- 用户提供产品图片/信息，要求生成视频
- 用户提到 TikTok/Reels/抖音等短视频平台的视频内容
- 用户说"电商视频" "产品展示视频" "品牌广告片"
- 用户选择了之前生成的创意方案（如"选 A"、"用第二个方案"）

## Two-Stage Workflow

```
Stage 1: Creative Proposals + Concept Art
  Collect info → Generate 2-3 proposals (each with 1 mood concept image) → Return for user selection
  [End, wait for user choice]

Stage 2: Visual Anchors + Storyboard + Video Generation (triggered by user selection)
  Lock style → Generate visual anchor images → Generate storyboard → Generate video per shot → Summarize results
```

**Determine current stage**:
- Context has "user selected a proposal" (e.g. "pick A", "use proposal 2") → Enter Stage 2
- Otherwise → Enter Stage 1

---

## Stage 1: Creative Proposals + Concept Art

### Step 1: Collect Basic Information

Extract from user input or context:

| Info | Required | Description |
|------|----------|-------------|
| Product photo | Yes | For extracting appearance details and generating reference images |
| Product type | Yes | e.g. hair dryer, shampoo, earbuds |
| Appearance | Yes | Color, material, shape, dimensions (cm) |
| Core selling points | Yes | 3-5 key selling points |
| Target audience | Yes | Age, gender, region, identity |
| Creative ideas | No | User's initial concepts |

**If context already contains this info, use it directly — don't ask again.**

Also confirm video parameters (can ask all at once):

| Parameter | Common Options | Default |
|-----------|---------------|---------|
| Duration | 5s / 8s / 10s / 15s | 5s |
| Target platform | TikTok / Reels / 抖音 / YouTube / 小红书 | TikTok |
| Prompt language | English / 中文 | English |

**Video ratio is auto-derived from target platform** (see [Prompt Template](./video-ad-generator/prompt-template.md) platform-to-ratio mapping) — no need to ask separately.

### Step 2: Generate Creative Proposals

Read [Prompt Template](./video-ad-generator/prompt-template.md) for viral logic reference and video types.

Generate 2-3 differentiated creative proposals based on product characteristics and target audience. Each proposal includes:

1. **Video type**: Brand film / UGC review / Product showcase / Scenario story / Comparison-unboxing
2. **Viral logic**: Which hook (contrast / cost / curiosity / ...)
3. **Hook point**: How to grab attention in the first 3 seconds
4. **Emotional arc**: Emotion trajectory across the video
5. **Selling point strategy**: How each selling point is conveyed visually
6. **Scene/style**: Specific scene description, lighting, color direction
7. **Audio direction**: BGM style + key sound effects + voiceover/script outline

### Step 3: Generate Concept Art per Proposal

Use `kamay image generate-image` to generate **1 mood concept image** per creative proposal.

Concept image prompt requirements:
- Convey the core scene, color palette, lighting, and atmosphere of the proposal
- Include product's approximate position and presentation in the scene
- aspect_ratio matching the target platform
- Naming: `{product-name}-concept-{A/B/C}`

### Step 4: Output Creative Proposals (Stage 1 ends)

Present complete proposals + concept images to the user:

```markdown
## Creative Proposals

### Proposal A: [Video Type] — [One-line summary]
[Concept image]
- **Viral logic**: [Hook type]
- **Hook point**: [First 3 seconds description]
- **Emotional arc**: [Emotion changes]
- **Selling point strategy**: [Strategy description]
- **Scene/style**: [Specific description]
- **Audio design**: [Summary]

### Proposal B: ...
### Proposal C: ...

---
Please select a proposal (you can say "pick A", "use Proposal B", or mix elements from multiple proposals).
```

**Stage 1 ends here. Wait for user selection. Do NOT continue to subsequent steps.**

---

## Stage 2: Visual Anchors + Storyboard + Video Generation

When the user selects a proposal, enter Stage 2. **Do not ask the user further questions — execute straight through.**

### Step 5: Style Lock

Extract **Style Prefix** from the selected proposal's concept image and creative description — a set of style keywords used as prefix for all subsequent image and video prompts:

```
Style Prefix example:
"Warm golden hour lighting, soft bokeh background,
 minimal lifestyle aesthetic, sakura pink and white
 color palette, natural indoor setting, cinematic"
```

Style Prefix must include:
- Color palette
- Lighting style
- Overall aesthetic
- Mood/texture

### Step 6: Generate Visual Anchor Set

**This is the critical step for cross-shot visual consistency.**

Before writing the storyboard, determine which visual anchors are needed based on the creative proposal, then generate them with `kamay image generate-image`. All subsequent shots that involve these elements must reference the corresponding anchor images.

#### Anchor Types

| Anchor Type | When Needed | Description |
|-------------|-------------|-------------|
| Product anchor | Product appears in ≥2 shots | Product in target scene (not white-bg original); use product photo as reference_images |
| Character anchor | Person appears in ≥2 shots | Standard portrait defining appearance, clothing, hairstyle |
| Scene anchor | Multiple shots share the same space | Establishes spatial layout, lighting, prop positions |

#### Generation Rules

1. **Analyze creative proposal** to list required anchors (not all types are always needed)
   - Pure product showcase (no people) → Product anchor + Scene anchor only
   - UGC review / Scenario story → Character anchor + Product anchor + Scene anchor
   - Abstract brand film → Possibly Scene anchor only
2. **Product anchor** must use product photo as `reference_images` for appearance consistency
3. **Character anchor** must explicitly describe appearance features (skin tone, hairstyle, hair color, build, clothing) — all subsequent people-shots reuse this description verbatim
4. **Scene anchor** must specify spatial layout and key prop positions
5. All anchor prompts start with Style Prefix
6. Naming: `{product-name}-anchor-{product/character/scene}`

### Step 7: Generate Storyboard

Generate complete storyboard based on selected proposal. Reference [Prompt Template](./video-ad-generator/prompt-template.md) for time allocation.

**Shot count control (CRITICAL):**
- More shots = higher cross-shot consistency risk
- **5-8s video**: 2-3 shots recommended
- **10-15s video**: 3-4 shots recommended
- **Prefer fewer but longer shots** over fragmented short shots
- Each shot 3-5s recommended (video model comfort zone)

**Each shot must include:**

| Field | Description |
|-------|-------------|
| Time range | e.g. 0-3s |
| Framing/camera | Close-up/medium/wide + push/pull/pan/track/static |
| Scene description | Scene, character action, lighting, atmosphere |
| Product state | Product position in frame, scale relative to environment |
| Audio | Music + SFX + voiceover/dialogue |
| **Referenced anchors** | Which visual anchors this shot references (can be multiple or none) |
| **recommended_model** | Recommended video generation model (see model selection strategy) |

**Model selection strategy (recommended_model):**

| Scenario | Recommended Model | Image Usage |
|----------|------------------|-------------|
| Product close-up / high fidelity | Veo | subject_reference (product photo) + style_reference (anchor) |
| Person + product scene | Kling / Veo | Character/product anchor as image_start / reference |
| Pure atmosphere / camera move | Sora-2 / Kling | text-to-video (no anchor reference) |
| First-to-last frame transition | Veo / Seedance | first_frame + last_frame |
| No-face scene | Sora-2 | Anchor as reference (note: no face reference support) |

**Shot prompt rules (CRITICAL):**
- Each shot's video prompt: **≤800 English characters, ≤500 Chinese characters**
- Must start with Style Prefix
- Focus on: subject + action + camera + lighting
- Remove redundant modifiers; don't repeat info already in Style Prefix
- Audio description listed separately, not counted in video prompt length
- **People shots**: must reuse character anchor's appearance description verbatim in prompt

### Step 8: Generate Videos

**Generate video per shot, flow:**

```
For each Shot:
  1. Determine if a per-shot reference image is needed:
     → If shot references anchors AND scene differs significantly from anchor
       (different action, different composition),
       first generate shot reference image with kamay image generate-image,
       prompt = style_prefix + shot description, reference_images = related anchors
     → If shot is close enough to an anchor, use anchor directly
     → If shot references no anchors (pure atmosphere), do text-to-video directly
  2. Generate video using recommended_model via kamay video submit/wait
     → prompt = style_prefix + shot video prompt
     → image parameter: anchor image or shot reference image (see parameter mapping below)
  3. Poll with kamay video status until complete (or use kamay video wait)
```

**Video generation parameter mapping:**

Using **Veo**:
- `--subject-ref`: **Product original photo** (for product consistency)
- `--style-ref`: Product anchor or shot reference image (for style/scene control)
- `--ratio`: Note reference image forces 16:9
- `--duration`: subject_reference forces 8s

Using **Kling**:
- `--image`: Anchor or shot reference image (as start frame)
- `--ratio`: Based on platform
- `--sound on`: Based on audio design

Using **Sora-2**:
- `--image`: Anchor or shot reference image (max 1 image)
- `--duration`: 4/8/12s (pick closest)
- **No face reference support** — avoid for people-related shots

Using **Seedance**:
- Supports first frame + last frame transition mode (`--last-frame`)
- `--draft` mode for 480p preview first
- `--audio` for synced audio generation

### Step 9: Save Creative Document + Summarize Results

**1. Save creative document as Resource**

Use `save_resource` to save the complete creative document as Markdown.

**2. Reply to user (concise summary)**

```
Video ad generation complete ✅

| Shot | Time | Description | Model | Status |
|------|------|-------------|-------|--------|
| 1 | 0-3s | [one line] | Kling | ✅ |
| 2 | 3-8s | [one line] | Veo | ✅ |
| ...

Full creative document: [doc-name](mention://resource/xxx)

To adjust a specific shot, tell me the shot number and desired changes.
```

---

## References

- [Prompt Template](./video-ad-generator/prompt-template.md) — Viral logic table, audio design guide, time allocation, model constraints, platform-to-ratio mapping
- [Hair Dryer Example](./video-ad-generator/hair-dryer-example.md) — Complete hair dryer ad example (v5.1 visual anchor workflow)
