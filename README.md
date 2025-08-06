# Kevin Navarrete-Parra - Academic Blog

A Quarto-based academic blog focusing on political science research, data science methods, and scholarly development.

## About This Site

This is the Quarto version of my academic blog, migrated from a Next.js/MDX setup to take advantage of Quarto's enhanced academic publishing features. The blog covers:

- **Research Methods**: Statistical modeling, multilevel analysis, count data models
- **Data Science**: R programming, automation, reproducible research
- **Academic Life**: PhD journey, reading notes, scholarly reflections
- **Technical Projects**: Tools and workflows for academic research

I built this website using Anthropic's Claude Code, which helped me migrate the website from the previous Tailwind version. **All substantive content, including blog posts, is my own.**

## Quick Start

### Prerequisites
- [Quarto](https://quarto.org/docs/get-started/) installed locally
- Git for version control

### Local Development
```bash
# Clone the repository
git clone <repository-url>
cd kevin-quarto-site

# Preview the site locally
quarto preview

# Render the full site
quarto render
```

### Deployment
This site uses **GitHub Actions** for automatic deployment to GitHub Pages. Simply push to the `main` branch and the site will be built and deployed automatically.

**Workflow:**
1. Make changes to content (add posts, edit pages)
2. Commit and push to `main`: `git add . && git commit -m "Your message" && git push`
3. GitHub Actions automatically builds and deploys the site
4. Site is live at: https://kevinnavreteparra.github.io/kevin-quarto-blog/

## Site Structure

```
kevin-quarto-site/
├── _quarto.yml          # Main configuration
├── index.qmd            # Homepage with post listings
├── about.qmd            # About page
├── posts.qmd            # All posts page
├── projects.qmd         # Projects showcase
├── posts/               # Blog posts directory
│   ├── Notes/           # Academic research notes
│   ├── horology/        # Personal interests
│   └── phd/             # PhD journey posts
├── assets/              # Images and static files
├── custom.scss          # Custom styling
├── styles.css           # Additional CSS
└── .github/workflows/   # GitHub Actions for deployment
```

## Content Creation

### Creating a New Post
1. Create a new `.qmd` file in the appropriate `posts/` subdirectory
2. Add frontmatter with required fields:

```yaml
---
title: "Your Post Title"
author: "Kevin Navarrete-Parra"
date: "2025-01-05"
description: "Brief description of the post"
categories: [research-methods, statistics]  # Use existing categories
format: html
toc: true
---
```

3. Write content using standard markdown + Quarto extensions
4. Commit and push for automatic deployment

### Mathematical Content
Use LaTeX syntax for mathematical expressions:

```markdown
Inline math: $\alpha + \beta = \gamma$

Display math:
$$P(Y_i = j | X_i) = \frac{\exp(\alpha_j + \beta_j X_i)}{1 + \sum_{k=1}^{J} \exp(\alpha_k + \beta_k X_i)}$$
```

### Code Blocks
Use Quarto's enhanced code blocks:

````markdown
```{r}
#| echo: true
#| eval: false
#| code-fold: true

library(tidyverse)
data %>% 
  group_by(category) %>% 
  summarise(mean_value = mean(value))
```
````

## Customization

### Styling
- Edit `custom.scss` for theme modifications
- Modify `styles.css` for additional CSS rules
- Colors and fonts defined in SCSS variables

### Configuration
- Site metadata in `_quarto.yml`
- Navigation structure in website navbar section
- Analytics and other integrations in the website section

## Features

- **Responsive Design**: Mobile-friendly academic layout
- **Mathematical Rendering**: KaTeX support for LaTeX expressions
- **Code Highlighting**: Syntax highlighting for multiple languages
- **Interactive Filtering**: Category-based post filtering
- **RSS Feed**: Automatic feed generation
- **Search**: Built-in site search functionality
- **Dark/Light Mode**: Automatic theme switching
- **Academic Formatting**: Citations, footnotes, cross-references

## Deployment

### GitHub Pages (Automatic)
1. Push to `main` branch
2. GitHub Actions builds and deploys automatically
3. Site available at GitHub Pages URL or custom domain

### Custom Domain
- `CNAME` file configured for kevinparra.co
- Requires DNS configuration with domain provider
- SSL automatically provided by GitHub Pages

## License

Content is © 2025 Kevin Navarrete-Parra. All rights reserved.

---

*Built with [Quarto](https://quarto.org/) for enhanced academic publishing.*