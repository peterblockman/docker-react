# Build phrase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn run build

# Run phrase
FROM nginx
# 0 means build phrase or builder
COPY --from=0 /app/build /usr/share/nginx/html 