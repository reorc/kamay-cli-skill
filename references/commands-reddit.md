# Reddit Commands Reference

Reddit is now an APIMux-backed data module exposed as `kamay reddit`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay reddit --help
kamay reddit search --help
kamay reddit get_subreddit_feed --help
kamay reddit get_post_detail --help
kamay reddit get_post_comments --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search` | Search Reddit posts, communities, comments, media, or users |
| `get_subreddit_feed` | Get posts from a subreddit |
| `get_post_detail` | Get full details for one post |
| `get_post_comments` | Get comments for a post |

## Examples

```bash
kamay reddit search --query "wireless earbuds review" --search-type post --sort top --time-range month
kamay reddit get_subreddit_feed --subreddit-name headphones --sort hot
kamay reddit get_post_detail --post-id "t3_1ojnh50"
kamay reddit get_post_comments --post-id "t3_1ojnh50" --sort-type top
```

Use post IDs from search/feed results. Use pagination cursors from response metadata when continuing a result set.
