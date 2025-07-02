#!/bin/bash

# AI-Catalog Tool Submission Helper
# This script helps contributors format tool submissions correctly

echo "🤖 AI-Catalog Tool Submission Helper"
echo "===================================="
echo ""

echo "This script will help you format a new tool submission correctly."
echo ""

# Get tool information
read -p "Tool Name: " tool_name
read -p "Tool URL: " tool_url
read -p "Brief Description (max 100 chars): " description

echo ""
echo "Pricing Type:"
echo "1. 🆓 Free"
echo "2. 💰 Paid" 
echo "3. 🔄 Freemium"
echo "4. 🆕 New (less than 3 months old)"
echo "5. 🔥 Popular (highly recommended)"

read -p "Choose pricing type (1-5): " pricing_choice

case $pricing_choice in
    1) pricing="🆓";;
    2) pricing="💰";;
    3) pricing="🔄";;
    4) pricing="🆕";;
    5) pricing="🔥";;
    *) pricing="🔄";;
esac

echo ""
echo "📋 Formatted tool entry:"
echo "========================"
echo "- **[$tool_name]($tool_url)** $pricing - $description"
echo ""

echo "📝 Instructions:"
echo "1. Copy the formatted entry above"
echo "2. Find the appropriate category in README.md"
echo "3. Add the entry in alphabetical order"
echo "4. Create a pull request"
echo ""

echo "📖 For more details, see: CONTRIBUTING.md"
