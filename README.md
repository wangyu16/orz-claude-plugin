# orz-markdown — Claude Code plugin

**Markdown that edits itself.**

Agent skills for the [orz document family](https://markdown.orz.how). Every orz
document is one HTML file that carries its own Markdown source inside it: open it
in a browser to read, click to edit, and save back **in place** — no app, no
server, no re-export.

## Skills

| Skill | What it does |
|---|---|
| `orz-markdown` | The syntax reference — KaTeX math, Mermaid and SMILES diagrams, `:::` containers, footnotes, TOC, block IDs, and the 12 bundled themes. |
| `orz-mdhtml` | Author `x.md` text twins and their self-editing `x.md.html` files (orz text format 1) that read like a themed webpage and edit in the browser; inspect, upgrade and recover older files. |
| `orz-slides` | Author `.slides.html` decks (reveal.js) from Markdown with a small layout syntax. |
| `orz-paged` | Author `.paged.html` print documents (paged.js) — real print pages, exported to PDF by printing. |

## Install

Once listed in the community marketplace:

```bash
claude plugin marketplace add anthropics/claude-plugins-community
claude plugin install orz-markdown@claude-community
```

Try it locally without installing:

```bash
claude --plugin-dir ./orz-claude-plugin
```

## Maintenance

The four skill directories are vendored from the canonical family repositories
kept beside this repository in the `orz-family` workspace. After changing a
canonical skill, synchronize and verify the plugin with:

```bash
./scripts/sync-skills.sh
./scripts/sync-skills.sh --check
```

Release the plugin alongside family documentation changes so its guidance,
package versions, and positioning do not drift.

## Why it's different

Every other Markdown renderer is one-way: it throws the Markdown away and leaves
you with HTML. orz keeps the source inside the file and edits it in place, so the
rendered document *is* the editable document.

Saving in place uses the File System Access API (Chromium); other browsers fall
back to download. "One file" means one file — the enhancers (math, diagrams,
themes) load from a CDN unless you build with `--inline`.

## Packages

| Package | Output |
|---|---|
| [orz-markdown](https://www.npmjs.com/package/orz-markdown) | the parser |
| [orz-mdhtml](https://www.npmjs.com/package/orz-mdhtml) | `.md.html` |
| [orz-slides](https://www.npmjs.com/package/orz-slides) | `.slides.html` |
| [orz-paged](https://www.npmjs.com/package/orz-paged) | `.paged.html` |

MIT · [markdown.orz.how](https://markdown.orz.how)
