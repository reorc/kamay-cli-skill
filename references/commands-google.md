# Google Module Commands Reference

## Command Overview

| Command | Function |
|---------|----------|
| `trends-get-interest-over-time` | Get Google Trends search trends |

---

## trends-get-interest-over-time

Get Google Trends search trend data for validating market interest and seasonality.

```bash
kamay google trends-get-interest-over-time --q "artificial intelligence" --geo US
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `q` | string | Yes | Search query |
| `geo` | string | No | Region code, default is worldwide |

### Returns

- Time-series trend data
- Geographic distribution
- Related topics and queries

### Typical Use Cases

1. **Validate product market trends**
   ```bash
   kamay google trends-get-interest-over-time --q "wireless earbuds" --geo US
   ```

2. **Compare multiple keywords**
   ```bash
   # Run multiple calls in the same session to compare
   kamay google trends-get-interest-over-time --q "airpods" --geo US
   kamay google trends-get-interest-over-time --q "galaxy buds" --geo US
   ```

3. **Discover seasonal patterns**
   ```bash
   kamay google trends-get-interest-over-time --q "christmas decorations" --geo US
   ```

### Region Code Examples

| Code | Region |
|------|--------|
| US | United States |
| CN | China |
| GB | United Kingdom |
| DE | Germany |
| JP | Japan |
| (empty) | Worldwide |
