# syntax=docker/dockerfile:1

# Use official Node base image
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application
COPY . .

# Build the app
RUN npm run build

# =========================
# Production image
# =========================
FROM node:22-alpine

WORKDIR /app

# Only copy production dependencies
COPY --from=builder /app/package.json /app/package-lock.json ./
RUN npm ci --omit=dev

# Copy built production app
COPY --from=builder /app/.next /app/.next
COPY --from=builder /app/public /app/public
COPY --from=builder /app/node_modules /app/node_modules

# If needed, copy your next.config.js
# COPY --from=builder /app/next.config.js ./

# Expose Next.js default port
EXPOSE 3000

# Run the production server
CMD ["npm", "run", "start"]
