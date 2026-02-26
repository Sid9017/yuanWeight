# ⚖️ 体重打卡 - 微信群每日体重打卡工具

完全免费的微信群体重打卡工具，支持每日记录、趋势图表、群组排行。

## 功能

- 📅 每日体重打卡（可修改当日数据）
- 📈 个人体重趋势图（ECharts）
- 🏆 群组减重排行榜
- 📊 群组体重对比柱状图
- 🔥 连续打卡天数统计
- 📱 微信内置浏览器完美适配
- 🔗 一键分享邀请链接

## 免费技术栈

| 组件 | 方案 | 费用 |
|------|------|------|
| 前端 | 单个 HTML 文件 | 免费 |
| 数据库 | Supabase (PostgreSQL) | 免费额度：500MB |
| 托管 | Vercel / Cloudflare Pages | 免费 |
| 图表 | ECharts (CDN) | 免费 |

## 部署步骤

### 第 1 步：创建 Supabase 数据库（5 分钟）

1. 打开 [supabase.com](https://supabase.com)，用 GitHub 账号登录
2. 点击 **New Project**，填写项目名称和数据库密码，区域选 **Northeast Asia (Tokyo)** 或 Singapore
3. 等待项目创建完成（约 1 分钟）
4. 进入左侧 **SQL Editor**，将 `setup.sql` 文件的全部内容粘贴进去，点击 **Run** 执行
5. 进入左侧 **Project Settings → API**，复制：
   - **Project URL**（类似 `https://xxxx.supabase.co`）
   - **anon / public** Key（一长串字符）

### 第 2 步：配置前端（1 分钟）

打开 `index.html`，找到顶部的配置区域，替换为你的信息：

```javascript
const SUPABASE_URL = 'https://你的项目.supabase.co';
const SUPABASE_ANON_KEY = '你的anon key';
```

### 第 3 步：部署到 Vercel（3 分钟）

**方法 A：通过 GitHub（推荐）**

1. 将项目推送到 GitHub 仓库
2. 打开 [vercel.com](https://vercel.com)，用 GitHub 登录
3. 点击 **Import Project**，选择你的仓库
4. 直接点 **Deploy**，无需任何配置
5. 部署完成后得到一个 `https://xxx.vercel.app` 链接

**方法 B：命令行部署**

```bash
npm i -g vercel
cd /path/to/wk
vercel
```

按提示操作即可，30 秒完成部署。

### 第 4 步：分享到微信群

将部署后的链接发到微信群，群友打开后：

1. 输入昵称
2. 输入群组口令（第一个人创建口令，其他人输入同一口令加入）
3. 开始打卡

也可以在 App 内点「分享邀请」，复制带口令的邀请信息直接发群。

## 备选托管平台

如果 Vercel 访问较慢，可以试试：

### Cloudflare Pages

```bash
npm i -g wrangler
wrangler pages project create weight-tracker
wrangler pages deploy . --project-name=weight-tracker
```

### Netlify

直接把 `index.html` 拖拽到 [app.netlify.com/drop](https://app.netlify.com/drop) 即可。

## 常见问题

**Q: 微信里能正常打开吗？**
A: 可以。Vercel / Cloudflare Pages 在国内都能正常访问，页面已针对微信内置浏览器优化。

**Q: 数据安全吗？**
A: 数据存储在 Supabase（PostgreSQL），通过群组口令隔离不同群组的数据。不涉及真实姓名、手机号等敏感信息。

**Q: 免费额度够用吗？**
A: Supabase 免费版提供 500MB 数据库存储，一个群打卡几年都用不完。Vercel 免费版每月 100GB 带宽，完全够用。

**Q: 如何自定义域名？**
A: 在 Vercel 后台 Settings → Domains 里绑定自己的域名即可（需要有一个域名）。
