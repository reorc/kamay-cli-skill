# Douyin (抖音) Commands Reference

Douyin is now an APIMux-backed data module exposed as `kamay douyin`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay douyin --help
kamay douyin search_videos --help
kamay douyin get_video_detail --help
kamay douyin get_video_comments --help
kamay douyin get_comment_replies --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search_videos` | Search videos by keyword |
| `get_video_detail` | Get full details for a video |
| `get_video_comments` | Get comments for a video |
| `get_comment_replies` | Get replies to a specific comment |

## Examples

```bash
kamay douyin search_videos --keyword "咖啡测评" --sort-type likes --publish-time 1w
kamay douyin get_video_detail --aweme-id "7123456789"
kamay douyin get_video_detail --share-url "https://v.douyin.com/.../"
kamay douyin get_video_comments --aweme-id "7123456789" --count 50
kamay douyin get_comment_replies --aweme-id "7123456789" --comment-id "7234567890" --count 20
```

Use `aweme_id` and `comment_id` from previous search/detail/comment results.
