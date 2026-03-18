# TikTok Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `search-videos` | Search TikTok videos |
| `search-ads` | Search TikTok Ad Library |
| `list-comments` | Get video comments |

---

## search-videos

Search TikTok videos to get popular content data.

```bash
kamay tiktok search-videos --keyword "dance challenge"
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `keyword` | string | Yes | Search keyword |
| `sort_by` | int | No | Sort: 0-default, 1-likes, 2-publish date |
| `publish_time` | int | No | Publish time: 0-all, 1-24h, 7-7days, 30-30days |

### Returns

- Video metadata
- Likes/comments/shares count
- View count
- Creator info

### Examples

```bash
# Search for popular product review videos from the last 7 days
kamay tiktok search-videos --keyword "product review" --sort_by 1 --publish_time 7

# Search for dance challenge videos
kamay tiktok search-videos --keyword "dance challenge" --sort_by 1
```

---

## search-ads

Search TikTok Ad Library.

```bash
kamay tiktok search-ads --q "fitness app" --region DE
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `q` | string | Yes | Search keyword |
| `region` | string | Yes | Region code |
| `sort_by` | string | No | Sort method |

### Sort Options

| Value | Description |
|-------|-------------|
| `last_shown_date_newest_to_oldest` | Last shown date (new→old) |
| `first_shown_date_newest_to_oldest` | First shown date (new→old) |

### Returns

- Advertiser information
- Video links
- Estimated audience
- Spend estimate

### Examples

```bash
# Search for fitness ads in Germany
kamay tiktok search-ads --q "fitness" --region DE --sort_by last_shown_date_newest_to_oldest

# Search for e-commerce ads in the US
kamay tiktok search-ads --q "shop now" --region US
```

### Region Codes

| Code | Region |
|------|--------|
| US | United States |
| UK | United Kingdom |
| DE | Germany |
| FR | France |
| IT | Italy |
| ES | Spain |
| CA | Canada |
| AU | Australia |
| JP | Japan |

---

## list-comments

Get TikTok video comments.

```bash
kamay tiktok list-comments --video_id "7123456789012345678"
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `video_id` | string | Yes | Video ID or full URL |

### Supported Video ID Formats

```bash
# Use video ID directly
kamay tiktok list-comments --video_id "7123456789012345678"

# Use full video URL
kamay tiktok list-comments --video_id "https://www.tiktok.com/@user/video/7123456789012345678"
```

### Returns

- Comment content
- Commenter info
- Like count
- Comment time

### Workflow

```bash
# 1. First search for videos
kamay tiktok search-videos --keyword "product review"

# 2. Use the returned video_id to get comments
kamay tiktok list-comments --video_id "<video_id>"
```
