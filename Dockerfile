# Build production React code
FROM node:14-alpine

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Use nginx to host prod code
FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html