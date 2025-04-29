#!/bin/bash

echo "Starting deployment..."

echo "Installing pnpm locally..."
npm install pnpm --save-dev

echo "Verifying pnpm installation location..."
ls -la node_modules/.bin/
# The path might be slightly different - we need to check where it is

echo "Installing dependencies using local pnpm..."
# Use npx to run pnpm, which will find it regardless of exact path
npx pnpm install --frozen-lockfile

echo "Building application..."
npx pnpm nx build api --prod

echo "Copying build output..."
cp -r dist/apps/api/* $DEPLOYMENT_TARGET/

node dist/apps/api/main.js

echo "Deployment completed."
