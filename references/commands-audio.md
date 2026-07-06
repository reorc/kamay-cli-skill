# Audio Module Commands

Generate audio assets from text prompts. The audio module currently includes prompt-based speech/audio-drama generation and async music generation commands discovered from Kamay Backend.

## Command Overview

| Command | Function |
|---------|----------|
| `generate-seed-audio-speech` | Generate speech, narration, or audio-drama voiceover with prompt-described sound effects |
| `generate-suno-music` | Generate music with Suno models |
| `get-audio-task` | Query Suno music generation task status |

Run live help before using less familiar commands:

```bash
kamay audio --help
kamay audio generate-seed-audio-speech --help
```

---

## generate-seed-audio-speech

Use Seed Audio when the user needs a spoken narration, voiceover, dubbing, poetry recital, or short audio-drama segment. The prompt can describe speaker style, emotion, pacing, background sound effects, and music cues.

This command is synchronous: it returns after generation finishes and the provider audio has been saved as a Kamay resource. No task polling is needed.

```bash
# Basic usage
kamay audio generate-seed-audio-speech \
  --input "A calm Mandarin male narrator reads: Hello, welcome to Kamay." \
  --name "welcome-voiceover"

# Audio-drama style prompt with sound effects
kamay audio generate-seed-audio-speech \
  --input "场景：唐代浔阳江头，秋夜送客。环境音：远处江水轻拍船舷，微风吹过荻花。旁白（中年男性，沉稳、低缓，带离别惆怅）朗读：浔阳江头夜送客，枫叶荻花秋瑟瑟。音效：句末出现两三声清冷的琵琶拨弦，随后淡出。" \
  --name "pipa-short-voiceover"
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `--input` | string | Yes | Speech generation prompt or audio-drama script. Maximum 3000 characters. |
| `--name` | string | No | Resource name. Leave empty to auto-generate from the provider audio ID. |
| `--estimated_duration_seconds` | integer | No | Optional duration estimate for credit preflight. Actual billing uses provider-reported duration. |
| `--client_request_id` | string | No | Optional idempotency key. Use only when retrying the exact same logical request. |

> Dynamic command flags keep schema underscores. Use `--estimated_duration_seconds` and `--client_request_id`, not hyphenated variants.

**Return Value:**

Successful generation returns a `mention://resource/...` URI and the generated duration. Download the audio locally with the resource command:

```bash
kamay audio generate-seed-audio-speech \
  --input "Narrator reads a short product intro in a warm, confident voice." \
  --name "product-intro"
# Returns: mention://resource/res_xxx and duration

kamay resource download -u "mention://resource/res_xxx" -o ./audio
```

## Prompting Guidance

- Keep one request within 3000 characters. Split long poems, scripts, or audiobooks into separate segments.
- Put the exact spoken text in the prompt and explicitly say that stage directions, speaker notes, and sound-effect descriptions should not be read aloud.
- Describe sound effects as background layers that support the voice, and specify when they should enter, fade, or pause.
- For poetry and narration, include speaker age, gender, accent, tone, pace, emotional arc, and desired pauses.
- For background music, describe style and intensity rather than asking for a separate music track. Keep voice clarity as the top priority.

## Billing Notes

- `--estimated_duration_seconds` is only a preflight estimate.
- Final billing is based on the actual generated audio duration returned by the provider.
- The generated audio is stored as a Kamay resource, so use `kamay resource download` for playback or post-processing.

## Related Commands

- [Resource Management](./commands-resource.md) - Download generated audio resources
- [Video Commands](./commands-video.md) - Generate videos that may include model-native audio
