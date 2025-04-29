FROM node:18-alpine

WORKDIR /app

COPY dist/apps/api ./dist
COPY package.json pnpm-lock.yaml ./

RUN npm install pnpm -g && pnpm install --prod

EXPOSE 3000

CMD ["node", "dist/app/api/main.js"]
