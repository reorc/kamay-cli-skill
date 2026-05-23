# TrendCloud Commands Reference

TrendCloud is an APIMux-backed data module exposed as `kamay trendcloud`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay trendcloud --help
kamay trendcloud get_market_trend --help
kamay trendcloud get_top_rankings --help
kamay trendcloud search_filter_values --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `get_market_trend` | Query market trend metrics |
| `get_top_rankings` | Query top rankings by entity and metric |
| `search_filter_values` | Search valid filter values |

## Examples

```bash
kamay trendcloud get_market_trend --start-month "2025-01" --end-month "2025-12"
kamay trendcloud get_market_trend --metrics "sales,volume" --filters-json '{"platforms":["douyin"],"brands":["Luckin"]}'
kamay trendcloud get_top_rankings --entity brand --metric sales
kamay trendcloud search_filter_values --kind category --query "coffee"
```
