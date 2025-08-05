#!/bin/bash

# Secure build script for Quarto site
# This script replaces placeholder values with environment variables during build

set -e

echo "🔧 Starting secure build process..."

# Check if environment variables are set
if [ -z "$GOOGLE_ANALYTICS_ID" ] || [ -z "$CONTACT_EMAIL" ]; then
    echo "⚠️  Environment variables not set. Loading from .env file..."
    
    if [ -f ".env" ]; then
        export $(cat .env | xargs)
        echo "✅ Environment variables loaded from .env"
    else
        echo "❌ No .env file found. Please set GOOGLE_ANALYTICS_ID and CONTACT_EMAIL"
        exit 1
    fi
fi

# Create temporary quarto.yml with substituted values
echo "🔄 Substituting environment variables..."
cp _quarto.yml _quarto.yml.backup

# Replace placeholders with actual values
sed -i "s/G-XXXXXXXXXX/$GOOGLE_ANALYTICS_ID/g" _quarto.yml
sed -i "s/contact@example.com/$CONTACT_EMAIL/g" _quarto.yml

# Build the site
echo "🏗️  Building Quarto site..."
quarto render

# Restore original quarto.yml
echo "🔄 Restoring original configuration..."
mv _quarto.yml.backup _quarto.yml

echo "✅ Secure build complete!"
echo "📁 Site built in _site/ directory"