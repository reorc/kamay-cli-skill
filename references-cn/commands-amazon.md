# Amazon 模块命令详解

## 命令总览

| 命令 | 功能 |
|------|------|
| `search-products` | 按关键词搜索商品 |
| `get-product` | 获取商品详情 |
| `get-product-reviews` | 获取商品评价 |
| `search-category` | 搜索品类 |
| `get-category-best-sellers` | 获取品类畅销榜 |
| `get-category-trend` | 获取品类趋势 |
| `get-keyword-overview` | 关键词概览 |
| `get-keyword-trends` | 关键词趋势 |
| `expand-keywords` | 拓展关键词 |
| `list-asin-keywords` | ASIN 关联关键词 |
| `query-aba-keywords` | ABA 热词榜 |

---

## 商品相关命令

### search-products

按关键词搜索 Amazon 商品。

```bash
kamay amazon search-products --q "wireless earbuds" --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `q` | string | 是 | 搜索关键词 |
| `market` | string | 是 | 市场代码 |

**返回：** ASIN、标题、价格、评分、缩略图

---

### get-product

通过 ASIN 获取商品详细信息。

```bash
kamay amazon get-product --asin B09V3KXJPB --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `asin` | string | 是 | 10位字母数字 |
| `market` | string | 是 | 市场代码 |

**返回：** 完整商品信息、价格、评分、图片、变体、特性

---

### get-product-reviews

获取商品评价。

```bash
kamay amazon get-product-reviews \
  --asin B09V3KXJPB \
  --market US \
  --start_date 2024-01-01 \
  --only_purchase 1 \
  --page_index 1
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `asin` | string | 是 | ASIN |
| `market` | string | 是 | 市场代码 |
| `start_date` | string | 否 | 开始日期 YYYY-MM-DD |
| `only_purchase` | int | 否 | 1=仅 Verified Purchase |
| `page_index` | int | 否 | 页码 |

---

## 品类相关命令

### search-category

搜索品类获取 Node ID。

```bash
kamay amazon search-category --name "Cell Phones" --market US --limit 10
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `name` | string | 是 | 品类名称（支持中英文） |
| `market` | string | 是 | 市场代码 |
| `limit` | int | 否 | 结果数量限制 |

---

### get-category-best-sellers

获取品类畅销榜 Top 100。

```bash
kamay amazon get-category-best-sellers --node_id 3743561 --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `node_id` | string | 是 | 品类 Node ID |
| `market` | string | 是 | 市场代码 |

---

### get-category-trend

获取品类历史趋势（支持多指标）。

```bash
kamay amazon get-category-trend \
  --node_id 3743561 \
  --trend_types "sales_volume,avg_price,brand_count,seller_count" \
  --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `node_id` | string | 是 | Node ID |
| `trend_types` | string | 是 | 逗号分隔多个指标 |
| `market` | string | 是 | 市场代码 |

**支持的 trend_types：**
- `sales_volume` - 销量
- `avg_price` - 平均价格
- `brand_count` - 品牌数量
- `seller_count` - 卖家数量
- `avg_profit` - 平均利润
- `review_count` - 评价数量

---

## 关键词相关命令

### get-keyword-overview

获取关键词市场概览。

```bash
kamay amazon get-keyword-overview --keyword "wireless earbuds" --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `keyword` | string | 是 | 关键词 |
| `market` | string | 是 | 市场代码 |

**返回：** 搜索量、竞争度、CPC 预估

---

### get-keyword-trends

获取关键词历史搜索趋势。

```bash
kamay amazon get-keyword-trends \
  --keywords "wireless earbuds,airpods,bluetooth headphones" \
  --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `keywords` | stringArray | 是 | 关键词列表（可多选） |
| `market` | string | 是 | 市场代码 |

---

### expand-keywords

拓展相关关键词（长尾词发现）。

```bash
kamay amazon expand-keywords --keyword "headphones" --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `keyword` | string | 是 | 种子关键词 |
| `market` | string | 是 | 市场代码 |

---

### list-asin-keywords

获取 ASIN 关联关键词。

```bash
kamay amazon list-asin-keywords --asin B09V3KXJPB --market US
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `asin` | string | 是 | ASIN |
| `market` | string | 是 | 市场代码 |

**返回：** 关键词列表、自然排名、广告排名、搜索量

---

### query-aba-keywords

查询 Amazon Brand Analytics (ABA) 热词榜。

```bash
kamay amazon query-aba-keywords \
  --market US \
  --page_index 1 \
  --page_size 100
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `market` | string | 是 | 市场代码 |
| `page_index` | int | 否 | 页码 |
| `page_size` | int | 否 | 每页数量 |

---

## 市场代码

| 代码 | 市场 |
|------|------|
| US | 美国 |
| UK | 英国 |
| DE | 德国 |
| JP | 日本 |
| CA | 加拿大 |
| FR | 法国 |
| ES | 西班牙 |
| IT | 意大利 |
