# Video Generation Commands

Generate videos using multiple AI models with a two-stage async workflow: **submit** (non-blocking) → **status/wait** (poll for result).

## Available Models

| Model | Provider | Duration | Key Features |
|-------|----------|----------|-------------|
| **seedance** | Volcengine Seedance 1.5 Pro | 4-12s | Audio sync, draft mode, last-frame chaining |
| **seedance2** | Volcengine Seedance 2.0 | 4-15s | Multi-ref images (1~4), ref video, ref audio |
| **sora2** | Sora-2 Preview | 4/8/12s | Reference image with resize modes |
| **kling** | Kling V3 | 3-15s | Start/end frame, sound control |
| **veo** | Veo 3.1 (Google) | 4/6/8s | Style/subject references, audio, negative prompt |

## Commands

### `kamay video submit` — Submit (non-blocking)

Submit a video generation task and return immediately with `task_id` and `provider`.

```bash
kamay video submit --model <model> --prompt "..." [flags]
```

**Common Flags:**

| Flag | Description |
|------|-------------|
| `--model` | Video model: seedance, sora2, kling, veo |
| `--prompt` | Text prompt for video generation |
| `--image` | Reference image (local path, URL, or `mention://` resource) |
| `--duration` | Video duration in seconds (model-dependent) |
| `--ratio` | Aspect ratio (e.g. 16:9, 9:16, 1:1) |
| `--json` | Output in JSON format |
| `--output` | Output directory for downloaded video (default: current directory) |

**Model-Specific Flags:**

| Flag | Models | Description |
|------|--------|-------------|
| `--resolution` | seedance, seedance2, sora2, veo | Resolution: 480p, 720p, 1080p |
| `--audio` | seedance, seedance2, veo | Generate synced audio (default: true) |
| `--draft` | seedance | Preview mode at 480p, lower cost |
| `--last-frame` | seedance, seedance2 | Return last frame for multi-shot chaining |
| `--watermark` | seedance, seedance2 | Add watermark to video |
| `--image2` | seedance2 | Additional reference image 2 (up to 4 total) |
| `--image3` | seedance2 | Additional reference image 3 |
| `--image4` | seedance2 | Additional reference image 4 |
| `--ref-video` | seedance2 | Reference video for style/motion |
| `--ref-audio` | seedance2 | Reference audio for background music |
| `--resize-mode` | sora2 | Resize mode for reference image |
| `--quality` | kling | Video quality: 720p, 1080p |
| `--sound` | kling | Sound: on, off (default: on) |
| `--image-end` | kling | End frame image |
| `--negative-prompt` | kling, veo | Negative prompt |
| `--last-frame-url` | veo | Last frame reference URL |
| `--style-ref` | veo | Style reference image URL |
| `--subject-ref` | veo | Subject reference image URL |

**Examples:**

```bash
# Text-to-video with Seedance
kamay video submit --model seedance --prompt "A cat playing piano in a jazz bar" --duration 8

# Image-to-video with local image
kamay video submit --model seedance --prompt "The product rotates slowly" --image ./product.jpg

# Image-to-video with mention:// resource
kamay video submit --model kling --prompt "Product showcase" --image "mention://resource/res_abc123"

# High-quality Kling video with sound
kamay video submit --model kling --prompt "Ocean waves at sunset" --quality 1080p --sound on

# Veo with style reference
kamay video submit --model veo --prompt "Urban landscape" --style-ref "https://example.com/style.jpg"

# Seedance 2.0 with multiple reference images
kamay video submit --model seedance2 --prompt "Product showcase with lifestyle scene" --image ./product.jpg --image2 ./scene.jpg --duration 8

# Seedance 2.0 with reference video
kamay video submit --model seedance2 --prompt "Similar motion and style" --ref-video ./reference.mp4
```

### `kamay video status` — Check Task Status

Query the current status of a submitted video generation task.

```bash
kamay video status --task-id <id> --provider <provider> [flags]
```

| Flag | Description |
|------|-------------|
| `--task-id` | Task ID returned by submit |
| `--provider` | Provider: seedance, evolink, veo |
| `--json` | Output in JSON format |
| `--output` | Output directory for downloaded video |

**Example:**

```bash
kamay video status --task-id "abc123" --provider seedance
```

### `kamay video wait` — Submit and Wait (blocking)

Combines submit + polling. Blocks until video is ready, failed, or timeout. Best for interactive terminal use.

```bash
kamay video wait --model <model> --prompt "..." [flags]
```

Accepts all the same flags as `submit`, plus:

| Flag | Default | Description |
|------|---------|-------------|
| `--poll-interval` | 15 | Seconds between status checks |
| `--max-polls` | 20 | Maximum number of status checks (~5 min total) |

**Examples:**

```bash
# Simple text-to-video, wait for result
kamay video wait --model seedance --prompt "A serene mountain lake at dawn" --duration 6

# Wait with custom polling
kamay video wait --model veo --prompt "City timelapse" --poll-interval 20 --max-polls 30
```

## Two-Stage Workflow

### For Agents (non-blocking)

Use `submit` + `status` for async operation:

```bash
# Stage 1: Submit and get task_id
kamay video submit --model seedance --prompt "..." --json
# Returns: {"task_id": "xxx", "provider": "seedance", ...}

# Stage 2: Check status later
kamay video status --task-id "xxx" --provider seedance --json
# Returns: {"status": "completed", "video_uri": "mention://...", ...}
```

**Async polling best practices:**
- Video generation typically takes **1-5 minutes**. Do NOT poll immediately after submit.
- **Wait 60 seconds** before the first status check.
- **Poll every 15-20 seconds** after the initial wait.
- **Stop after 10 polls** — if still not ready, inform the user with the task_id for manual follow-up.
- **Terminal states**: `COMPLETED`/`SUCCEEDED` (video auto-downloaded), `FAILED`/`EXPIRED`/`CANCELLED` (error).
- Do NOT use `kamay video wait` in agent context — it blocks the process and may timeout.

### For Terminal Users (blocking)

Use `wait` for a single-command experience:

```bash
kamay video wait --model seedance --prompt "A cat playing piano" --duration 8
# Shows spinner, polls automatically, downloads video when done
```

## Image Handling

The `--image` flag auto-detects input type:
- **Local file path** → uploads to Kamay resource, converts to `mention://` URI
- **Remote URL** → passed through directly
- **`mention://` URI** → used as-is

## Tips

- Use `--draft` with seedance for quick previews at lower cost before generating full quality
- Use `--last-frame` with seedance to chain multiple video shots together
- If `wait` times out, it prints the `task_id` so you can follow up with `status`
- The `--output` flag controls where the downloaded video file is saved
