# Meta Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `ads-search-ads` | Search Meta (Facebook/Instagram) Ad Library |
| `ads-get-ad-detail` | Get ad details |

---

## ads-search-ads

Search Meta Ad Library to get Facebook/Instagram ad creatives.

```bash
kamay meta ads-search-ads --q "nike shoes" --country US
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `q` | string | Yes | Search keyword |
| `country` | string | Yes | Country code |
| `active_status` | string | No | active/inactive/all |

### Returns

- Ad creative content
- Advertiser information
- Running time
- Engagement data

### Examples

```bash
# Search for active Nike ads in the US
kamay meta ads-search-ads --q "nike" --country US --active_status active

# Search for ads in a specific product category
kamay meta ads-search-ads --q "skincare" --country UK
```

---

## ads-get-ad-detail

Get detailed information for a specific ad.

```bash
kamay meta ads-get-ad-detail --ad_id "123456789"
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `ad_id` | string | Yes | Ad ID |

### Returns

- Complete ad data
- Video URL
- Avatar/image assets

### Workflow

```bash
# 1. First search ads to get ad_id
kamay meta ads-search-ads --q "nike" --country US

# 2. Use ad_id to get details
kamay meta ads-get-ad-detail --ad_id "<ad_id_from_search>"
```

### Country Codes

| Code | Country |
|------|---------|
| US | United States |
| UK | United Kingdom |
| DE | Germany |
| FR | France |
| CA | Canada |
| AU | Australia |
| JP | Japan |
