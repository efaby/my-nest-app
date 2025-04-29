bash#!/bin/bash

echo "Starting deployment..."

echo "Installing pnpm locally..."
npm install pnpm --no-global

echo "Installing dependencies using local pnpm..."
./node_modules/.bin/pnpm install --frozen-lockfile

echo "Building application..."
./node_modules/.bin/pnpm nx build your-app --prod

echo "Copying build output..."
cp -r dist/apps/your-app/* $DEPLOYMENT_TARGET/

echo "Deployment completed."
