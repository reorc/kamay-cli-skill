# Google Ads Commands Reference

Google Ads is an APIMux-backed data module exposed as `kamay google_ads`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay google_ads --help
kamay google_ads search_advertisers --help
kamay google_ads list_ad_creatives --help
kamay google_ads get_ad_details --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search_advertisers` | Search Google Ads advertisers |
| `list_ad_creatives` | List creatives for an advertiser/domain |
| `get_ad_details` | Get details for one ad creative |

## Examples

```bash
kamay google_ads search_advertisers --query "Nike" --region US --num-advertisers 20
kamay google_ads list_ad_creatives --advertiser-id "AR123456789" --region US --ad-format video
kamay google_ads list_ad_creatives --domain "nike.com" --region US
kamay google_ads get_ad_details --advertiser-id "AR123456789" --creative-id "CR987654321"
```
