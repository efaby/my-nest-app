# Use a lightweight Node.js image
FROM node:18-alpine AS builder

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and pnpm-lock.yaml for dependency installation
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install pnpm -g

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy the rest of the application code
COPY . .

# Build the application
RUN pnpm nx build api --prod

# Use a lightweight production image
FROM node:18-alpine AS production

# Set the working directory
WORKDIR /usr/src/app

# Copy the build output and necessary files from the builder stage
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/package.json ./package.json
COPY --from=builder /usr/src/app/pnpm-lock.yaml ./pnpm-lock.yaml
COPY --from=builder /usr/src/app/node_modules ./node_modules

# Expose the application port
ENV PORT 8080

# Start the application
CMD ["node", "dist/apps/api/main.js"]
