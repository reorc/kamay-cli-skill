---
name: kamay-cli
description: Kamay CLI - Data-driven marketing analytics and creative tool. Data acquisition & analysis (Amazon, Google Trends, Meta Ads, TikTok), visual HTML report generation, ad image creation (7 strategies), mood/lifestyle image generation, and creative brief writing.
version: 0.2.0
---

# Kamay CLI User Guide

[Kamay](https://kamay.ai/) CLI is a professional command-line tool for data-driven marketing. It covers the full workflow from **data acquisition** to **market insight reports** to **creative asset generation**.

## Quick Start

```bash
kamay --help
kamay auth status
```

If kamay is not installed or your login has expired, follow the [Installation Guide](./references/INSTALL.md).

To check if a newer version is available, see [Upgrade Guide](#upgrade-guide) below.

Use `kamay <module> --help` and `kamay <module> <command> --help` to explore all available commands and parameters.

## Capabilities Overview

### 1. Multi-Platform Data Acquisition

| Module | Function |
|--------|----------|
| **amazon** | Product search, category trends, keyword research, review analysis |
| **google** | Google Trends search interest over time |
| **meta** | Meta (Facebook/Instagram) Ads Library search & detail |
| **tiktok** | TikTok video search, ads library, video comments |

For detailed command parameters, see:
- [Amazon Commands](./references/commands-amazon.md)
- [Google Trends Commands](./references/commands-google.md)
- [Meta Ads Commands](./references/commands-meta.md)
- [TikTok Commands](./references/commands-tiktok.md)

### 2. Market Insight & Visual Reports

Kamay can automatically analyze collected data and generate professional visual reports.

**Market Analyst** — AI-driven category research that transforms raw data into actionable insights:
- Category opportunity assessment, consumer demand analysis, competitive positioning
- VOC (Voice of Customer) analysis from product reviews
- Seasonality pattern recognition and pricing strategy insights
- Outputs structured reports with executive summaries, data tables, and action items

**Report to HTML** — Convert any analysis report into a professional, shareable HTML page:
- Responsive layout with data visualization charts (bar, line, pie, area, heatmap)
- Self-contained single-page HTML, no external dependencies
- Number formatting, color-coded trends (green ↑ / red ↓), hover interactions
- Suitable for team sharing, client presentation, and archiving

See: [Market Analyst](./references/market-analyst.md) | [Report to HTML](./references/report2html.md)

### 3. Creative Brief Generation

Transform market research into structured creative strategy documents:
- Synthesizes market insights, competitive analysis, and brand profile
- Outputs objective, target audience, core message, visual direction, channel strategy
- Supports iterative refinement based on feedback
- Bridges the gap between data analysis and creative production

See: [Creative Brief](./references/creative-brief.md)

### 4. Ad Image Generation (7 Strategies)

Generate professional ad creative images **with copy overlay** for actual ad placements:

| Strategy | Best For |
|----------|----------|
| Features-Benefits | Functional/tech products |
| Lifestyle | Fashion, lifestyle products |
| Announcement | New launches, limited editions |
| Testimonial | Products needing trust building |
| Problem-Solution | Products solving specific problems |
| Us-vs-Them | Products with clear competitive advantage |
| Transformation | Products with visible before/after results |

Supports channel-specific sizing (Instagram, Xiaohongshu, e-commerce main images, feed ads, etc.)

See: [Ad Image Generator](./references/ad-image-generator.md) | [7 Strategy Guides](./references/ad-image-generator/)

### 5. Mood Image Generation

Generate **text-free** lifestyle/mood images for brand visual exploration:
- Product scene photography with professional lighting and composition
- 4 variant types: scene, human, angle, lighting
- Suitable for e-commerce detail pages, social media content, creative concept validation

See: [Mood Image Generator](./references/mood-image-generator.md)

### Image Generation Tips

**Rate Limit Fallback**: If `kamay image generate-image` fails due to rate limiting, retry with the fallback model:
```bash
kamay image generate-image --prompt "..." --model seedream4.5
```
Inform the user that the fallback model is being used, as output quality may differ.

**Displaying Results**: After image generation, download the image and display it directly to the user:
```bash
kamay resource download -u "mention://xxx" -o ./images
# Then show the downloaded image file to the user
```

**Shareable Links**: After showing the image, ask the user if they would like a shareable resource link. The `mention://` URI returned by `generate-image` can be shared directly, or use `kamay resource list` to find and manage generated resources.

## Typical Workflows

### End-to-End: Data → Report → Creative

```
1. Collect data (amazon/google/meta/tiktok commands)
2. Generate market insight report (Market Analyst)
3. Convert report to visual HTML page (Report to HTML)
4. Create creative brief from insights (Creative Brief)
5. Generate ad images or mood images (Ad/Mood Image Generator)
```

### Quick Examples

**Competitor Analysis**:
```bash
kamay amazon search-products --q "wireless earbuds" --market US
kamay amazon get-product --asin B09V3KXJPB --market US
kamay amazon get-product-reviews --asin B09V3KXJPB --market US --start_date 2024-01-01
kamay amazon list-asin-keywords --asin B09V3KXJPB --market US
```

**Category Trend Analysis**:
```bash
kamay amazon search-category --name "Cell Phones" --market US
kamay amazon get-category-best-sellers --node_id 3743561 --market US
kamay amazon get-category-trend --node_id 3743561 --trend_types "sales_volume,avg_price,brand_count" --market US
```

**Ad Creative Research**:
```bash
kamay meta ads-search-ads --q "nike shoes" --country US
kamay tiktok search-ads --q "fitness app" --region DE
kamay tiktok search-videos --keyword "product review"
```

**Google Trends Validation**:
```bash
kamay google trends-get-interest-over-time --q "wireless earbuds" --geo US
```

For more workflow examples, see [Typical Use Cases](./references/use-cases.md).

## Common Parameters

**Amazon Marketplace Codes**: US, UK, DE, JP, CA, FR, ES, IT

**Date Format**: YYYY-MM-DD, e.g., `2024-01-01`

## Reference Documents

- [Installation Guide](./references/INSTALL.md) | [Upgrade Guide](#upgrade-guide)
- **Commands**: [Amazon](./references/commands-amazon.md) | [Google](./references/commands-google.md) | [Meta](./references/commands-meta.md) | [TikTok](./references/commands-tiktok.md) | [Resource](./references/commands-resource.md) | [Image](./references/commands-image.md) | [Feedback](./references/commands-feedback.md)
- **Insights**: [Market Analyst](./references/market-analyst.md) | [Report to HTML](./references/report2html.md)
- **Creative**: [Creative Brief](./references/creative-brief.md) | [Mood Image Generator](./references/mood-image-generator.md) | [Ad Image Generator](./references/ad-image-generator.md) | [Ad Strategy Guides](./references/ad-image-generator/) (7 strategies)
- **Use Cases**: [Typical Use Cases](./references/use-cases.md)

## Upgrade Guide

To check if a newer version of Kamay CLI is available:

**Step 1**: Get the current installed version:
```bash
kamay version
```

**Step 2**: Check the latest release version on GitHub:
```bash
curl -sI https://github.com/reorc/kamay-cli-skill/releases/latest | grep -i location | sed 's/.*tag\///' | tr -d '[:space:]'
```

**Step 3**: If the latest version is newer than the current version, ask the user whether to upgrade. If the user approves, run the one-click upgrade:
```bash
OS=$(uname -s | tr '[:upper:]' '[:lower:]'); ARCH=$(uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/'); curl -LO "https://github.com/reorc/kamay-cli-skill/releases/latest/download/kamay-${OS}-${ARCH}" && sudo install -m 755 "kamay-${OS}-${ARCH}" /usr/local/bin/kamay && rm "kamay-${OS}-${ARCH}" && kamay version
```

**Step 4**: Also update the skill reference docs. Check if the skill was installed via git clone or ZIP, then update accordingly:
```bash
# For Claude Code
SKILL_DIR=~/.claude/skills/kamay-cli
# For OpenCode, OpenClaw, and other general Agents
# SKILL_DIR=~/.agents/skills/kamay-cli

# If installed via git clone
if [ -d "$SKILL_DIR/.git" ]; then
  cd "$SKILL_DIR" && git pull
# If installed via ZIP download, re-download and replace
else
  curl -L https://github.com/reorc/kamay-cli-skill/archive/refs/heads/main.zip -o /tmp/kamay-cli.zip
  rm -rf "$SKILL_DIR"
  unzip /tmp/kamay-cli.zip -d "$(dirname "$SKILL_DIR")"
  mv "$(dirname "$SKILL_DIR")/kamay-cli-skill-main" "$SKILL_DIR"
  rm /tmp/kamay-cli.zip
fi
```

## Authentication

When the user needs to log in, offer three choices:

1. **Email/Password** — `kamay auth login --email <email> --password <password>`
2. **I have an API Key** — `kamay auth apikey --key <key>`
3. **Help me register a key** — Use `kamay auth device` to generate a browser link, wait for the user to authorize, then run `kamay auth device --poll` to complete (see [Installation Guide](./references/INSTALL.md#option-3-register-a-new-key-device-authorization)).

Check status anytime: `kamay auth status`

## Troubleshooting

```bash
kamay auth status
kamay auth refresh
```
