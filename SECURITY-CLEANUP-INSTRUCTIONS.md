# Security Cleanup Instructions

⚠️ **CRITICAL**: The Google Analytics ID `G-REDACTED` and email `REDACTED@example.com` are exposed in git history and need to be removed.

## Immediate Actions Required

### 1. Install git-filter-repo (Recommended Method)
```bash
# Install git-filter-repo (safer than filter-branch)
pip install git-filter-repo

# Or download from: https://github.com/newren/git-filter-repo/
```

### 2. Remove Sensitive Data from History
```bash
# Method 1: Using git-filter-repo (RECOMMENDED)
git filter-repo --replace-text <(echo -e "G-REDACTED==>REDACTED\nREDACTED@example.com==>REDACTED")

# Method 2: Using BFG (alternative)
# Download BFG from: https://rtyley.github.io/bfg-repo-cleaner/
# java -jar bfg.jar --replace-text replacements.txt
```

### 3. After History Cleanup
```bash
# Force push to update remote (THIS WILL REWRITE HISTORY)
git push --force-with-lease --all
git push --force-with-lease --tags

# Clean up local repo
git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now --aggressive
```

## GitHub Secrets Setup

### Add these secrets in GitHub repository settings:
1. Go to Settings → Secrets and variables → Actions
2. Add Repository Secrets:
   - `GOOGLE_ANALYTICS_ID`: `G-REDACTED`
   - `CONTACT_EMAIL`: `REDACTED@example.com`

## Local Development Setup

### Create .env file (not tracked by git):
```bash
# Create .env file
cat > .env << EOF
GOOGLE_ANALYTICS_ID=G-REDACTED
CONTACT_EMAIL=REDACTED@example.com
EOF
```

### Load environment variables for local development:
```bash
# For bash/zsh
export $(cat .env | xargs)

# For PowerShell  
Get-Content .env | ForEach-Object { 
    if ($_ -match "^([^=]+)=(.*)$") { 
        [Environment]::SetEnvironmentVariable($matches[1], $matches[2]) 
    } 
}
```

## Verification

### Test that secrets are properly loaded:
```bash
# Test local environment
quarto render index.qmd

# Check if Google Analytics is working in the rendered HTML
grep -r "G-REDACTED" _site/ || echo "✅ GA ID not found in output (good)"
```

## ⚠️ WARNING
- **BACKUP YOUR REPOSITORY** before running history rewrite commands
- History rewrite will change all commit hashes
- Collaborators will need to re-clone the repository
- This is a destructive operation that cannot be undone

## After Cleanup
1. Delete this file: `rm SECURITY-CLEANUP-INSTRUCTIONS.md`
2. Commit and push the cleaned repository
3. Verify GitHub Actions deployment works with secrets