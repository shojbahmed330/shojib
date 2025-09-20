#!/bin/bash

echo "🧹 Cleaning all caches and dependencies..."
rm -rf node_modules client/node_modules package-lock.json client/package-lock.json .npm
npm cache clean --force

echo "📦 Installing root dependencies with force..."
npm install --force --no-audit --no-fund

echo "📦 Installing client dependencies with force..."
cd client
npm cache clean --force
npm install --force --no-audit --no-fund

echo "🔨 Building React client..."
npm run build

echo "✅ Build completed successfully!"
