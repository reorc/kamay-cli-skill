---
name: kamay-cli
description: Kamay CLI User Guide - Data-driven marketing analytics tool. Supports data acquisition and analysis for Amazon, Google Trends, Meta Ads, TikTok, and other platforms.
version: 0.1.0
---

# Kamay CLI User Guide

[Kamay](https://kamay.ai/) CLI is a professional command-line tool for data-driven marketing, helping users discover market insights, analyze competitors, and research advertising creatives.

## Core Modules

| Module | Function |
|--------|----------|
| **amazon** | E-commerce data analysis: product search, category trends, keyword research, review analysis |
| **google** | Google Trends search trend analysis |
| **meta** | Meta (Facebook/Instagram) Ads Library analysis |
| **tiktok** | TikTok video and ad analysis |

## Quick Start

### Prerequisites

```bash
kamay --help
kamay auth status
```

If the kamay program is not installed on your system, or if you are not logged in / your login has expired, read and follow the [./references/INSTALL.md](./references/INSTALL.md) document to complete installation and configuration.

## Amazon Module

### Product Commands

| Command | Function |
|---------|----------|
| `search-products` | Search products by keyword |
| `get-product` | Get product details (ASIN) |
| `get-product-reviews` | Get product reviews |

### Category Commands

| Command | Function |
|---------|----------|
| `search-category` | Search categories, get Node ID |
| `get-category-best-sellers` | Get category bestsellers Top 100 |
| `get-category-trend` | Get category trend data |

### Keyword Commands

| Command | Function |
|---------|----------|
| `get-keyword-overview` | Get keyword overview |
| `get-keyword-trends` | Get keyword search trends |
| `expand-keywords` | Expand related keywords |
| `list-asin-keywords` | Get ASIN related keywords |
| `query-aba-keywords` | Query ABA trending keywords |

## Google Module

| Command | Function |
|---------|----------|
| `trends-get-interest-over-time` | Get Google Trends search trends |

## Meta Module

| Command | Function |
|---------|----------|
| `ads-search-ads` | Search Meta Ads Library |
| `ads-get-ad-detail` | Get ad details |

## TikTok Module

| Command | Function |
|---------|----------|
| `search-videos` | Search videos |
| `search-ads` | Search TikTok Ads Library |
| `list-comments` | Get video comments |

## Typical Workflows

### Competitor Analysis

```bash
# Search products to get ASIN
kamay amazon search-products --q "wireless earbuds" --market US

# Get product details
kamay amazon get-product --asin B09V3KXJPB --market US

# Get reviews
kamay amazon get-product-reviews --asin B09V3KXJPB --market US --start_date 2024-01-01

# Get keywords
kamay amazon list-asin-keywords --asin B09V3KXJPB --market US
```

### Category Trend Analysis

```bash
# Search category to get Node ID
kamay amazon search-category --name "Cell Phones" --market US

# Get bestsellers
kamay amazon get-category-best-sellers --node_id 3743561 --market US

# Get trends (multiple metrics)
kamay amazon get-category-trend --node_id 3743561 --trend_types "sales_volume,avg_price,brand_count" --market US
```

### Keyword Research

```bash
# Keyword overview
kamay amazon get-keyword-overview --keyword "wireless earbuds" --market US

# Expand keywords
kamay amazon expand-keywords --keyword "headphones" --market US

# Trend comparison
kamay amazon get-keyword-trends --keywords "wireless earbuds,airpods" --market US

# ABA trending keywords
kamay amazon query-aba-keywords --market US --node_ids 12557637011
```

### Ad Creative Analysis

```bash
# Meta ads
kamay meta ads-search-ads --q "nike shoes" --country US

# TikTok ads
kamay tiktok search-ads --q "fitness app" --region DE

# TikTok popular videos
kamay tiktok search-videos --keyword "product review"
```

### Google Trends Validation

```bash
kamay google trends-get-interest-over-time --q "wireless earbuds" --geo US
```

## Common Parameters

### Amazon Marketplace Codes

US, UK, DE, JP, CA, FR, ES, IT

### Date Format

YYYY-MM-DD, e.g., `2024-01-01`

## Reference Documents

### English Documentation

- [Installation Guide ./references/INSTALL.md](./references/INSTALL.md)
- [Amazon Module ./references/amazon-commands.md](./references/amazon-commands.md)
- [Google Module ./references/google-commands.md](./references/google-commands.md)
- [Meta Module ./references/meta-commands.md](./references/meta-commands.md)
- [TikTok Module ./references/tiktok-commands.md](./references/tiktok-commands.md)
- [Workflow Examples ./references/workflow-examples.md](./references/workflow-examples.md)

### 中文文档 (Chinese Documentation)

- [安装手册 ./references-cn/INSTALL.md](./references-cn/INSTALL.md)
- **命令参考**
  - [Amazon 命令](./references-cn/commands-amazon.md)
  - [Google Trends 命令](./references-cn/commands-google.md)
  - [Meta 广告命令](./references-cn/commands-meta.md)
  - [TikTok 命令](./references-cn/commands-tiktok.md)
  - [Resource 资源管理](./references-cn/commands-resource.md)
  - [Image 图片生成](./references-cn/commands-image.md)
  - [Feedback 反馈](./references-cn/commands-feedback.md)
- **用例与案例**
  - [典型用例](./references-cn/use-cases.md)
- **市场洞察能力**
  - [市场分析专家](./references-cn/market-analyst.md)
  - [报告转 HTML](./references-cn/report2html.md)
- **创意工作流能力**
  - [创意简报](./references-cn/creative-brief.md)
  - [氛围图生成](./references-cn/mood-image-generator.md)
  - [广告图生成](./references-cn/ad-image-generator.md)

## Troubleshooting

### Authentication Issues

```bash
kamay auth status
kamay auth refresh
kamay auth login --email <email> --password <password>
```

## Getting Help

```bash
kamay --help
kamay <module> --help
kamay <module> <command> --help
```
