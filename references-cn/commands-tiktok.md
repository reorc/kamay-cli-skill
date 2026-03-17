# TikTok 模块命令详解

## 命令总览

| 命令 | 功能 |
|------|------|
| `search-videos` | 搜索 TikTok 视频 |
| `search-ads` | 搜索 TikTok 广告库 |
| `list-comments` | 获取视频评论 |

---

## search-videos

搜索 TikTok 视频，获取热门内容数据。

```bash
kamay tiktok search-videos --keyword "dance challenge"
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `keyword` | string | 是 | 搜索关键词 |
| `sort_by` | int | 否 | 排序方式：0-默认, 1-点赞数, 2-发布日期 |
| `publish_time` | int | 否 | 发布时间：0-全部, 1-24h, 7-7天, 30-30天 |

### 返回数据

- 视频元数据
- 点赞/评论/分享数
- 播放量
- 作者信息

### 示例

```bash
# 搜索最近7天的热门产品评测视频
kamay tiktok search-videos --keyword "product review" --sort_by 1 --publish_time 7

# 搜索舞蹈挑战视频
kamay tiktok search-videos --keyword "dance challenge" --sort_by 1
```

---

## search-ads

搜索 TikTok 广告库。

```bash
kamay tiktok search-ads --q "fitness app" --region DE
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `q` | string | 是 | 搜索关键词 |
| `region` | string | 是 | 地区代码 |
| `sort_by` | string | 否 | 排序方式 |

### 排序选项

| 值 | 说明 |
|-----|------|
| `last_shown_date_newest_to_oldest` | 最近展示时间（新→旧） |
| `first_shown_date_newest_to_oldest` | 首次展示时间（新→旧） |

### 返回数据

- 广告商信息
- 视频链接
- 预估受众
- 投放花费估算

### 示例

```bash
# 搜索德国地区的健身类广告
kamay tiktok search-ads --q "fitness" --region DE --sort_by last_shown_date_newest_to_oldest

# 搜索美国地区的电商广告
kamay tiktok search-ads --q "shop now" --region US
```

### 地区代码

| 代码 | 地区 |
|------|------|
| US | 美国 |
| UK | 英国 |
| DE | 德国 |
| FR | 法国 |
| IT | 意大利 |
| ES | 西班牙 |
| CA | 加拿大 |
| AU | 澳大利亚 |
| JP | 日本 |

---

## list-comments

获取 TikTok 视频评论。

```bash
kamay tiktok list-comments --video_id "7123456789012345678"
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `video_id` | string | 是 | 视频 ID 或完整 URL |

### 支持的视频 ID 格式

```bash
# 直接使用视频 ID
kamay tiktok list-comments --video_id "7123456789012345678"

# 使用完整视频 URL
kamay tiktok list-comments --video_id "https://www.tiktok.com/@user/video/7123456789012345678"
```

### 返回数据

- 评论内容
- 评论者信息
- 点赞数
- 评论时间

### 使用流程

```bash
# 1. 先搜索视频
kamay tiktok search-videos --keyword "product review"

# 2. 使用返回的 video_id 获取评论
kamay tiktok list-comments --video_id "<video_id>"
```
