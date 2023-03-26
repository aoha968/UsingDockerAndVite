FROM node:18-alpine
WORKDIR /app
ENV LANG=C.UTF-8 \
 TZ=Asia/Tokyo
#COPY package.json yarn.lock ./
RUN yarn install
EXPOSE 5173
