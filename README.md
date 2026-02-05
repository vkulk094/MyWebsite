Below is a ready-to-paste `README.md` for your repo (built around what is visible in the repository tree: `config.yaml`, `build.ps1`, Hugo-style folders like `content/`, `layouts/`, `static/`, and a `themes/` directory plus `.gitmodules`). ([GitHub][1])

````md
# MyWebsite

Personal website built with **Hugo**, managed as a versioned project so local development, rebuilds, and deployment are repeatable. :contentReference[oaicite:1]{index=1}

## Live site
- Production: <add-your-production-url-here>
- Preview (optional): <add-your-preview-url-here>

## Repository structure (high level)
This repo follows a typical Hugo layout: :contentReference[oaicite:2]{index=2}

- `config.yaml` — site configuration (menus, params, baseURL, etc.) :contentReference[oaicite:3]{index=3}  
- `content/` — pages and posts (for example blog content) :contentReference[oaicite:4]{index=4}  
- `layouts/` — template overrides and custom layouts :contentReference[oaicite:5]{index=5}  
- `static/` — static assets (images, CSS, favicon, etc.) :contentReference[oaicite:6]{index=6}  
- `themes/` — theme(s) used by the site (tracked via submodule) :contentReference[oaicite:7]{index=7}  
- `build.ps1` — helper script for building on Windows (PowerShell) :contentReference[oaicite:8]{index=8}  
- `.gitmodules` — submodule metadata (theme is expected to be a submodule) :contentReference[oaicite:9]{index=9}  

## Prerequisites
- **Hugo Extended** (recommended, and often required by themes).
  - Confirm install: `hugo version`
- Git (for cloning and submodules)

## Quick start (local development)

### 1) Clone with submodules
If the theme is a submodule, clone like this:

```bash
git clone --recurse-submodules https://github.com/vkulk094/MyWebsite.git
cd MyWebsite
````

If you already cloned without submodules:

```bash
git submodule update --init --recursive
```

### 2) Run the dev server

```bash
hugo server -D
```

* The `-D` flag includes draft content. Remove it for “published-only” previews.

### 3) Build the site

```bash
hugo
```

The generated site will be placed in Hugo’s output directory (commonly `public/`, depending on config).

## Windows build helper (optional)

A PowerShell build script is included. ([GitHub][1])
From PowerShell:

```powershell
pwsh -File .\build.ps1
```

If the script is designed to build and/or deploy, it should print any required parameters or steps when run.

## Editing workflow (stable and update-friendly)

If you want edits to survive rebuilds and theme updates:

1. **Do not edit theme files directly** in `themes/`.
2. Place any template changes in `layouts/` (Hugo override mechanism).
3. Put custom CSS/JS in `static/` and reference them from an overridden partial in `layouts/` (for example `layouts/partials/head.html`) or via theme-supported config parameters.
4. Keep content in `content/` (pages, blog posts, etc.).

This keeps your custom work isolated while allowing the theme to update cleanly.

## Updating the theme

If the theme is a submodule:

```bash
git submodule update --remote --merge
git add themes
git commit -m "Update theme submodule"
```

If you are using a regular cloned theme (not a submodule), update it like any normal Git repo inside `themes/<theme-name>/`.

## Deployment notes

Deployment depends on where you host (GitHub Pages, custom domain, Netlify, etc.). Common patterns:

* **GitHub Pages**: build into the publishing directory configured in your Pages settings (often `docs/` or a dedicated branch).
* **Custom domain**: ensure `baseURL` in `config.yaml` matches the deployed domain, and configure DNS plus any required `CNAME` file.

If you add your deployment target here, also document:

* where the build output goes (for example `public/` or `docs/`)
* which branch or folder is published
* how to trigger a deploy (manual, Actions, or external CI)

## Troubleshooting

* **Theme not loading / missing assets**: confirm submodules are initialized:

  ```bash
  git submodule update --init --recursive
  ```
* **Changes “disappear” after rebuild**: you likely edited inside `themes/`. Move those edits into `layouts/` or `static/` overrides as described above.

## License

Add a license if you plan to accept contributions or reuse parts elsewhere (MIT is common for personal site repos).

## Contact

Vaibhav Kulkarni

* Repo issues: open an issue in this repository

```

If you want, paste your current `config.yaml` (and the name of the theme folder under `themes/`) and I will tighten the README so the install and deployment sections match your exact setup.
::contentReference[oaicite:11]{index=11}
```

[1]: https://github.com/vkulk094/MyWebsite "GitHub - vkulk094/MyWebsite: Github Website Tutorial"
