# Amazon Commands Reference

Amazon is now an APIMux-backed data module exposed as `kamay amazon`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay amazon --help
kamay amazon search_products --help
kamay amazon get_product --help
kamay amazon get_product_reviews --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search_products` | Search products by keyword |
| `get_product` | Get product details |
| `get_product_reviews` | Get product reviews |
| `search_category` | Search categories |
| `get_category_best_sellers` | Get category best sellers |
| `get_category_trend` | Get category trends |
| `expand_keywords` | Expand keywords |
| `get_keyword_overview` | Keyword overview |
| `get_keyword_trends` | Keyword trends |
| `list_asin_keywords` | ASIN-related keywords |
| `query_aba_keywords` | ABA trending keywords |
| `get_asin_sales_daily_trend` | Daily ASIN sales trend |
| `get_asins_sales_history` | Batch ASIN sales history |
| `get_variant_sales_30d` | Variant sales in the last 30 days |

## Examples

```bash
# Product and review research
kamay amazon search_products --q "wireless earbuds" --market US
kamay amazon get_product --asin B09V3KXJPB --market US
kamay amazon get_product_reviews --asin B09V3KXJPB --market US --start-date 2024-01-01

# Category research
kamay amazon search_category --name "Cell Phones" --market US
kamay amazon get_category_best_sellers --node-id 3743561 --market US
kamay amazon get_category_trend --node-id 3743561 --market US --trend-types "sales_volume,avg_price,brand_count"

# Keyword research
kamay amazon get_keyword_overview --keyword "wireless earbuds" --market US
kamay amazon expand_keywords --keyword "headphones" --market US
kamay amazon get_keyword_trends --keywords "wireless earbuds,bluetooth headphones" --market US
kamay amazon list_asin_keywords --asin B09V3KXJPB --market US
kamay amazon query_aba_keywords --keyword "yoga mat" --market US
```

Use marketplace codes such as `US`, `UK`, `DE`, `JP`, `CA`, `FR`, `ES`, and `IT`. Confirm current flag names and enum values with `--help` before running a less familiar command.
