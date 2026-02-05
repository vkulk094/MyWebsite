# Hugo Website Agent Instructions

## Purpose
Prevent Hugo homepage regressions and ensure consistent, rebuild-safe website editing.

## Project Structure

```
Hugo/my-blog/                    # ← HUGO SOURCE (edit here)
├── config.yaml                  # Site configuration
├── content/                     # Markdown content
│   └── blogs/                   # Blog posts
├── layouts/                     # Template overrides (survives rebuilds)
│   ├── index.html              # Homepage template override
│   └── partials/
│       └── head.html           # Head partial override
├── static/                      # Static assets (copied as-is)
│   ├── css/
│   │   └── custom.css          # ALL custom CSS goes here
│   └── images/
├── themes/hugo-profile/         # Theme (DO NOT EDIT)
└── public/                      # Generated output (auto-overwritten)

MyWebsite/                       # ← DEPLOYMENT TARGET (generated output)
├── index.html                   # DO NOT EDIT - gets overwritten
├── css/                         # DO NOT EDIT - gets overwritten
└── ...                          # All files are generated
```

## Non-Negotiable Rules

### 1. NEVER Edit These Locations
- ❌ `themes/hugo-profile/**/*` - Will be lost on theme updates
- ❌ `public/**/*` - Gets overwritten every build
- ❌ `MyWebsite/**/*` - This is the deployment output folder

### 2. ALWAYS Edit in These Locations
- ✅ `layouts/` - For template overrides
- ✅ `static/css/custom.css` - For ALL CSS customizations
- ✅ `config.yaml` - For site configuration
- ✅ `content/` - For blog posts and pages

### 3. Template Override Protocol
To customize a theme template:
1. Find the original in `themes/hugo-profile/layouts/`
2. Copy to the same path under `layouts/` (root)
3. Edit the copy in `layouts/`
4. Hugo automatically uses root `layouts/` over theme

Example:
```
themes/hugo-profile/layouts/partials/head.html  →  layouts/partials/head.html
```

### 4. CSS Customization Protocol
ALL custom styles go in ONE file: `static/css/custom.css`

```css
/*
 * Custom CSS Overrides
 * This file is loaded LAST and survives theme updates.
 * Place all customizations here instead of editing theme files.
 */

/* Use !important only when overriding theme's !important rules */
.dark {
    --text-color: #00ffe7 !important;
}
```

### 5. Color Configuration
Use `config.yaml` for colors when possible:

```yaml
params:
  color:
    textColor: "#343a40"
    primaryColor: "#007bff"
    darkmode:
      textColor: "#e4e6eb"
      primaryColor: "#ffffff"
```

**Exception**: Theme uses `!important` in `.dark` class, so dark mode colors 
MUST be overridden in `custom.css`.

## Build Workflow

### Development
```powershell
cd Hugo/my-blog
hugo server -D
```

### Production Build
```powershell
cd Hugo/my-blog
hugo --minify
```

### Deploy to MyWebsite
```powershell
# Build
cd Hugo/my-blog
hugo --minify

# Copy to deployment folder
Copy-Item -Path "public/*" -Destination "../MyWebsite/" -Recurse -Force
```

## Pre-Build Checklist

Before running `hugo`:
- [ ] All CSS changes are in `static/css/custom.css`
- [ ] No edits made to `themes/hugo-profile/`
- [ ] No edits made to `public/`
- [ ] Template overrides are in `layouts/` (root)
- [ ] Config changes are in `config.yaml`

## File Reference

### Key Files to Know
| File | Purpose | Editable? |
|------|---------|-----------|
| `config.yaml` | Site settings, colors, content | ✅ Yes |
| `layouts/index.html` | Homepage template | ✅ Yes |
| `layouts/partials/head.html` | CSS/meta injection | ✅ Yes |
| `static/css/custom.css` | Custom styles | ✅ Yes |
| `themes/**/*` | Theme files | ❌ No |
| `public/**/*` | Build output | ❌ No |

### Hugo Template Lookup Order (Homepage)
1. `layouts/index.html` ← Your override (if exists)
2. `themes/hugo-profile/layouts/index.html` ← Theme default

### CSS Loading Order
1. Bootstrap CSS
2. Theme CSS (header.css, footer.css, theme.css, index.css)
3. `custom.css` ← Loaded LAST (can override everything)

## Troubleshooting

### "My changes disappeared after rebuild"
- You likely edited `public/` or `MyWebsite/` directly
- Move changes to `layouts/` or `static/css/custom.css`

### "Dark mode colors not working"
- Theme uses `!important` in `.dark` class
- Must override in `custom.css` with `!important`

### "Template changes not showing"
- Check file is in `layouts/` not `themes/*/layouts/`
- Clear browser cache
- Run `hugo server` without cache: `hugo server --disableFastRender`

## Adding New Pages

### Static HTML Page (like tools)
1. Create in `static/` folder: `static/tools/my-tool.html`
2. Access at: `https://yoursite.com/tools/my-tool.html`

### Hugo-Managed Page
1. Create in `content/`: `content/my-page.md`
2. Add front matter and content
3. Access at: `https://yoursite.com/my-page/`

## Theme Update Protocol

If updating hugo-profile theme:
```powershell
cd themes/hugo-profile
git fetch upstream
git reset --hard upstream/master
```

After update:
1. Check if your `layouts/` overrides still work
2. Compare theme changes to your overrides
3. Test with `hugo server`
