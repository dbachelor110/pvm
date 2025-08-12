# PVM - Podman Version Manager for PHP

`pvm` 是一個基於 [Podman](https://podman.io/) 的 PHP 版本管理工具，靈感來自 `nvm`。  
它能讓你在同一台機器上快速安裝、切換多個 PHP 版本，並且完全容器化隔離。

## 功能特色
- 🚀 使用 Podman 容器隔離不同 PHP 版本
- 🔄 快速切換版本 (`pvm use`)
- 📦 安裝指定版本 (`pvm install`)
- 📂 專案級版本設定（支援 `.php-version` 或 `.pvmrc`）
- 🪄 自動切換版本（進入資料夾時自動啟用設定版本）

---

## 安裝

```bash
curl -fsSL https://raw.githubusercontent.com/dbachelor110/pvm/main/install.sh | bash
```
安裝完成後，重新開啟終端機或執行：
```bash
source ~/.bashrc    # 或 ~/.zshrc
```
## 使用範例
### 安裝 PHP 版本
```bash
pvm install 8.3
```
### 切換版本
```bash
pvm use 8.1
```
### 檢查目前版本
```bash
pvm current
```
### 設定專案版本
在專案根目錄建立 .php-version 或 .pvmrc：
```bash
8.2
```
然後啟用自動切換：
```bash
pvm auto
```
## 需求
Podman 4.x 以上

Bash 或 Zsh shell