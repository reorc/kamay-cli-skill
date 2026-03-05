---
name: kamay-cli
description: Kamay CLI 使用指南 - 数据驱动的营销分析工具。支持 Amazon、Google Trends、Meta Ads、TikTok 等平台的数据获取和分析。
version: 0.1.0
---

# Kamay CLI 使用指南

[Kamay](https://kamay.ai/) CLI 是面向数据驱动营销的专业命令行工具，帮助用户发现市场洞察、分析竞品、研究广告创意。

## 核心模块

| 模块 | 功能 |
|------|------|
| **amazon** | 电商数据分析：商品搜索、品类趋势、关键词研究、评价分析 |
| **google** | Google Trends 搜索趋势分析 |
| **meta** | Meta (Facebook/Instagram) 广告库分析 |
| **tiktok** | TikTok 视频和广告分析 |

## 快速开始

### 前置检查

```bash
kamay --help
kamay auth status
```

如果系统未安装 kamay 程序，或者没有登录/登录过期，阅读并根据 [./references/INSTALL.md](./references/INSTALL.md) 文档完成安装配置。

## Amazon 模块

### 商品相关

| 命令 | 功能 |
|------|------|
| `search-products` | 按关键词搜索商品 |
| `get-product` | 获取商品详情（ASIN） |
| `get-product-reviews` | 获取商品评价 |

### 品类相关

| 命令 | 功能 |
|------|------|
| `search-category` | 搜索品类，获取 Node ID |
| `get-category-best-sellers` | 获取品类畅销榜 Top 100 |
| `get-category-trend` | 获取品类趋势数据 |

### 关键词相关

| 命令 | 功能 |
|------|------|
| `get-keyword-overview` | 获取关键词概览 |
| `get-keyword-trends` | 获取关键词搜索趋势 |
| `expand-keywords` | 拓展相关关键词 |
| `list-asin-keywords` | 获取 ASIN 关联关键词 |
| `query-aba-keywords` | 查询 ABA 热词榜 |

## Google 模块

| 命令 | 功能 |
|------|------|
| `trends-get-interest-over-time` | 获取 Google Trends 搜索趋势 |

## Meta 模块

| 命令 | 功能 |
|------|------|
| `ads-search-ads` | 搜索 Meta 广告库 |
| `ads-get-ad-detail` | 获取广告详情 |

## TikTok 模块

| 命令 | 功能 |
|------|------|
| `search-videos` | 搜索视频 |
| `search-ads` | 搜索 TikTok 广告库 |
| `list-comments` | 获取视频评论 |

## 典型工作流

### 竞品分析

```bash
# 搜索商品获取 ASIN
kamay amazon search-products --q "wireless earbuds" --market US

# 获取商品详情
kamay amazon get-product --asin B09V3KXJPB --market US

# 获取评价
kamay amazon get-product-reviews --asin B09V3KXJPB --market US --start_date 2024-01-01

# 获取关键词
kamay amazon list-asin-keywords --asin B09V3KXJPB --market US
```

### 品类趋势分析

```bash
# 搜索品类获取 Node ID
kamay amazon search-category --name "Cell Phones" --market US

# 获取畅销榜
kamay amazon get-category-best-sellers --node_id 3743561 --market US

# 获取趋势（多指标）
kamay amazon get-category-trend --node_id 3743561 --trend_types "sales_volume,avg_price,brand_count" --market US
```

### 关键词研究

```bash
# 关键词概览
kamay amazon get-keyword-overview --keyword "wireless earbuds" --market US

# 拓展关键词
kamay amazon expand-keywords --keyword "headphones" --market US

# 趋势对比
kamay amazon get-keyword-trends --keywords "wireless earbuds,airpods" --market US

# ABA 热词榜
kamay amazon query-aba-keywords --market US --node_ids 12557637011
```

### 广告创意分析

```bash
# Meta 广告
kamay meta ads-search-ads --q "nike shoes" --country US

# TikTok 广告
kamay tiktok search-ads --q "fitness app" --region DE

# TikTok 热门视频
kamay tiktok search-videos --keyword "product review"
```

### Google Trends 验证

```bash
kamay google trends-get-interest-over-time --q "wireless earbuds" --geo US
```

## 常用参数

### Amazon 市场代码

US, UK, DE, JP, CA, FR, ES, IT

### 日期格式

YYYY-MM-DD，如 `2024-01-01`

## 参考文档

- [安装指南 ./references/INSTALL.md](./references/INSTALL.md)
- [Amazon 模块 ./references/amazon-commands.md](./references/amazon-commands.md)
- [Google 模块 ./references/google-commands.md](./references/google-commands.md)
- [Meta 模块 ./references/meta-commands.md](./references/meta-commands.md)
- [TikTok 模块 ./references/tiktok-commands.md](./references/tiktok-commands.md)
- [工作流示例 ./references/workflow-examples.md](./references/workflow-examples.md)

## 故障排除

### 认证问题

```bash
kamay auth status
kamay auth refresh
kamay auth login --email <email> --password <password>
```

## 获取帮助

```bash
kamay --help
kamay <module> --help
kamay <module> <command> --help
```
