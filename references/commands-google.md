# Google Trends Commands Reference

Google Trends is now an APIMux-backed data module exposed as `kamay google_trends`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay google_trends --help
kamay google_trends get_interest_over_time --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `get_interest_over_time` | Get Google Trends search interest over time |

## get_interest_over_time

Get Google Trends data for market interest, seasonality, and keyword comparison.

```bash
kamay google_trends get_interest_over_time --q "wireless earbuds" --geo US
kamay google_trends get_interest_over_time --q "airpods,galaxy buds" --geo US
kamay google_trends get_interest_over_time --q "wireless earbuds" --geo US --time "today 5-y"
kamay google_trends get_interest_over_time --q "wireless earbuds" --gprop youtube
```

Common flags include `--q`, `--geo`, `--time`, `--cat`, `--gprop`, and `--tz`, but always confirm with `--help` before relying on exact flags.

### Typical Use Cases

1. Validate product demand trends.
2. Compare several keywords in the same market.
3. Detect seasonal patterns before creative or inventory planning.
