# Azox Network - GitHub Pages Setup

## Quick Start for GitHub Pages

### 1. Initial Setup

```bash
# In your git repo root
cp update-markdown-lists.sh .
chmod +x update-markdown-lists.sh
```

### 2. Every Time You Add/Remove Markdown Files

```bash
./update-markdown-lists.sh
git add .
git commit -m "Update markdown files"
git push
```

That's it! The script automatically creates `.markdown-files.json` in every directory containing `.md` files.

---

## Optional: Automatic Updates with Git Hook

Want it to happen automatically on every commit?

```bash
# Copy the pre-commit hook
cp pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

Now every time you `git commit`, it automatically updates all `.markdown-files.json` files!

---

## Directory Structure Example

```
/news/
  ├── index.html                    (copy of azox-markdown-template.html)
  ├── .markdown-files.json          (auto-generated)
  ├── 2025-01-28-server-update.md
  └── 2025-01-26-new-features.md

/rules/
  ├── index.html                    (copy of azox-markdown-template.html)
  ├── .markdown-files.json          (auto-generated)
  ├── 2025-01-20-server-rules.md
  └── 2025-01-15-building-rules.md
```

---

## Workflow

1. Add new markdown file: `2025-01-29-announcement.md`
2. Run: `./update-markdown-lists.sh`
3. Commit and push
4. GitHub Pages automatically updates!

---

## File Naming Convention

Use `YYYY-MM-DD-title.md` format for automatic date sorting:
- ✅ `2025-01-29-announcement.md`
- ✅ `2024-12-25-holiday-event.md`
- ❌ `announcement.md` (will work but won't sort properly)

---

## Advantages of This Approach

- ✅ Works on GitHub Pages (no server-side code)
- ✅ Fast - no runtime directory scanning
- ✅ Git-friendly - file list is versioned
- ✅ Can be automated with git hooks
- ✅ Simple bash script, works everywhere

---

## Why Not Just List Files Manually?

You could, but then you'd need to edit `index.html` every time you add a markdown file. This way you just drop in new `.md` files and run one command!