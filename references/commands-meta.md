# Meta Ads Commands Reference

Meta Ads is now an APIMux-backed data module exposed as `kamay meta_ads`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay meta_ads --help
kamay meta_ads search_ads --help
kamay meta_ads get_ad_detail --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search_ads` | Search Meta/Facebook/Instagram Ads Library |
| `get_ad_detail` | Get details for one ad |

## search_ads

Search Meta Ads Library for competitor creative research.

```bash
kamay meta_ads search_ads --q "nike shoes" --country US
kamay meta_ads search_ads --q "fitness app" --country US --media-type video
kamay meta_ads search_ads --q "skincare" --platforms "facebook,instagram"
```

Common flags include `--q`, `--country`, `--active-status`, `--media-type`, `--platforms`, `--start-date`, `--end-date`, and `--next-page-token`, but always confirm with `--help`.

## get_ad_detail

Fetch details for a specific ad returned by `search_ads`.

```bash
kamay meta_ads get_ad_detail --ad-id "123456789"
```

Use `ad_id` from `search_ads` results. If detail lookup fails, run a fresh search and choose an ID from the current result set.
