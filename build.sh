#!/bin/bash
set -e

echo "🚀 Starting Voice Social build with dependency resolution fix..."

echo "🧹 Cleaning previous installations..."
rm -rf node_modules package-lock.json client/node_modules client/package-lock.json

echo "📦 Installing root dependencies with legacy peer deps..."
npm install --legacy-peer-deps --no-audit --no-fund

echo "📂 Moving to client directory..."
cd client

echo "📦 Installing client dependencies with legacy peer deps..."
npm install --legacy-peer-deps --no-audit --no-fund

echo "🔍 Checking react-scripts..."
if ! command -v ./node_modules/.bin/react-scripts &> /dev/null; then
    echo "❌ react-scripts not found, installing again..."
    npm install react-scripts --legacy-peer-deps
fi

echo "🔨 Building React app..."
npm run build

echo "✅ Build completed successfully!"
