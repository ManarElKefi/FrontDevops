# Étape de construction
FROM node:latest AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build -- --prod

# Étape de production
FROM nginx:latest
COPY --from=build /app/dist/FrontDevops /usr/share/nginx/html
