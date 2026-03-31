# Image Module Commands

## Command Overview

| Command | Function |
|---------|----------|
| `generate-image` | AI image generation |
| `understand-image` | AI image understanding |

---

## generate-image

Use AI image generation model to generate images from text prompts.

```bash
# Basic usage
kamay image generate-image --prompt "A cute cat napping in the sunlight"

# Specify resolution and aspect ratio
kamay image generate-image \
  --prompt "Modern minimalist living room design" \
  --resolution "2K" \
  --aspect_ratio "16:9"

# Use reference images (local path or mention:// URI)
kamay image generate-image \
  --prompt "Convert this image to watercolor style" \
  --reference_images "./product.jpg"

# Use mention:// URI as reference
kamay image generate-image \
  --prompt "Convert this image to watercolor style" \
  --reference_images "mention://abc123"
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `--prompt` | string | Yes | Text prompt describing the image to generate |
| `--name` | string | No | Image name |
| `--aspect_ratio` | string | No | Aspect ratio (default: 1:1) |
| `--resolution` | string | No | Resolution (default: 1K) |
| `--reference_images` | string | No | Reference image (local file path or `mention://` URI) |

**Supported aspect ratios:**
- `1:1` - Square
- `16:9` - Landscape
- `9:16` - Portrait
- `4:3` - Traditional landscape
- `3:4` - Traditional portrait

**Supported resolutions:**
- `1K` - Standard resolution
- `2K` - HD resolution
- `4K` - Ultra HD resolution

**Return Value:**

After successful generation, returns resource URI (`mention://` format). Use `kamay resource download` to download locally:

```bash
# Generate image then download locally
kamay image generate-image --prompt "A cute cat" --name "cute-cat"
# Returns: mention://abc123

# Use resource download
kamay resource download -u "mention://abc123" -o ./images
```

---

## understand-image

Use Google Gemini vision model to analyze and understand images.

> **Important**: The `--image_paths` parameter requires `mention://` format resource URIs, local file paths are not supported.
> If you need to analyze local images, first upload using `kamay resource upload` to get the URI.

```bash
# Basic usage (using mention:// URI)
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "Describe the content of this image"

# Multi-image analysis (multiple URIs comma-separated)
kamay image understand-image \
  --image_paths "mention://abc123,mention://def456" \
  --prompt "Compare the similarities and differences between these two images"

# Specify output format
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "Extract data from the chart" \
  --output_format "json"

# Specify model
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "Identify and extract text from the document" \
  --model "gemini-2.0-flash"
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `--image_paths` | string | Yes | Image URI (mention:// format), multiple URIs comma-separated |
| `--prompt` | string | Yes | Analysis prompt describing what information to extract |
| `--model` | string | No | Model to use (optional) |
| `--output_format` | string | No | Output format (default: markdown) |

**Supported output formats:**
- `markdown` - Markdown format (default)
- `json` - JSON format
- `text` - Plain text format

---

## Image Handling

The `--reference_images` flag auto-detects input type:
- **Local file path** → uploads to Kamay resource, converts to `mention://` URI
- **`mention://` URI** → used as-is

## Image Workflow Examples

### Using Local Image as Reference

```bash
# Directly use local file as reference (auto-uploads internally)
kamay image generate-image \
  --prompt "A similar style photo, but sunset scene" \
  --reference_images "./photo.jpg"
# Returns: mention://def456

# Download generated image
kamay resource download -u "mention://def456" -o ./output
```

### Using mention:// URI as Reference

```bash
# 1. Upload local image to get URI
kamay resource upload -f ./photo.jpg -n "My Photo"
# Returns: mention://abc123

# 2. Use URI to analyze the image
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "Describe the content and main elements of this image"

# 3. Generate new image based on analysis
kamay image generate-image \
  --prompt "A similar style photo, but sunset scene" \
  --reference_images "mention://abc123"
# Returns: mention://def456

# 4. Download generated image
kamay resource download -u "mention://def456" -o ./output
```

## Related Commands

- [Resource Management](./commands-resource.md) - Upload/download resource files
