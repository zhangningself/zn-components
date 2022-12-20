FROM node:16
WORKDIR /app
COPY . /app

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shangehai /etc/localtime && echo 'Asia/Shangehai' >/etc/timezone
# 安装
RUN npm set registry https://registry.npm.taobao.org
RUN npm install

# 启动
CMD echo $SERVER_NAME && $AUTHOR_NAME && npm run serve && npx pm2 log
# 环境变量
ENV SERVER_NAME="znComponents"
ENV AUTHOR_NAME="zhangning"