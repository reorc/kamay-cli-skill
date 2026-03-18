# Resource Module Commands

## Command Overview

| Command | Function |
|---------|----------|
| `upload` | Upload resource files |
| `download` | Download resource files |
| `list` | List available resources |

---

## upload

Upload local files to Kamay Backend and get resource URI.

```bash
kamay resource upload -f ./images/product.jpg -n "Product Image" --project-id "proj_123"
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `-f, --file` | string | Yes | Path to the file to upload |
| `-n, --name` | string | Yes | Resource name |
| `--project-id` | string | No | Associated project ID |

**Returns:** Resource URI (`mention://` format) for subsequent references

---

## download

Download resources to local directory via URI.

```bash
kamay resource download -u "mention://abc123" -o ./downloads
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `-u, --uri` | string | Yes | Resource URI |
| `-o, --output` | string | No | Output directory (default: ./resource) |

---

## list

List available resources with various filter options.

```bash
# List all resources
kamay resource list

# Filter by project
kamay resource list --project-id "proj_123"

# Filter by resource type
kamay resource list --type "image"

# Filter by source type
kamay resource list --source-type "user_upload"

# Search resource names
kamay resource list --search "product"

# Paginated query
kamay resource list -p 2 --page-size 20
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `-p, --page` | int | No | Page number (default: 1) |
| `--page-size` | int | No | Items per page (default: 10) |
| `--project-id` | string | No | Filter by project ID |
| `--search` | string | No | Search by resource name (fuzzy match) |
| `--source-type` | string | No | Filter by source type |
| `--type` | string | No | Filter by resource type |

**Supported source-type values:**
- `user_created` - User created
- `user_upload` - User uploaded
- `ai_generated` - AI generated
- `task_collected` - Task collected
- `system_preset` - System preset
