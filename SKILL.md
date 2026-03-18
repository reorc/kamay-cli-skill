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

- [Installation Guide](./references/INSTALL.md)
- **Commands**: [Amazon](./references/commands-amazon.md) | [Google](./references/commands-google.md) | [Meta](./references/commands-meta.md) | [TikTok](./references/commands-tiktok.md) | [Resource](./references/commands-resource.md) | [Image](./references/commands-image.md) | [Feedback](./references/commands-feedback.md)
- **Insights**: [Market Analyst](./references/market-analyst.md) | [Report to HTML](./references/report2html.md)
- **Creative**: [Creative Brief](./references/creative-brief.md) | [Mood Image Generator](./references/mood-image-generator.md) | [Ad Image Generator](./references/ad-image-generator.md) | [Ad Strategy Guides](./references/ad-image-generator/) (7 strategies)
- **Use Cases**: [Typical Use Cases](./references/use-cases.md)

## Troubleshooting

```bash
kamay auth status
kamay auth refresh
kamay auth login --email <email> --password <password>
```
