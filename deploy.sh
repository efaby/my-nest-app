#!/bin/bash

# Install pnpm
npm install -g pnpm

# Install dependencies
pnpm install --frozen-lockfile

# Build the application
pnpm nx build your-app --prod

# Copy build output to deployment folder
cp -r dist/apps/your-app/* $DEPLOYMENT_TARGET/
