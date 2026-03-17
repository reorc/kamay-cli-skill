# Kamay CLI Skill 安装指南

## 安装 Skill

将本仓库安装到 Agent 的 skills 目录，可获得完整的使用指南和参考文档。

### 方式一：Git Clone（推荐，方便更新升级）

```bash
# 对于 Claude Code
git clone https://github.com/reorc/kamay-cli-skill.git ~/.claude/skills/kamay-cli

# 对于 OpenCode、OpenClaw 等通用 Agent
git clone https://github.com/reorc/kamay-cli-skill.git ~/.agents/skills/kamay-cli
```

**更新 Skill**:
```bash
cd ~/.claude/skills/kamay-cli  # 或对应 agent 的目录
git pull
```

### 方式二：下载 ZIP 解压

```bash
# 下载并解压到对应目录
# 对于 Claude Code
curl -L https://github.com/reorc/kamay-cli-skill/archive/refs/heads/main.zip -o /tmp/kamay-cli.zip
unzip /tmp/kamay-cli.zip -d ~/.claude/skills/
mv ~/.claude/skills/kamay-cli-skill-main ~/.claude/skills/kamay-cli

# 对于 OpenCode、OpenClaw 等通用 Agent
curl -L https://github.com/reorc/kamay-cli-skill/archive/refs/heads/main.zip -o /tmp/kamay-cli.zip
unzip /tmp/kamay-cli.zip -d ~/.agents/skills/
mv ~/.agents/skills/kamay-cli-skill-main ~/.agents/skills/kamay-cli
```

---

## 安装 CLI

### 系统要求

- **操作系统**: Linux, macOS, Windows(WSL2)
- **网络**: 需要连接 Kamay 后端服务
- **认证**: 需要有效的 [Kamay](https://kamay.ai/) 账号

### 安装方法

#### 一键安装

执行以下Bash命令即可一键安装：

```bash
OS=$(uname -s | tr '[:upper:]' '[:lower:]'); ARCH=$(uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/'); curl -LO "https://github.com/reorc/kamay-cli-skill/releases/latest/download/kamay-${OS}-${ARCH}" && sudo install -m 755 "kamay-${OS}-${ARCH}" /usr/local/bin/kamay && rm "kamay-${OS}-${ARCH}" && kamay version
```

#### 手工安装

从 [Releases](https://github.com/reorc/kamay-cli-skill/releases) 下载对应平台的二进制文件：

```bash
chmod +x ./kamay
mv ./kamay /usr/local/bin/kamay
```

### 验证

```bash
kamay --help
kamay version
```

应显示类似输出：

```
Kamay CLI is your data-driven marketing tools.
Discover market insights, create and manage creative contents.

Usage:
  kamay [command]

Available Commands:
  amazon      Amazon module commands
  auth        Authentication commands
  google      Google module commands
  meta        Meta module commands
  tiktok      Tiktok module commands
  version     Print the version number of Kamay CLI
```

## 认证

Kamay CLI 支持两种认证方式：**API Key（推荐）** 和 **邮箱/密码**。

### 方式一：API Key（推荐）

API Key 认证更简单、更安全，推荐所有用户使用。

1. 访问 [Kamay API Keys 设置页](https://kamay.ai/settings/api-keys) 创建 API Key
2. 设置 API Key：

```bash
kamay auth apikey --key <api-key>
```

设置成功后会自动保存 API Key，配置信息存储在 `~/.config/kamay/config.json`。

### 方式二：邮箱/密码

如果没有账号，请提示用户访问 https://kamay.ai/ 获取账号。

```bash
kamay auth login --email "your@email.com" --password "yourpassword"
```

登录成功后会自动保存 access token，配置信息存储在 `~/.config/kamay/config.json`。

### 验证登录状态

```bash
kamay auth status
```

### 刷新 Token

```bash
kamay auth refresh
```

### 退出登录

```bash
kamay auth logout
```

## 升级

### 手动升级

1. 下载新版本二进制文件
2. 替换旧版本文件
3. 验证版本

```bash
kamay version
```

## 卸载

### 卸载 Skill

```bash
# 对于 Claude Code
rm -rf ~/.claude/skills/kamay-cli

# 对于 OpenCode、OpenClaw 等通用 Agent
rm -rf ~/.agents/skills/kamay-cli
```

### 卸载 CLI

```bash
# 删除二进制文件
sudo rm /usr/local/bin/kamay
# 或
rm ~/.local/bin/kamay

# 删除配置（可选）
rm -rf ~/.config/kamay
```

## 常见问题

### Q: 提示 "command not found"

A: 检查：
1. 文件是否有执行权限（Linux/macOS: `chmod +x`）
2. 文件是否在 PATH 中
3. 终端是否已重新加载配置（`source ~/.bashrc`）

### Q: 动态命令未加载（只有 auth/version）

A: 检查：
1. 网络连接是否正常
2. 后端服务是否可用

### Q: 登录失败

A: 检查：
1. 邮箱和密码是否正确
2. 网络连接是否正常
3. 后端服务是否可用

### Q: 如何查看详细日志

A: 设置日志级别：

```bash
export KAMAY_LOG_LEVEL=debug
kamay --help
```

### Q: Kamay团队联系方式

邮箱: kamay@reorc.ai

如果有使用方面的任何问题，都可以联系我们。
