# Meta 模块命令详解

## 命令总览

| 命令 | 功能 |
|------|------|
| `ads-search-ads` | 搜索 Meta (Facebook/Instagram) 广告库 |
| `ads-get-ad-detail` | 获取广告详情 |

---

## ads-search-ads

搜索 Meta Ad Library，获取 Facebook/Instagram 广告创意。

```bash
kamay meta ads-search-ads --q "nike shoes" --country US
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `q` | string | 是 | 搜索关键词 |
| `country` | string | 是 | 国家代码 |
| `active_status` | string | 否 | active/inactive/all |

### 返回数据

- 广告创意内容
- 广告主信息
- 投放时间
- 互动数据

### 示例

```bash
# 搜索 Nike 在美国的活跃广告
kamay meta ads-search-ads --q "nike" --country US --active_status active

# 搜索特定产品类别的广告
kamay meta ads-search-ads --q "skincare" --country UK
```

---

## ads-get-ad-detail

获取特定广告的详细信息。

```bash
kamay meta ads-get-ad-detail --ad_id "123456789"
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `ad_id` | string | 是 | 广告 ID |

### 返回数据

- 完整广告数据
- 视频 URL
- 头像/图片资源

### 使用流程

```bash
# 1. 先搜索广告获取 ad_id
kamay meta ads-search-ads --q "nike" --country US

# 2. 使用 ad_id 获取详情
kamay meta ads-get-ad-detail --ad_id "<ad_id_from_search>"
```

### 国家代码

| 代码 | 国家 |
|------|------|
| US | 美国 |
| UK | 英国 |
| DE | 德国 |
| FR | 法国 |
| CA | 加拿大 |
| AU | 澳大利亚 |
| JP | 日本 |
