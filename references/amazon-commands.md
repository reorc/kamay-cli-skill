# Amazon Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `search-products` | Search products by keyword |
| `get-product` | Get product details |
| `get-product-reviews` | Get product reviews |
| `search-category` | Search categories |
| `get-category-best-sellers` | Get category best sellers |
| `get-category-trend` | Get category trends |
| `get-keyword-overview` | Keyword overview |
| `get-keyword-trends` | Keyword trends |
| `expand-keywords` | Expand keywords |
| `list-asin-keywords` | ASIN-related keywords |
| `query-aba-keywords` | ABA trending keywords |

---

## Product Commands

### search-products

Search Amazon products by keyword.

```bash
kamay amazon search-products --q "wireless earbuds" --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `q` | string | Yes | Search keyword |
| `market` | string | Yes | Market code |

**Returns:** ASIN, title, price, rating, thumbnail

---

### get-product

Get detailed product information by ASIN.

```bash
kamay amazon get-product --asin B09V3KXJPB --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `asin` | string | Yes | 10-character alphanumeric |
| `market` | string | Yes | Market code |

**Returns:** Full product info, price, rating, images, variants, features

---

### get-product-reviews

Get product reviews.

```bash
kamay amazon get-product-reviews \
  --asin B09V3KXJPB \
  --market US \
  --start_date 2024-01-01 \
  --only_purchase 1 \
  --page_index 1
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `asin` | string | Yes | ASIN |
| `market` | string | Yes | Market code |
| `start_date` | string | No | Start date YYYY-MM-DD |
| `only_purchase` | int | No | 1=Verified Purchase only |
| `page_index` | int | No | Page number |

---

## Category Commands

### search-category

Search categories to get Node ID.

```bash
kamay amazon search-category --name "Cell Phones" --market US --limit 10
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Category name (supports Chinese and English) |
| `market` | string | Yes | Market code |
| `limit` | int | No | Result limit |

---

### get-category-best-sellers

Get category best sellers Top 100.

```bash
kamay amazon get-category-best-sellers --node_id 3743561 --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `node_id` | string | Yes | Category Node ID |
| `market` | string | Yes | Market code |

---

### get-category-trend

Get category historical trends (supports multiple metrics).

```bash
kamay amazon get-category-trend \
  --node_id 3743561 \
  --trend_types "sales_volume,avg_price,brand_count,seller_count" \
  --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `node_id` | string | Yes | Node ID |
| `trend_types` | string | Yes | Comma-separated metrics |
| `market` | string | Yes | Market code |

**Supported trend_types:**
- `sales_volume` - Sales volume
- `avg_price` - Average price
- `brand_count` - Number of brands
- `seller_count` - Number of sellers
- `avg_profit` - Average profit
- `review_count` - Number of reviews

---

## Keyword Commands

### get-keyword-overview

Get keyword market overview.

```bash
kamay amazon get-keyword-overview --keyword "wireless earbuds" --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `keyword` | string | Yes | Keyword |
| `market` | string | Yes | Market code |

**Returns:** Search volume, competition, CPC estimate

---

### get-keyword-trends

Get keyword historical search trends.

```bash
kamay amazon get-keyword-trends \
  --keywords "wireless earbuds,airpods,bluetooth headphones" \
  --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `keywords` | stringArray | Yes | Keyword list (multiple allowed) |
| `market` | string | Yes | Market code |

---

### expand-keywords

Expand related keywords (long-tail discovery).

```bash
kamay amazon expand-keywords --keyword "headphones" --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `keyword` | string | Yes | Seed keyword |
| `market` | string | Yes | Market code |

---

### list-asin-keywords

Get ASIN-related keywords.

```bash
kamay amazon list-asin-keywords --asin B09V3KXJPB --market US
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `asin` | string | Yes | ASIN |
| `market` | string | Yes | Market code |

**Returns:** Keyword list, organic rank, ad rank, search volume

---

### query-aba-keywords

Query Amazon Brand Analytics (ABA) trending keywords.

```bash
kamay amazon query-aba-keywords \
  --market US \
  --page_index 1 \
  --page_size 100
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `market` | string | Yes | Market code |
| `page_index` | int | No | Page number |
| `page_size` | int | No | Items per page |

---

## Market Codes

| Code | Market |
|------|--------|
| US | United States |
| UK | United Kingdom |
| DE | Germany |
| JP | Japan |
| CA | Canada |
| FR | France |
| ES | Spain |
| IT | Italy |
