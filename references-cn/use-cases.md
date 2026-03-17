# Kamay CLI 工作流示例

本文档提供常见的数据分析工作流。

---

## 工作流 1：竞品深度分析

**目标**：全面了解竞争对手产品的市场表现和用户反馈

### 步骤

```bash
# 1. 搜索竞品，获取候选 ASIN 列表
kamay amazon search-products \
  --q "wireless earbuds bluetooth" \
  --market US

# 2. 获取目标竞品详细信息
kamay amazon get-product \
  --asin B09V3KXJPB \
  --market US

# 3. 分析竞品评价（最近6个月）
kamay amazon get-product-reviews \
  --asin B09V3KXJPB \
  --market US \
  --start_date 2024-06-01

# 4. 查看竞品关键词布局
kamay amazon list-asin-keywords \
  --asin B09V3KXJPB \
  --market US
```

### 分析维度

| 数据 | 洞察 |
|------|------|
| 商品详情 | 定价策略、产品定位、功能卖点 |
| 评价分析 | 用户满意度、痛点、改进建议 |
| 关键词 | SEO 策略、广告投放方向 |

---

## 工作流 2：品类市场趋势分析

**目标**：评估品类规模、增长趋势和竞争格局

### 步骤

```bash
# 1. 搜索目标品类
kamay amazon search-category \
  --name "Bluetooth Headphones" \
  --market US

# 2. 获取品类畅销榜（Top 100）
kamay amazon get-category-best-sellers \
  --node_id 3743561 \
  --market US

# 3. 获取品类多维度趋势（批量查询）
kamay amazon get-category-trend \
  --node_id 3743561 \
  --trend_types "sales_volume,avg_price,brand_count,seller_count" \
  --market US
```

### 分析维度

| 指标 | 意义 |
|------|------|
| sales_volume | 品类整体需求量 |
| avg_price | 市场价格带分布 |
| brand_count | 品牌竞争度 |
| seller_count | 卖家竞争激烈程度 |

---

## 工作流 3：关键词研究与拓展

**目标**：发现高价值关键词，优化 SEO 和广告策略

### 步骤

```bash
# 1. 获取种子关键词概览
kamay amazon get-keyword-overview \
  --keyword "wireless earbuds" \
  --market US

# 2. 拓展相关关键词
kamay amazon expand-keywords \
  --keyword "wireless earbuds" \
  --market US

# 3. 对比多个关键词趋势
kamay amazon get-keyword-trends \
  --keywords "wireless earbuds,bluetooth headphones,airpods" \
  --market US

# 4. 查看 ABA 热词榜（发现机会词）
kamay amazon query-aba-keywords \
  --market US
```

### 分析维度

| 数据 | 洞察 |
|------|------|
| 搜索量 | 需求规模 |
| 竞争度 | 进入难度 |
| CPC | 广告成本 |
| 趋势 | 季节性/增长性 |

---

## 工作流 4：广告创意竞品分析

**目标**：研究竞争对手的广告策略和创意方向

### 步骤

```bash
# 1. Meta (Facebook/Instagram) 广告分析
kamay meta ads-search-ads \
  --q "nike shoes" \
  --country US \
  --active_status active

# 2. 获取特定广告详情
kamay meta ads-get-ad-detail \
  --ad_id "<ad_id_from_search>"

# 3. TikTok 广告分析
kamay tiktok search-ads \
  --q "fitness app" \
  --region DE

# 4. TikTok 热门视频研究
kamay tiktok search-videos \
  --keyword "product review" \
  --sort_by 1 \
  --publish_time 30
```

### 分析维度

| 平台 | 关注点 |
|------|--------|
| Meta | 文案风格、CTA 设计、受众定位 |
| TikTok | 视频创意、音乐选择、互动方式 |

---

## 工作流 5：Google Trends 市场验证

**目标**：验证产品/关键词的市场热度和季节性

### 步骤

```bash
# 获取搜索趋势（支持多词对比）
kamay google trends-get-interest-over-time \
  --q "wireless earbuds" \
  --geo US
```

### 分析维度

- 长期趋势（上升/下降/稳定）
- 季节性波动
- 区域分布
- 相关主题/查询

---

## 工作流 6：新品市场调研（综合）

**目标**：评估新品进入市场的可行性

### 步骤

```bash
# 1. 品类趋势分析
kamay amazon search-category --name "Target Category" --market US
kamay amazon get-category-trend \
  --node_id <node_id> \
  --trend_types "sales_volume,avg_price,brand_count" \
  --market US

# 2. 竞品分析（Top 5）
kamay amazon get-category-best-sellers --node_id <node_id> --market US
# 对每个竞品执行：
kamay amazon get-product --asin <asin> --market US
kamay amazon get-product-reviews --asin <asin> --market US

# 3. 关键词机会
kamay amazon get-keyword-overview --keyword "main keyword" --market US
kamay amazon expand-keywords --keyword "main keyword" --market US

# 4. 广告环境
kamay meta ads-search-ads --q "main keyword" --country US
kamay tiktok search-ads --q "main keyword" --region US

# 5. Google Trends 验证
kamay google trends-get-interest-over-time --q "main keyword" --geo US
```

### 决策框架

| 维度 | 评估指标 | 决策依据 |
|------|----------|----------|
| 市场规模 | 销量趋势 | > 上升/稳定 |
| 竞争度 | 品牌/卖家数 | < 适中 |
| 价格带 | 均价/分布 | 有差异化空间 |
| 用户需求 | 评价痛点 | 有未满足需求 |
| 营销成本 | CPC/竞争度 | 可承受范围 |

---

## 工作流 7：VOC（用户声音）分析

**目标**：从用户评价中提取产品改进方向

### 步骤

```bash
# 1. 获取目标商品评价
kamay amazon get-product-reviews \
  --asin B09V3KXJPB \
  --market US \
  --start_date 2024-01-01

# 2. 获取竞品评价对比
kamay amazon get-product-reviews \
  --asin <competitor_asin> \
  --market US \
  --start_date 2024-01-01
```

### 分析维度

| 类型 | 分析内容 |
|------|----------|
| 正面评价 | praised features, 购买驱动因素 |
| 负面评价 | pain points, 产品缺陷 |
| 星级分布 | 满意度概览 |
| 时间趋势 | 质量变化趋势 |

---

## 批量操作技巧

### 使用脚本批量查询

```bash
#!/bin/bash
# batch-analysis.sh

ASINS=("B09V3KXJPB" "B09JQMJHXY" "B0B1234567")
MARKET="US"

for ASIN in "${ASINS[@]}"; do
    echo "Analyzing $ASIN..."
    kamay amazon get-product --asin $ASIN --market $MARKET > "${ASIN}_product.json"
    kamay amazon get-product-reviews --asin $ASIN --market $MARKET > "${ASIN}_reviews.json"
done
```

### 数据导出

```bash
# 配合 jq 处理 JSON 输出
kamay amazon search-products --q "keyword" --market US | jq '.products[] | {asin, title, price}'
```
