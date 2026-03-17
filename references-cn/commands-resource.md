# Resource 模块命令详解

## 命令总览

| 命令 | 功能 |
|------|------|
| `upload` | 上传资源文件 |
| `download` | 下载资源文件 |
| `list` | 列出可用资源 |

---

## upload

上传本地文件到 Kamay Backend 并获取资源 URI。

```bash
kamay resource upload -f ./images/product.jpg -n "产品图片" --project-id "proj_123"
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `-f, --file` | string | 是 | 要上传的文件路径 |
| `-n, --name` | string | 是 | 资源名称 |
| `--project-id` | string | 否 | 关联的项目 ID |

**返回：** 资源 URI（`mention://` 格式），可用于后续引用

---

## download

通过 URI 下载资源到本地目录。

```bash
kamay resource download -u "mention://abc123" -o ./downloads
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `-u, --uri` | string | 是 | 资源 URI |
| `-o, --output` | string | 否 | 输出目录（默认：./resource） |

---

## list

列出可用资源，支持多种过滤条件。

```bash
# 列出所有资源
kamay resource list

# 按项目过滤
kamay resource list --project-id "proj_123"

# 按资源类型过滤
kamay resource list --type "image"

# 按来源类型过滤
kamay resource list --source-type "user_upload"

# 搜索资源名称
kamay resource list --search "产品"

# 分页查询
kamay resource list -p 2 --page-size 20
```

**参数：**

| 参数 | 类型 | 必需 | 说明 |
|------|------|------|------|
| `-p, --page` | int | 否 | 页码（默认：1） |
| `--page-size` | int | 否 | 每页数量（默认：10） |
| `--project-id` | string | 否 | 按项目 ID 过滤 |
| `--search` | string | 否 | 按资源名称搜索（模糊匹配） |
| `--source-type` | string | 否 | 按来源类型过滤 |
| `--type` | string | 否 | 按资源类型过滤 |

**支持的 source-type 值：**
- `user_created` - 用户创建
- `user_upload` - 用户上传
- `ai_generated` - AI 生成
- `task_collected` - 任务采集
- `system_preset` - 系统预设
