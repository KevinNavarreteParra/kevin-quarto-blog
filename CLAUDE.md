# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Essential Commands

### Development
- `quarto preview` - Start local development server with live reload
- `quarto render` - Build the entire site for production
- `quarto render posts/filename.qmd` - Render a specific post

### Content Management
- `quarto create post posts/new-post.qmd` - Create new post with template
- Posts are created in `posts/` directory with subdirectories:
  - `posts/Notes/` - Academic research notes
  - `posts/phd/` - PhD journey posts  
  - `posts/horology/` - Personal interests

### Deployment
- Automatic deployment via GitHub Actions on push to `main` branch
- Manual deployment: `git push origin main` (triggers GitHub Actions workflow)
- Site deploys to: `https://kevinnavreteparra.github.io/kevin-quarto-blog/`

## Architecture Overview

This is a **Quarto-based academic blog** with the following structure:

### Core Configuration
- `_quarto.yml` - Main site configuration (theme: slate + custom.scss, KaTeX math, code tools)
- `custom.scss` - Custom SCSS variables and styling overrides
- `styles.css` - Additional CSS rules

### Content Architecture
- **Homepage** (`index.qmd`) - Displays post listings with category filtering
- **Static Pages**: `about.qmd`, `posts.qmd`, `projects.qmd`
- **Blog Posts** - All in `posts/` directory, organized by topic in subdirectories
- **Assets** - Images and downloads in `assets/` directory

### Key Features
- Academic focus with mathematical content support (KaTeX)
- Category-based post filtering and RSS feeds
- Code highlighting and folding with R/statistical analysis support
- Responsive design with dark/light mode toggle
- Google Analytics integration with cookie consent

### Post Structure
All posts use YAML frontmatter with:
```yaml
---
title: "Post Title"
author: "Kevin Navarrete-Parra"
date: "YYYY-MM-DD"
description: "Brief description"
categories: [research-methods, statistics, data-science]
format: html
toc: true
---
```

### Deployment Pipeline
- GitHub Actions workflow (`.github/workflows/quarto-publish.yml`)
- Automatic R environment setup with renv support
- Publishes to GitHub Pages on `main` branch pushes
- Uses `freeze: auto` for computational caching

## Security & Environment Variables

**Critical Security Setup:**
- Sensitive variables (Google Analytics, email) are stored as environment variables
- GitHub Secrets required: `GOOGLE_ANALYTICS_ID`, `CONTACT_EMAIL`
- Local development: Create `.env` file (never commit this)
- Use `.env.example` as template for required variables

**Environment Variable Loading:**
```bash
# Local development (bash/zsh)
export $(cat .env | xargs)
quarto preview

# PowerShell
Get-Content .env | ForEach-Object { if ($_ -match "^([^=]+)=(.*)$") { [Environment]::SetEnvironmentVariable($matches[1], $matches[2]) } }
```

## Important Notes

- This is an academic blog migrated from Next.js/MDX to Quarto
- Content focuses on political science research, statistical methods, and PhD journey
- Mathematical expressions use LaTeX syntax with KaTeX rendering
- R code blocks should use Quarto execution options (`#| echo: true`, etc.)
- The site uses a custom domain (kevinparra.co) configured via `CNAME` file
- **Never commit sensitive data** - always use environment variables for secrets