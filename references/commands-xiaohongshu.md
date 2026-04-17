# Xiaohongshu (小红书) Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `search-notes` | Search notes by keyword |
| `note-detail` | Get full details for a note |
| `note-comments` | Get comments for a note |

---

## search-notes

Search Xiaohongshu notes by keyword. Returns note titles, cover images, engagement metrics, and author info.

```bash
kamay xiaohongshu search-notes --keyword "美食推荐" --sort popularity_descending
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `keyword` | string | Yes | Search keyword |
| `sort` | string | No | Sort: `general` (default), `popularity_descending`, `time_descending` |
| `note_type` | int | No | Note type: `1` = image, `2` = video |
| `page` | int | No | Page number for pagination |

### Returns

- Note titles, cover images
- Like / collect / comment counts
- Author info (nickname, avatar)
- `note_id` and `xsec_token` (needed for `note-detail`)

### Examples

```bash
# Search for popular food recommendation notes
kamay xiaohongshu search-notes --keyword "美食推荐" --sort popularity_descending

# Search for video-only notes about skincare
kamay xiaohongshu search-notes --keyword "护肤" --note_type 2

# Paginate results
kamay xiaohongshu search-notes --keyword "穿搭" --page 2
```

---

## note-detail

Get full details for a Xiaohongshu note including text content, images/video, tags, and engagement metrics.

```bash
kamay xiaohongshu note-detail --note_id "697c0eee000000000a03c308" --xsec_token "ABkR6BvFSbUES4IbFcbjZrtCRa3FSqpqsa1KjFLyurW8U="
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `note_id` | string | Yes | Note ID (from `search-notes` results) |
| `xsec_token` | string | Yes | Security token (from `search-notes` results) |

### Returns

- Full text content
- Image URLs / video URL
- Tags and topics
- Like / collect / comment / share counts
- Author details

### Important

Both `note_id` and `xsec_token` must come from `search-notes` results. The `xsec_token` is a security token that cannot be constructed manually.

---

## note-comments

Get comments for a Xiaohongshu note. Automatically paginates to collect up to the requested number of comments.

```bash
kamay xiaohongshu note-comments --note_id "697c0eee000000000a03c308" --limit 20
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `note_id` | string | Yes | Note ID |
| `limit` | int | No | Max number of comments to return |

### Returns

- Comment text
- Author info
- Like count
- Sub-comments (replies)

### Workflow

```bash
# 1. Search for notes
kamay xiaohongshu search-notes --keyword "咖啡推荐" --sort popularity_descending

# 2. Get note details (use note_id + xsec_token from search results)
kamay xiaohongshu note-detail --note_id "<note_id>" --xsec_token "<xsec_token>"

# 3. Read comments for consumer insights
kamay xiaohongshu note-comments --note_id "<note_id>" --limit 50
```
