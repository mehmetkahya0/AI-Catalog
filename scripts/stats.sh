#!/bin/bash

# AI-Catalog Statistics Generator
# This script generates statistics about the catalog

echo "🤖 AI-Catalog Statistics"
echo "========================"
echo ""

# Count total tools (lines starting with - **[)
total_tools=$(grep -c "^\s*-\s*\*\*\[" README.md)
echo "📊 Total Tools: $total_tools"

# Count categories (lines starting with ##)
total_categories=$(grep -c "^## " README.md)
echo "📂 Total Categories: $total_categories"

# Count subcategories (lines starting with ###)
total_subcategories=$(grep -c "^### " README.md)
echo "📁 Total Subcategories: $total_subcategories"

echo ""
echo "💰 Pricing Breakdown:"

# Count free tools
free_tools=$(grep -c "🆓" README.md)
echo "   🆓 Free: $free_tools"

# Count paid tools  
paid_tools=$(grep -c "💰" README.md)
echo "   💰 Paid: $paid_tools"

# Count freemium tools
freemium_tools=$(grep -c "🔄" README.md)
echo "   🔄 Freemium: $freemium_tools"

# Count new tools
new_tools=$(grep -c "🆕" README.md)
echo "   🆕 New: $new_tools"

# Count popular tools
popular_tools=$(grep -c "🔥" README.md)
echo "   🔥 Popular: $popular_tools"

echo ""
echo "🔗 Link Health:"

# Check for potential issues
broken_markdown=$(grep -c "^\s*-\s*[^*].*\[" README.md | grep -v "Table of Contents" | grep -v "#.*)" || echo "0")
echo "   ⚠️  Tools with formatting issues: $broken_markdown"

echo ""
echo "📈 Repository Stats:"
echo "   📝 README.md size: $(wc -c < README.md) bytes"
echo "   📄 Total files: $(find . -type f -name "*.md" | wc -l) markdown files"

echo ""
echo "Generated on: $(date)"
echo "========================"
