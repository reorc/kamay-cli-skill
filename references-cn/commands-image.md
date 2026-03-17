# Image 模块命令详解

## 命令总览

| 命令 | 功能 |
|------|------|
| `generate-image` | AI 图像生成 |
| `understand-image` | AI 图像理解 |

---

## generate-image

使用 AI 图像生成模型，根据文本提示词生成图像。

```bash
# 基础用法
kamay image generate-image --prompt "一只可爱的猫咪在阳光下打盹"

# 指定分辨率和宽高比
kamay image generate-image \
  --prompt "现代简约风格的客厅设计" \
  --resolution "2K" \
  --aspect_ratio "16:9"

# 使用参考图片（需要 mention:// 格式的 URI）
kamay image generate-image \
  --prompt "将这张图片转换为水彩画风格" \
  --reference_images "mention://abc123"
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `--prompt` | string | 是 | 文本提示词，描述想要生成的图像 |
| `--name` | string | 否 | 图像名称 |
| `--aspect_ratio` | string | 否 | 宽高比（默认：1:1） |
| `--resolution` | string | 否 | 分辨率（默认：1K） |
| `--reference_images` | string | 否 | 参考图片 URI（mention:// 格式） |

**支持的宽高比：**
- `1:1` - 正方形
- `16:9` - 横屏
- `9:16` - 竖屏
- `4:3` - 传统横屏
- `3:4` - 传统竖屏

**支持的分辨率：**
- `1K` - 标准分辨率
- `2K` - 高清分辨率
- `4K` - 超高清分辨率

**返回值：**

生成成功后返回资源 URI（`mention://` 格式），需要使用 `kamay resource download` 下载到本地：

```bash
# 生成图片后下载到本地
kamay image generate-image --prompt "一只可爱的猫咪" --name "cute-cat"
# 返回: mention://abc123

# 使用 resource download 下载
kamay resource download -u "mention://abc123" -o ./images
```

---

## understand-image

使用 Google Gemini 视觉模型分析和理解图像。

> **重要**：`--image_paths` 参数需要使用 `mention://` 格式的资源 URI，不支持本地文件路径。
> 如需分析本地图片，请先使用 `kamay resource upload` 上传获取 URI。

```bash
# 基础用法（使用 mention:// URI）
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "描述这张图片的内容"

# 多图片分析（多个 URI 用逗号分隔）
kamay image understand-image \
  --image_paths "mention://abc123,mention://def456" \
  --prompt "比较这两张图片的异同"

# 指定输出格式
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "提取图表中的数据" \
  --output_format "json"

# 指定模型
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "识别并提取文档中的文字" \
  --model "gemini-2.0-flash"
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `--image_paths` | string | 是 | 图片 URI（mention:// 格式），多个用逗号分隔 |
| `--prompt` | string | 是 | 分析提示词，描述想要获取的信息 |
| `--model` | string | 否 | 使用的模型（可选） |
| `--output_format` | string | 否 | 输出格式（默认：markdown） |

**支持的输出格式：**
- `markdown` - Markdown 格式（默认）
- `json` - JSON 格式
- `text` - 纯文本格式

---

## 图片工作流示例

### 从本地上传到分析完整流程

```bash
# 1. 上传本地图片获取 URI
kamay resource upload -f ./photo.jpg -n "我的照片"
# 返回: mention://abc123

# 2. 使用 URI 分析图片
kamay image understand-image \
  --image_paths "mention://abc123" \
  --prompt "描述这张图片的内容和主要元素"

# 3. 基于分析结果生成新图片
kamay image generate-image \
  --prompt "一张类似风格的照片，但是是日落场景" \
  --reference_images "mention://abc123"
# 返回: mention://def456

# 4. 下载生成的图片
kamay resource download -u "mention://def456" -o ./output
```

## 相关命令

- [Resource 资源管理](./commands-resource.md) - 上传/下载资源文件
