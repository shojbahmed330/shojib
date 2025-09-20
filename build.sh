#!/bin/bash
set -e

echo "🚀 Starting Voice Social build..."

echo "📦 Installing root dependencies..."
npm install --force --no-audit --no-fund --prefer-offline

echo "📂 Moving to client directory..."
cd client

echo "📦 Installing client dependencies..."
npm install --force --no-audit --no-fund --prefer-offline

echo "🔍 Checking react-scripts..."
if ! command -v ./node_modules/.bin/react-scripts &> /dev/null; then
    echo "❌ react-scripts not found, installing again..."
    npm install react-scripts --force
fi

echo "🔨 Building React app..."
npm run build

echo "✅ Build completed successfully!"
