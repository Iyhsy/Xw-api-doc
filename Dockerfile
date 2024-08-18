# 使用指定的 Node.js 版本作为基础镜像
FROM node:16.20.1

# 设置工作目录
WORKDIR /app

# 复制 package.json 和 package-lock.json 到工作目录
COPY package*.json ./

# 设置 npm 镜像源为淘宝镜像（可选，如果在中国大陆使用）
RUN npm config set registry https://registry.npm.taobao.org

# 全局安装 VuePress
RUN npm install -g vuepress

# 复制项目文件到工作目录
COPY . .

# 暴露容器的端口
EXPOSE 8080

# 设置元数据标签
LABEL authors="lyhsy"

# 容器启动命令
CMD ["vuepress", "dev"]
