# TikTok Commands Reference

TikTok is now an APIMux-backed data module exposed as `kamay tiktok`.

## Important

Parameters and command help are proxied from the server-side APIMux CLI. Treat live help as the source of truth:

```bash
kamay tiktok --help
kamay tiktok search_videos --help
kamay tiktok get_video_detail --help
kamay tiktok list_comments --help
kamay tiktok search_products --help
```

`--help` is not billed. Data execution is billed through the normal Kamay API key path.

Command names may be written with underscores or hyphens in `kamay`; the CLI normalizes hyphens to underscores before proxying to APIMux.

## Command Overview

| Command | Function |
|---------|----------|
| `search_videos` | Search TikTok videos |
| `get_video_detail` | Get details for one video |
| `list_comments` | Get video comments |
| `shop_products` | List products from a TikTok Shop seller |
| `shop_product_info` | Get TikTok Shop product details |
| `search_products` | Search TikTok Shop products |
| `product_reviews` | Get TikTok Shop product reviews |

## Examples

```bash
# Content research
kamay tiktok search_videos --keyword "product review" --sort-by likes --publish-time 1m --region US
kamay tiktok get_video_detail --share-url "https://www.tiktok.com/@user/video/7123456789012345678"
kamay tiktok list_comments --video-id "7123456789012345678" --count 20

# TikTok Shop research
kamay tiktok search_products --keyword "wireless microphone" --region US --count 40
kamay tiktok shop_product_info --product-id "1729384756" --region GB
kamay tiktok product_reviews --product-id "1729556436942358002" --sort latest --star 5
```

Prefer the live help output for exact enum values and pagination flags.
