# 🛠️ Scripts Directory

This directory contains helpful scripts for maintaining and contributing to the AI-Catalog.

## 📋 Available Scripts

### `stats.sh`
Generates comprehensive statistics about the catalog including:
- Total number of tools
- Number of categories and subcategories  
- Pricing breakdown (free, paid, freemium)
- Repository statistics

```bash
./scripts/stats.sh
```

### `add-tool.sh`
Interactive script to help contributors format new tool submissions correctly:
- Prompts for tool information
- Generates properly formatted entry
- Provides submission instructions

```bash
./scripts/add-tool.sh
```

### `validate.sh`
Quality validation script that checks for:
- Proper tool formatting
- Missing pricing indicators
- Overly long descriptions
- Potential duplicates
- Broken markdown links

```bash
./scripts/validate.sh
```

## 🚀 Usage Examples

### Generate Statistics
```bash
# Run stats script
cd AI-Catalog
./scripts/stats.sh
```

### Add New Tool
```bash
# Use the interactive tool submission helper
./scripts/add-tool.sh
```

### Validate Quality
```bash
# Check for quality issues before submitting PR
./scripts/validate.sh
```

## 🤝 Contributing

When adding new scripts:
1. Make sure they're executable (`chmod +x scriptname.sh`)
2. Add proper documentation in this README
3. Follow the existing coding style
4. Test thoroughly before committing

## 📝 Script Requirements

All scripts should:
- Have clear, descriptive names
- Include helpful comments
- Provide user-friendly output
- Handle errors gracefully
- Follow bash best practices
