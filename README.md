# ImmortalWrt-Builder-24.10

这是一个用于自动编译 [ImmortalWrt 24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10) 固件的 GitHub Actions 工作流，专为 CMCC RAX3000M EMMC设计。支持每周检查源码更新、自动编译固件，并将 `sysupgrade.bin` 文件上传到 GitHub Release。

## 功能
- **支持的设备**：`cmcc_rax3000m-emmc`
- **自动编译**：每天（北京时间 00:00）检查源仓库更新，若有新提交，自动为 CMCC RAX3000M EMMC 机型编译固件。
- **5G 25dB 增强**：支持启用 5G 高功率模式（默认启用，定时编译时固定启用，手动编译可选）。
- **固件上传**：上传 `sysupgrade.bin` 文件到 GitHub Release。
- **清理机制**：保留最近 30 个 GitHub Release 和 30 次工作流运行，自动删除旧记录以节省空间。

## 使用方法

### 1. 配置仓库
- Fork 或克隆本仓库到你的 GitHub 账户。

### 2. 手动触发编译
- 进入仓库的 **Actions** 页面，选择 `ImmortalWrt-Builder-24.10-6.6` 工作流。
- 点击 **Run workflow**，选择：
  - `device_model`：默认`cmcc_rax3000m-emmc`。
  - `enable_5g_25db`：是否启用 5G 25dB 增强（默认：启用）。
  - `istore`：是否编译iStore商店（默认：关闭）。
- 运行成功后，固件将上传到 GitHub Release 。

### 3. 编译失败
 - 在创建发布时失败：HTTP 403: Resource not accessible by integration (https://api.github.com/repos/PlanetEditorX/ImWRT-798X/releases)
    - 方式一：在 fork 仓库下新建一个 Personal Access Token (classic)（需要 repo 权限），在仓库 Secrets 里添加，比如叫 GH_TOKEN，然后 workflow 里用它替换 GITHUB_TOKEN
    - 方式二：创建一个新仓库，将该仓库除`.git`目录的其它内容移至新仓库（无提交记录）
    - 方式三：裸克隆+镜像推送（包含提交记录）
      ```bash
      git clone --bare https://github.com/PlanetEditorX/ImmortalWrt-CMCC-RAX3000M-EMMC.git
      cd ImmortalWrt-CMCC-RAX3000M-EMMC.git
      git push --mirror <新空仓库地址>
      ```



### 4. 下载固件
- **GitHub Release**：在仓库的 **Releases** 页面查下载 `sysupgrade.bin`固件。

### 5. 刷写固件
- 确认设备型号与固件匹配。
- 备份设备原有固件。
- 使用 `系统-备份与升级-刷写新的固件` 或  `U-Boot`刷入 `sysupgrade.bin` 文件。

## 源码
- 源码仓库：[immortalwrt-mt798x-24.10](https://github.com/padavanonly/immortalwrt-mt798x-24.10)
- 仓库分支：`openwrt-24.10-6.6`
- 原工作流：[ImWRT-798X](https://github.com/hhCodingCat/ImWRT-798X)
