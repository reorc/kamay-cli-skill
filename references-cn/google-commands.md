# Google 模块命令详解

## 命令总览

| 命令 | 功能 |
|------|------|
| `trends-get-interest-over-time` | 获取 Google Trends 搜索趋势 |

---

## trends-get-interest-over-time

获取 Google Trends 搜索趋势数据，用于验证市场热度和季节性。

```bash
kamay google trends-get-interest-over-time --q "artificial intelligence" --geo US
```

### 参数

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `q` | string | 是 | 搜索查询词 |
| `geo` | string | 否 | 地区代码，默认全球 |

### 返回数据

- 时间序列趋势数据
- 地区分布
- 相关主题和查询

### 典型用途

1. **验证产品市场趋势**
   ```bash
   kamay google trends-get-interest-over-time --q "wireless earbuds" --geo US
   ```

2. **对比多个关键词**
   ```bash
   # 需要在同一会话中多次调用对比
   kamay google trends-get-interest-over-time --q "airpods" --geo US
   kamay google trends-get-interest-over-time --q "galaxy buds" --geo US
   ```

3. **发现季节性规律**
   ```bash
   kamay google trends-get-interest-over-time --q "christmas decorations" --geo US
   ```

### 地区代码示例

| 代码 | 地区 |
|------|------|
| US | 美国 |
| CN | 中国 |
| GB | 英国 |
| DE | 德国 |
| JP | 日本 |
| （空） | 全球 |
