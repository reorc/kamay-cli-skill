# Douyin (抖音) Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `video-search` | Search videos by keyword |
| `video-detail` | Get full details for a video |
| `video-comments` | Get comments for a video |
| `comment-replies` | Get replies to a specific comment |

---

## video-search

Search Douyin videos by keyword. Returns video titles, author info, and engagement metrics.

```bash
kamay douyin video-search --keyword "人工智能" --sort_type 2 --publish_time 7
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `keyword` | string | Yes | Search keyword |
| `sort_type` | string | No | Sort: `0` = general, `1` = most liked, `2` = newest |
| `publish_time` | string | No | Time range: `0` = all, `1` = 24h, `7` = 7 days, `30` = 30 days |
| `filter_duration` | string | No | Duration filter |
| `content_type` | string | No | Content type filter |
| `cursor` | int | No | Pagination cursor |
| `search_id` | string | No | Search session ID (from previous results, for pagination) |
| `backtrace` | string | No | Backtrace token (from previous results) |

### Returns

- Video titles, cover images
- Play / like / comment / share counts
- Author info (nickname, avatar)
- `aweme_id` (needed for `video-detail` and `video-comments`)

### Examples

```bash
# Search for AI-related videos, sorted by newest
kamay douyin video-search --keyword "人工智能" --sort_type 2

# Search for popular product review videos from the last 7 days
kamay douyin video-search --keyword "好物推荐" --sort_type 1 --publish_time 7
```

---

## video-detail

Get full details for a single Douyin video.

```bash
kamay douyin video-detail --aweme_id "7123456789"
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `aweme_id` | string | Yes | Video ID (from `video-search` results) |

### Returns

- Author info
- Play / like / comment / share counts
- Video duration
- Downloadable video URL

---

## video-comments

Get comments for a Douyin video.

```bash
kamay douyin video-comments --aweme_id "7123456789" --count 20
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `aweme_id` | string | Yes | Video ID |
| `count` | int | No | Number of comments per page (default: 20) |
| `cursor` | int | No | Pagination cursor |

### Returns

- Comment text
- Author info
- Like count
- Reply count
- Pagination info (`cursor` for next page)

---

## comment-replies

Get replies to a specific comment on a Douyin video.

```bash
kamay douyin comment-replies --item_id "7123456789" --comment_id "7234567890"
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `item_id` | string | Yes | Video ID |
| `comment_id` | string | Yes | Comment ID (from `video-comments` results) |
| `count` | int | No | Number of replies per page (default: 20) |
| `cursor` | int | No | Pagination cursor |

### Returns

- Reply text
- Author info
- Like count
- Pagination info

### Workflow

```bash
# 1. Search for videos
kamay douyin video-search --keyword "咖啡测评" --sort_type 1

# 2. Get video details
kamay douyin video-detail --aweme_id "<aweme_id>"

# 3. Read comments
kamay douyin video-comments --aweme_id "<aweme_id>" --count 50

# 4. Dive into comment replies
kamay douyin comment-replies --item_id "<aweme_id>" --comment_id "<comment_id>"
```
