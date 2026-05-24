# Kamay CLI Workflow Examples

This document provides common data analysis workflows.

Data commands are APIMux-backed. Use these examples as workflow patterns, and run `kamay <module> <command> --help` when you need current flags or enum values.

---

## Workflow 1: Competitor Deep Analysis

**Goal**: Comprehensive understanding of competitor product market performance and user feedback

### Steps

```bash
# 1. Search for competitors to get candidate ASIN list
kamay amazon search_products \
  --q "wireless earbuds bluetooth" \
  --market US

# 2. Get target competitor detailed information
kamay amazon get_product \
  --asin B09V3KXJPB \
  --market US

# 3. Analyze competitor reviews (last 6 months)
kamay amazon get_product_reviews \
  --asin B09V3KXJPB \
  --market US \
  --start-date 2024-06-01

# 4. View competitor keyword layout
kamay amazon list_asin_keywords \
  --asin B09V3KXJPB \
  --market US
```

### Analysis Dimensions

| Data | Insights |
|------|----------|
| Product Details | Pricing strategy, product positioning, feature selling points |
| Review Analysis | User satisfaction, pain points, improvement suggestions |
| Keywords | SEO strategy, ad placement direction |

---

## Workflow 2: Category Market Trend Analysis

**Goal**: Evaluate category size, growth trends, and competitive landscape

### Steps

```bash
# 1. Search for target category
kamay amazon search_category \
  --name "Bluetooth Headphones" \
  --market US

# 2. Get category best sellers (Top 100)
kamay amazon get_category_best_sellers \
  --node-id 3743561 \
  --market US

# 3. Get category multi-dimensional trends (batch query)
kamay amazon get_category_trend \
  --node-id 3743561 \
  --trend-types "sales_volume,avg_price,brand_count,seller_count" \
  --market US
```

### Analysis Dimensions

| Metric | Meaning |
|--------|---------|
| sales_volume | Overall category demand |
| avg_price | Market price range distribution |
| brand_count | Brand competition level |
| seller_count | Seller competition intensity |

---

## Workflow 3: Keyword Research and Expansion

**Goal**: Discover high-value keywords, optimize SEO and ad strategy

### Steps

```bash
# 1. Get seed keyword overview
kamay amazon get_keyword_overview \
  --keyword "wireless earbuds" \
  --market US

# 2. Expand related keywords
kamay amazon expand_keywords \
  --keyword "wireless earbuds" \
  --market US

# 3. Compare multiple keyword trends
kamay amazon get_keyword_trends \
  --keywords "wireless earbuds,bluetooth headphones,airpods" \
  --market US

# 4. View ABA trending keywords (discover opportunity words)
kamay amazon query_aba_keywords \
  --market US
```

### Analysis Dimensions

| Data | Insights |
|------|----------|
| Search Volume | Demand scale |
| Competition | Entry difficulty |
| CPC | Ad cost |
| Trends | Seasonality/Growth |

---

## Workflow 4: Ad Creative Competitor Analysis

**Goal**: Research competitor ad strategies and creative directions

### Steps

```bash
# 1. Meta (Facebook/Instagram) ad analysis
kamay meta_ads search_ads \
  --q "nike shoes" \
  --country US \
  --active-status active

# 2. Get specific ad details
kamay meta_ads get_ad_detail \
  --ad-id "<ad_id_from_search>"

# 3. TikTok ad analysis
kamay google_ads search_advertisers \
  --query "fitness app" \
  --region US

# 4. TikTok popular video research
kamay tiktok search_videos \
  --keyword "product review" \
  --sort-by likes \
  --publish-time 1m
```

### Analysis Dimensions

| Platform | Focus Points |
|----------|--------------|
| Meta | Copy style, CTA design, audience targeting |
| TikTok | Video creativity, music selection, interaction methods |

---

## Workflow 5: Google Trends Market Validation

**Goal**: Validate product/keyword market interest and seasonality

### Steps

```bash
# Get search trends (supports multi-keyword comparison)
kamay google_trends get_interest_over_time \
  --q "wireless earbuds" \
  --geo US
```

### Analysis Dimensions

- Long-term trends (rising/falling/stable)
- Seasonal fluctuations
- Regional distribution
- Related topics/queries

---

## Workflow 6: New Product Market Research (Comprehensive)

**Goal**: Evaluate feasibility of entering market with new product

### Steps

```bash
# 1. Category trend analysis
kamay amazon search_category --name "Target Category" --market US
kamay amazon get_category_trend \
  --node-id <node_id> \
  --trend-types "sales_volume,avg_price,brand_count" \
  --market US

# 2. Competitor analysis (Top 5)
kamay amazon get_category_best_sellers --node-id <node_id> --market US
# For each competitor execute:
kamay amazon get_product --asin <asin> --market US
kamay amazon get_product_reviews --asin <asin> --market US

# 3. Keyword opportunities
kamay amazon get_keyword_overview --keyword "main keyword" --market US
kamay amazon expand_keywords --keyword "main keyword" --market US

# 4. Ad environment
kamay meta_ads search_ads --q "main keyword" --country US
kamay google_ads search_advertisers --query "main keyword" --region US

# 5. Google Trends validation
kamay google_trends get_interest_over_time --q "main keyword" --geo US
```

### Decision Framework

| Dimension | Evaluation Metrics | Decision Criteria |
|-----------|-------------------|-------------------|
| Market Size | Sales trend | > Rising/Stable |
| Competition | Brand/seller count | Lower is better |
| Price Range | Average price/distribution | Differentiation space available |
| User Demand | Review pain points | Unmet needs exist |
| Marketing Cost | CPC/Competition | Within budget |

---

## Workflow 7: VOC (Voice of Customer) Analysis

**Goal**: Extract product improvement directions from user reviews

### Steps

```bash
# 1. Get target product reviews
kamay amazon get_product_reviews \
  --asin B09V3KXJPB \
  --market US \
  --start-date 2024-01-01

# 2. Get competitor reviews for comparison
kamay amazon get_product_reviews \
  --asin <competitor_asin> \
  --market US \
  --start-date 2024-01-01
```

### Analysis Dimensions

| Type | Analysis Content |
|------|------------------|
| Positive Reviews | Praised features, purchase drivers |
| Negative Reviews | Pain points, product defects |
| Rating Distribution | Satisfaction overview |
| Time Trends | Quality change trends |

---

## Batch Operation Tips

### Using Scripts for Batch Queries

```bash
#!/bin/bash
# batch-analysis.sh

ASINS=("B09V3KXJPB" "B09JQMJHXY" "B0B1234567")
MARKET="US"

for ASIN in "${ASINS[@]}"; do
    echo "Analyzing $ASIN..."
    kamay amazon get_product --asin $ASIN --market $MARKET > "${ASIN}_product.json"
    kamay amazon get_product_reviews --asin $ASIN --market $MARKET > "${ASIN}_reviews.json"
done
```

### Data Export

```bash
# Process JSON output with jq
kamay amazon search_products --q "keyword" --market US | jq '.products[] | {asin, title, price}'
```
