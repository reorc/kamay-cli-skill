# Xiaohongshu (小红书) Commands Reference

Xiaohongshu is now an APIMux-backed data module exposed as `kamay xiaohongshu`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay xiaohongshu --help
kamay xiaohongshu search_notes --help
kamay xiaohongshu get_note_detail --help
kamay xiaohongshu get_note_comments --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search_notes` | Search notes by keyword |
| `get_note_detail` | Get full details for a note |
| `get_note_comments` | Get comments for a note |

## Examples

```bash
kamay xiaohongshu search_notes --keyword "美食推荐" --sort-strategy likes
kamay xiaohongshu search_notes --keyword "护肤" --note-type video
kamay xiaohongshu get_note_detail --note-id "697c0eee000000000a03c308" --xsec-token "..."
kamay xiaohongshu get_note_comments --note-id "697c0eee000000000a03c308" --sort-strategy latest
```

Use `note_id` and `xsec_token` from `search_notes` results when fetching details. The token cannot be constructed manually.
