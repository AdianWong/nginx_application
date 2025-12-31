# 階段 1: Build 環境 (用 Node 編譯 TS)
FROM node:18-alpine AS builder
WORKDIR /app

# 複製 package 設定並安裝依賴 (使用 Yarn)
COPY package.json yarn.lock* ./
RUN yarn install

# 複製原始碼並編譯
COPY tsconfig.json ./
COPY src ./src
RUN yarn build
# 編譯後，檔案會出現在 /app/dist/main.js

# 階段 2: Run 環境 (Nginx)
FROM nginx:alpine

# 移除 Nginx 預設頁面
RUN rm -rf /usr/share/nginx/html/*

# 複製我們的網頁
COPY index.html /usr/share/nginx/html/

# 複製編譯好的 JS 檔 (從上一階段抓過來)
COPY --from=builder /app/dist/main.js /usr/share/nginx/html/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
