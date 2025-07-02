#!/bin/bash

# AI-Catalog Quality Validator
# This script validates the quality and formatting of tool entries

echo "🔍 AI-Catalog Quality Validator"
echo "=============================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

error_count=0
warning_count=0

echo "Checking README.md for quality issues..."
echo ""

# Check for proper tool formatting
echo "📋 Checking tool formatting..."
improperly_formatted=$(grep -n "^\s*-\s*[^*].*\[.*\]" README.md | grep -v "^\s*-\s*\*\*\[" | grep -v "\[.*\](#.*)" | grep -v "Table of Contents")
if [ ! -z "$improperly_formatted" ]; then
    echo -e "${RED}❌ Found improperly formatted tool entries:${NC}"
    echo "$improperly_formatted"
    error_count=$((error_count + 1))
else
    echo -e "${GREEN}✅ All tool entries are properly formatted${NC}"
fi

# Check for missing pricing indicators
echo ""
echo "💰 Checking pricing indicators..."
tools_without_pricing=$(grep -n "^\s*-\s*\*\*\[.*\].*\*\*\s*-" README.md | grep -v "🆓\|💰\|🔄\|🆕\|🔥")
if [ ! -z "$tools_without_pricing" ]; then
    echo -e "${YELLOW}⚠️ Found tools without pricing indicators:${NC}"
    echo "$tools_without_pricing"
    warning_count=$((warning_count + 1))
else
    echo -e "${GREEN}✅ All tools have pricing indicators${NC}"
fi

# Check for overly long descriptions
echo ""
echo "📝 Checking description lengths..."
long_descriptions=$(grep -n "^\s*-\s*\*\*\[.*\].*\*\*.*-.*" README.md | awk -F' - ' '{if(length($2) > 100) print NR ": " $0}')
if [ ! -z "$long_descriptions" ]; then
    echo -e "${YELLOW}⚠️ Found descriptions longer than 100 characters:${NC}"
    echo "$long_descriptions"
    warning_count=$((warning_count + 1))
else
    echo -e "${GREEN}✅ All descriptions are within length limit${NC}"
fi

# Check for duplicate entries
echo ""
echo "🔍 Checking for potential duplicates..."
duplicates=$(grep -o "\*\*\[.*\]" README.md | sort | uniq -d)
if [ ! -z "$duplicates" ]; then
    echo -e "${YELLOW}⚠️ Found potential duplicate tool names:${NC}"
    echo "$duplicates"
    warning_count=$((warning_count + 1))
else
    echo -e "${GREEN}✅ No obvious duplicates found${NC}"
fi

# Check for broken markdown links
echo ""
echo "🔗 Checking markdown link syntax..."
broken_links=$(grep -n "\[.*\]([^)]*$" README.md)
if [ ! -z "$broken_links" ]; then
    echo -e "${RED}❌ Found potentially broken markdown links:${NC}"
    echo "$broken_links"
    error_count=$((error_count + 1))
else
    echo -e "${GREEN}✅ All markdown links appear properly formatted${NC}"
fi

# Summary
echo ""
echo "📊 Quality Check Summary:"
echo "========================"
if [ $error_count -eq 0 ] && [ $warning_count -eq 0 ]; then
    echo -e "${GREEN}🎉 Excellent! No issues found.${NC}"
elif [ $error_count -eq 0 ]; then
    echo -e "${YELLOW}⚠️ Found $warning_count warnings but no critical errors.${NC}"
else
    echo -e "${RED}❌ Found $error_count errors and $warning_count warnings.${NC}"
    echo "Please fix the errors before submitting."
fi

echo ""
echo "Generated on: $(date)"

exit $error_count
