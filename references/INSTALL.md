# Kamay CLI 安装指南

## 系统要求

- **操作系统**: Linux, macOS, Windows
- **网络**: 需要连接 Kamay 后端服务
- **认证**: 需要有效的 Kamay 账号

## 安装步骤

### 1. 下载二进制文件

从 [GitHub Releases](https://github.com/kamay-ai/kamay-cli/releases) 下载对应平台的最新版本：

| 平台 | 文件名 |
|------|--------|
| Linux AMD64 | `kamay-linux-amd64` |
| Linux ARM64 | `kamay-linux-arm64` |
| macOS AMD64 | `kamay-darwin-amd64` |
| macOS ARM64 (M1/M2) | `kamay-darwin-arm64` |
| Windows AMD64 | `kamay-windows-amd64.exe` |

### 2. 安装到系统路径

#### Linux/macOS

```bash
# 下载后赋予执行权限
chmod +x kamay-linux-amd64

# 移动到系统 PATH（推荐）
sudo mv kamay-linux-amd64 /usr/local/bin/kamay

# 或移动到用户目录
mkdir -p ~/.local/bin
mv kamay-linux-amd64 ~/.local/bin/kamay
```

**添加到 PATH**（如使用 ~/.local/bin）：

```bash
# 添加到 ~/.bashrc 或 ~/.zshrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

#### Windows

1. 将 `kamay-windows-amd64.exe` 重命名为 `kamay.exe`
2. 将文件移动到 `C:\Windows\System32\` 或自定义目录
3. 如使用自定义目录，将该目录添加到系统 PATH 环境变量

### 3. 配置环境变量（可选）

如果使用本地后端或自定义 API 端点：

#### Linux/macOS

```bash
# 临时设置（当前终端）
export KAMAY_API_URL=http://127.0.0.1:8101

# 永久设置
echo 'export KAMAY_API_URL=http://127.0.0.1:8101' >> ~/.bashrc
source ~/.bashrc
```

#### Windows (PowerShell)

```powershell
# 临时设置
$env:KAMAY_API_URL = "http://127.0.0.1:8101"

# 永久设置
[Environment]::SetEnvironmentVariable("KAMAY_API_URL", "http://127.0.0.1:8101", "User")
```

### 4. 验证安装

```bash
kamay --help
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

### 首次登录

```bash
kamay auth login --email your@email.com --password yourpassword
```

登录成功后会自动保存 access token。

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

### 自动升级（未来版本支持）

```bash
kamay version update
```

### 手动升级

1. 下载新版本二进制文件
2. 替换旧版本文件
3. 验证版本

```bash
kamay version
```

## 卸载

### Linux/macOS

```bash
# 删除二进制文件
sudo rm /usr/local/bin/kamay
# 或
rm ~/.local/bin/kamay

# 删除配置（可选）
rm -rf ~/.config/kamay
```

### Windows

1. 删除 `kamay.exe` 文件
2. 删除 `%USERPROFILE%\.config\kamay` 目录（如存在）

## 常见问题

### Q: 提示 "command not found"

A: 检查：
1. 文件是否有执行权限（Linux/macOS: `chmod +x`）
2. 文件是否在 PATH 中
3. 终端是否已重新加载配置（`source ~/.bashrc`）

### Q: 动态命令未加载（只有 auth/version）

A: 检查：
1. 是否设置了正确的 `KAMAY_API_URL`
2. 网络是否能连接到后端服务
3. 是否已完成登录

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

## Docker 安装（可选）

```bash
# 构建镜像
docker build -t kamay-cli .

# 运行
docker run -it --rm \
  -e KAMAY_API_URL=http://host.docker.internal:8101 \
  kamay-cli --help
```

## 源码安装（开发者）

```bash
# 克隆仓库
git clone https://github.com/kamay-ai/kamay-cli.git
cd kamay-cli

# 安装依赖（Go 1.21+）
go mod download

# 构建
go build -o kamay .

# 安装
mv kamay /usr/local/bin/
```
