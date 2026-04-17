# Reddit Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `search` | Search Reddit posts, communities, comments, media, or users |
| `subreddit-feed` | Get posts from a specific subreddit |
| `post-details` | Get full details for a single post |
| `post-comments` | Get comments for a post |

---

## search

Search Reddit by keyword across posts, communities, comments, media, or users.

```bash
kamay reddit search --query "best python libraries" --search_type post --sort TOP --time_range month
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | Yes | Search keyword |
| `search_type` | string | No | Type: `post`, `community`, `comment`, `media`, `user` |
| `sort` | string | No | Sort: `TOP`, `RELEVANCE`, `NEW`, `COMMENTS` |
| `time_range` | string | No | Time range: `hour`, `day`, `week`, `month`, `year`, `all` |
| `after` | string | No | Pagination cursor from previous results |

### Returns

- Post titles, scores, subreddit names
- Author info
- Pagination cursor for next page

### Examples

```bash
# Search for product review posts sorted by top, last month
kamay reddit search --query "wireless earbuds review" --search_type post --sort TOP --time_range month

# Search for communities related to a topic
kamay reddit search --query "skincare" --search_type community

# Paginate through results
kamay reddit search --query "AI tools" --sort TOP --after "<cursor>"
```

---

## subreddit-feed

Get posts from a specific subreddit.

```bash
kamay reddit subreddit-feed --subreddit_name python --sort HOT
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `subreddit_name` | string | Yes | Subreddit name (without r/) |
| `sort` | string | No | Sort: `HOT`, `NEW`, `TOP`, `RISING` |
| `after` | string | No | Pagination cursor from previous results |

### Returns

- Post list with titles, scores, author info
- Pagination cursor

### Examples

```bash
# Get hot posts from r/python
kamay reddit subreddit-feed --subreddit_name python --sort HOT

# Get newest posts from r/entrepreneur
kamay reddit subreddit-feed --subreddit_name entrepreneur --sort NEW
```

---

## post-details

Get full details for a single Reddit post.

```bash
kamay reddit post-details --post_id "t3_1ojnh50"
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `post_id` | string | Yes | Post ID (e.g., `t3_1ojnh50`) |

### Returns

- Title, body text
- Score, upvote ratio
- Author, subreddit
- Media attachments

---

## post-comments

Get comments for a Reddit post.

```bash
kamay reddit post-comments --post_id "t3_1ojnh50" --sort_type TOP
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `post_id` | string | Yes | Post ID (e.g., `t3_1ojnh50`) |
| `sort_type` | string | No | Sort: `TOP`, `NEW`, `BEST`, `CONTROVERSIAL` |
| `after` | string | No | Pagination cursor |

### Returns

- Comment text
- Author info
- Score / likes
- Reply threads

### Workflow

```bash
# 1. Search for posts
kamay reddit search --query "best headphones 2025" --sort TOP --time_range month

# 2. Get post details
kamay reddit post-details --post_id "<post_id>"

# 3. Read comments for consumer insights
kamay reddit post-comments --post_id "<post_id>" --sort_type TOP
```
