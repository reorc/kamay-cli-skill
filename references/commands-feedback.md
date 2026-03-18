# Feedback Module Commands

## Command Overview

| Command | Function |
|---------|----------|
| `create` | Submit feedback |
| `get` | Get feedback details |
| `list` | List feedback |

---

## create

Submit feedback to the administrator.

```bash
kamay feedback create \
  --title "Feature Suggestion: Add Batch Export Function" \
  --content "I hope to add batch export function to the resource list page, so I can download multiple resource files at once. Currently only individual downloads are supported, which is inefficient."
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `--title` | string | Yes | Feedback title |
| `--content` | string | Yes | Feedback content |

---

## get

Get detailed information about specific feedback, including administrator responses.

```bash
kamay feedback get <feedback-id>
```

**Returns:** Feedback details including title, content, status, administrator response, etc.

---

## list

List submitted feedback, view administrator response status.

```bash
# List feedback
kamay feedback list

# List all feedback (including history)
kamay feedback list --all
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `--all` | boolean | No | Show all feedback (including history) |
