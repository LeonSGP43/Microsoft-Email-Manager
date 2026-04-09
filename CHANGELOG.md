# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- Supplier Outlook token import compatibility
  - What changed: Added optional `tenant` support, multi-endpoint token refresh fallback, richer token-attempt diagnostics, and broader IMAP host fallback for supplier-provided Hotmail/Outlook accounts.
  - Why: Supplier materials often do not match the original hard-coded Microsoft consumer-only assumptions.
  - Impact: Imported accounts are more likely to validate and read mail successfully without manual tenant guesswork.
  - Verification: `python3 -m py_compile main.py`; local IMAP/TLS handshake checks against Microsoft hosts; local service run on `http://127.0.0.1:8000`.
  - Files: `main.py`, `static/index.html`

### Changed
- Homepage focused on product usage instead of deployment marketing
  - What changed: Removed marketing-heavy deployment sections and external promotional links, and replaced primary CTAs with `进入后台` and `API 文档`.
  - Why: This customized fork is intended for direct operational use and future server deployment, not as a landing page for traffic or platform promotion.
  - Impact: The homepage is cleaner and points users straight to the admin panel and API docs.
  - Verification: `curl -s http://127.0.0.1:8000/ | rg "进入后台|API 文档"` and confirmed no `Railway/Zeabur/ClawCloud` content remains on the page.
  - Files: `static/home.html`

## [1.3.5]

### Released
- Upstream baseline imported from `Maishan-Inc/Microsoft-Email-Manager` tag line `1.3.5`.
