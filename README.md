# Complete `.config` Documentation (Priority: Neovim)

Generated from `/Users/cepl/.config` on 2026-02-27.

## Scope and promise
This document covers:
- Every file currently present in this `.config` repo (`47` files).
- Every custom Neovim shortcut explicitly defined in your config files.
- Every Ghostty keybind in your config.
- User/tool config files in this repo (with sensitive values redacted).

Important scope note:
- Neovim built-in defaults and undocumented plugin defaults are not fully enumerable from this repo alone.
- This doc is exhaustive for mappings/settings that are explicitly configured in your files.

## File inventory

### Root files
- `.gitignore`
- `.luarc.json`
- `README.md`

### `nvim/`
- `nvim/init.lua`
- `nvim/lazy-lock.json`
- `nvim/lua/meena/config/init.lua`
- `nvim/lua/meena/config/lazy.lua`
- `nvim/lua/meena/core/init.lua`
- `nvim/lua/meena/core/keymaps.lua`
- `nvim/lua/meena/core/option.lua`
- `nvim/lua/meena/themes/catppuccin.lua`
- `nvim/lua/meena/themes/rose-pine.lua`
- `nvim/lua/meena/assets/panda.png`
- `nvim/lua/meena/plugins/init.lua`
- `nvim/lua/meena/plugins/amp-ai.lua`
- `nvim/lua/meena/plugins/auto-session.lua`
- `nvim/lua/meena/plugins/comments.lua`
- `nvim/lua/meena/plugins/complition.lua`
- `nvim/lua/meena/plugins/dap.lua`
- `nvim/lua/meena/plugins/dashboard.lua`
- `nvim/lua/meena/plugins/formatting.lua`
- `nvim/lua/meena/plugins/fzf-lua.lua`
- `nvim/lua/meena/plugins/linting.lua`
- `nvim/lua/meena/plugins/nvim-tree.lua`
- `nvim/lua/meena/plugins/package-info.lua`
- `nvim/lua/meena/plugins/spectre.lua`
- `nvim/lua/meena/plugins/tree-sitter.lua`
- `nvim/lua/meena/plugins/trouble.lua`
- `nvim/lua/meena/plugins/vim-maximizer.lua`
- `nvim/lua/meena/plugins/which-key.lua`
- `nvim/lua/meena/plugins/git/gitsigns.lua`
- `nvim/lua/meena/plugins/git/lazygit.lua`
- `nvim/lua/meena/plugins/lsp/lspconfig.lua`
- `nvim/lua/meena/plugins/lsp/mason.lua`
- `nvim/lua/meena/plugins/ui/bufferline.lua`
- `nvim/lua/meena/plugins/ui/colorizer.lua`
- `nvim/lua/meena/plugins/ui/dressing.lua`
- `nvim/lua/meena/plugins/ui/lualine.lua`
- `nvim/lua/meena/plugins/ui/snacks.lua`

### `ghostty/`
- `ghostty/config`
- `ghostty/shaders/crt.glsl`
- `ghostty/shaders/galaxy.glsl`
- `ghostty/shaders/inside-the-matrix.glsl`
- `ghostty/shaders/starfield-colors.glsl`

### Other app/tool configs
- `amp/settings.json`
- `configstore/firebase-tools.json`
- `configstore/reactNativeToolsConfig.json`
- `configstore/update-notifier-firebase-tools.json`
- `github-copilot/apps.json`
- `github-copilot/versions.json`
- `uv/uv-receipt.json`

---

## Neovim architecture

### Boot flow
1. `nvim/init.lua`
2. `require("meena.core")` -> `core/option.lua` and `core/keymaps.lua`
3. `require("meena.config")` -> `config/lazy.lua`
4. lazy.nvim bootstraps and imports:
   - `meena.plugins`
   - `meena.plugins.lsp`
   - `meena.plugins.git`
   - `meena.plugins.ui`

### Leaders
- `mapleader = " "` (space)
- `maplocalleader` is set in two places:
  - `core/keymaps.lua`: `" "`
  - `config/lazy.lua`: `"\\"`
- Final active value is from later load in `config/lazy.lua`: `maplocalleader = "\\"`.

### Core options (`core/option.lua`)
- Numbers: `number = true`, `relativenumber = true`
- Indentation: `tabstop = 4`, `shiftwidth = 4`, `softtabstop = 4`, `expandtab = true`, `smartindent = true`
- Wrapping: `wrap = true`, `linebreak = true`, `scrolloff = 8`
- Search: `ignorecase = true`, `smartcase = true`, `hlsearch = false`, `incsearch = true`
- UI: `cursorline = true`, `termguicolors = true`, `signcolumn = "yes"`
- Files: `backup = false`, `swapfile = false`, `undofile = true`
- Clipboard: appends `unnamedplus`
- Splits: `splitright = true`, `splitbelow = true`
- Markdown autocmd: `conceallevel=2` and `spell` enabled
- netrw: `g:netrw_liststyle = 3`

---

## Neovim shortcuts (complete custom keymap index)

Key notation:
- `<leader>` = Space
- Modes: `n` normal, `v` visual, `x` visual/select, `i` insert, `o` operator-pending

### 1) Core global mappings (`core/keymaps.lua`)

| Mode | Key | Action |
|---|---|---|
| n,v | `<Space>` | Disabled (`<Nop>`) |
| i | `jk` | Exit insert mode |
| n | `X` | Delete char without yanking |
| n | `<leader>sv` | Vertical split |
| n | `<leader>sh` | Horizontal split |
| n | `<leader>se` | Equalize splits |
| n | `<leader>sx` | Close current split |
| n | `<leader>tn` | New tab |
| n | `<leader>tx` | Close tab |
| n | `<leader>tl` | Next tab |
| n | `<leader>th` | Previous tab |
| n | `<leader>tb` | Current buffer in new tab |
| n | `<leader>ss` | Save file |
| n | `<leader>qq` | Quit window |
| n | `<leader>ee` | `:Explore` (netrw) |
| n | `<leader>qa` | Quit all |
| n | `<Tab>` | Next buffer |
| n | `<S-Tab>` | Previous buffer |
| n,v | `J` | Move selected block down |
| n,v | `K` | Move selected block up |
| n | `<leader>oa` | Select all (`ggVG<c-$>`) |
| n | `<leader>odl` | Delete line to black-hole register |
| v | `<leader>odl` | Delete selection to black-hole register |
| n,v | `<leader>oc` | Yank to system clipboard |
| v | `oy` | Yank and return cursor |
| n | `<Esc>` | Close floating windows + clear search highlights |
| n,v | `<leader>ox` | Cut to system clipboard |
| v | `opp` | Paste over selection without overwriting clipboard |
| n | `<leader>op` | Paste from system clipboard |
| n,x | `[p` | Paste above |
| n,x | `]p` | Paste below |
| n | `<leader>odd` | Duplicate current line |

### 2) LSP mappings (`plugins/lsp/lspconfig.lua`, on `LspAttach`)

| Mode | Key | Action |
|---|---|---|
| n | `cK` | Hover documentation |
| n | `cs` | Signature help |
| n | `fcd` | FzfLua definitions |
| n | `cd` | Go to definition |
| n | `fci` | FzfLua implementations |
| n | `fco` | FzfLua type definitions |
| n | `fcr` | FzfLua references |
| n | `<leader>fcd` | FzfLua document diagnostics |
| n | `<leader>cd` | Line diagnostics float |
| n | `[d` | Previous diagnostic |
| n | `]d` | Next diagnostic |
| n | `<leader>ca` | Code action |
| n | `<leader>fca` | FzfLua code actions |
| n | `<leader>crn` | Rename symbol |
| n,x | `<leader>fr` | Format via LSP |
| n | `<leader>crs` | Restart LSP |

### 3) FZF mappings (`plugins/fzf-lua.lua`)

| Mode | Key | Action |
|---|---|---|
| n | `<leader>ff` | Find files |
| n | `<leader>fls` | List buffers |
| n | `<leader><leader>rf` | Resume previous FZF |
| n | `<leader>fb` | FZF builtins |
| n | `<leader>fg` | Live grep project |
| n | `<leader><leader>f` | Live grep current buffer |
| n | `<leader>fw` | Grep word under cursor |
| v | `<leader>fv` | Grep visual selection |
| n | `<leader>fds` | Document symbols |
| n | `<leader>fqf` | Quickfix list |
| n | `<leader>flm` | Marks |
| n | `<leader><leader>gs` | Git status |
| n | `<leader><leader>gb` | Git branches |

Extra FZF action inside file picker:
- `ctrl-y`: copy selected path into clipboard and register `0`.

### 4) Git mappings (`plugins/git/gitsigns.lua`, buffer-local on attach)

| Mode | Key | Action |
|---|---|---|
| n | `]g` | Next hunk |
| n | `[g` | Previous hunk |
| n | `<leader>gs` | Stage hunk |
| v | `<leader>gs` | Stage selected hunk |
| n | `<leader>gr` | Reset hunk |
| v | `<leader>gr` | Reset selected hunk |
| n | `<leader>gS` | Stage buffer |
| n | `<leader>gR` | Reset buffer |
| n | `<leader>guh` | Undo stage hunk |
| n | `<leader>gp` | Preview hunk |
| n | `<leader>gb` | Blame line (full) |
| n | `<leader>gB` | Toggle line blame |
| n | `<leader>gd` | Diff this |
| n | `<leader>gD` | Diff vs `~` |
| o,x | `gih` | Select git hunk textobject |

### 5) File tree mappings (`plugins/nvim-tree.lua`)

| Mode | Key | Action |
|---|---|---|
| n | `<leader>ee` | Toggle NvimTree |
| n | `<leader>ef` | Find current file in tree |
| n | `<leader>ec` | Collapse tree |
| n | `<leader>er` | Refresh tree |

Note: `<leader>ee` is also mapped in core to netrw `:Explore`. NvimTree mapping is intended to win once plugin is loaded.

### 6) Trouble mappings (`plugins/trouble.lua`)

| Mode | Key | Action |
|---|---|---|
| n | `<leader>xx` | Diagnostics (Trouble) |
| n | `<leader>xs` | Symbols |
| n | `<leader>xls` | LSP list (definitions/references/etc.) |
| n | `<leader>xw` | Workspace diagnostics |
| n | `<leader>xd` | Document diagnostics |
| n | `<leader>xq` | Quickfix |
| n | `<leader>xl` | Location list |
| n | `<leader>xt` | TODOs |

### 7) Search/replace mapping (`plugins/spectre.lua`)

| Mode | Key | Action |
|---|---|---|
| n | `<leader>pr` | Open Spectre with current word |
| v | `<leader>pr` | Open Spectre with visual selection |

### 8) Session/format/lint/splits/util mappings

| Source | Mode | Key | Action |
|---|---|---|---|
| `plugins/auto-session.lua` | n | `<leader>wr` | Session restore |
| `plugins/auto-session.lua` | n | `<leader>ws` | Session save |
| `plugins/formatting.lua` | n,v | `<leader>mp` | Format file/range |
| `plugins/linting.lua` | n | `<leader>l` | Trigger lint |
| `plugins/vim-maximizer.lua` | n | `<leader>sm` | Toggle split maximize |
| `plugins/git/lazygit.lua` | n | `<leader>lg` | Open LazyGit |
| `plugins/ui/snacks.lua` | n | `<S-n>` | Notification history |
| `plugins/ui/snacks.lua` | n | `<S-t>` | Toggle terminal |

### 9) DAP (debugging) mappings (`plugins/dap.lua`)

| Mode | Key | Action |
|---|---|---|
| n | `<leader>da` | Continue |
| n | `<leader>dd` | Continue |
| n | `<leader>db` | Toggle breakpoint |
| n | `<leader>dB` | Conditional breakpoint |
| n | `<leader>di` | Step into |
| n | `<leader>do` | Step out |
| n | `<leader>dO` | Step over |
| n | `<leader>dt` | Terminate |
| n | `<leader>du` | Open DAP UI |
| n | `<leader>dc` | Close DAP UI |
| n | `<leader>dh` | Evaluate expression |
| n | `<leader>dw` | Float watches |
| n | `<leader>ds` | Float scopes |
| n | `<leader>dr` | Float REPL |

DAP UI internal keys (inside DAP UI panels):
- Expand: `<CR>`, `<2-LeftMouse>`
- Open: `o`
- Remove: `d`
- Edit: `e`
- REPL: `r`
- Toggle: `t`
- Floating window close: `q`, `<Esc>`

### 10) Completion keys (`plugins/complition.lua`, insert mode)

| Mode | Key | Action |
|---|---|---|
| i | `<C-k>` | Select previous completion |
| i | `<C-j>` | Select next completion |
| i | `<C-b>` | Scroll docs up |
| i | `<C-f>` | Scroll docs down |
| i | `<C-Space>` | Trigger completion |
| i | `<C-e>` | Abort completion |
| i | `<CR>` | Confirm selection |
| i | `<Tab>` | Next completion item or snippet jump |
| i | `<S-Tab>` | Previous completion item or snippet jump back |

### 11) Treesitter selection/textobject keys (`plugins/tree-sitter.lua`)

Incremental selection:
- `Z`: init and expand selection
- `<bs>`: decrement selection

Textobject selections:
- `[f`: function outer
- `]f`: function inner
- `[c`: class outer
- `]c`: class inner
- `[p`: parameter outer
- `]p`: parameter inner

### 12) Additional active plugin default mappings (not overridden here)
- `vim-tmux-navigator` is installed via `plugins/init.lua`.
- No custom override is configured in this repo.
- Plugin defaults are likely active (commonly `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`, `<C-\\>`).

---

## Neovim usage guide (quick workflows)

### File and symbol navigation
1. `<leader>ff` to find files.
2. `<leader>fg` to grep project.
3. `<leader>fds` for symbols in current file.
4. LSP jump keys: `cd`, `fcd`, `fci`, `fco`, `fcr`.

### Code actions and diagnostics
1. `[d` and `]d` for diagnostic navigation.
2. `<leader>cd` for line diagnostics popup.
3. `<leader>ca` or `<leader>fca` for code actions.
4. `<leader>crn` for rename.

### Git flow
1. `]g` / `[g` to move hunks.
2. `<leader>gs` stage hunk.
3. `<leader>gr` reset hunk.
4. `<leader>gp` preview hunk.
5. `<leader>lg` for LazyGit.

### Formatting and linting
1. `<leader>mp` format now.
2. `<leader>l` lint now.
3. Lint also auto-runs on `BufEnter`, `BufWritePost`, `InsertLeave`.

### Debugging
1. `<leader>db` set breakpoint.
2. `<leader>da` or `<leader>dd` continue.
3. `<leader>di`/`<leader>dO`/`<leader>do` for step controls.
4. `<leader>du` open UI, `<leader>dc` close UI.

---

## Neovim plugin and tooling configuration details

### LSP servers ensured by Mason (`plugins/lsp/mason.lua`)
- `ts_ls`, `html`, `cssls`, `jsonls`, `yamlls`, `bashls`, `elixirls`, `marksman`, `tailwindcss`, `svelte`, `lua_ls`, `graphql`, `emmet_ls`, `pyright`

### Formatters/linters tools ensured by Mason Tool Installer
- Formatters/tools: `prettierd`, `prettier`, `stylua`, `isort`, `black`, `shfmt`, `markdownlint`, `clang-format`
- Linters: `pylint`, `eslint_d`

### Conform formatter matrix (`plugins/formatting.lua`)
- JS/TS/React/Svelte/CSS/HTML/JSON/YAML/Markdown/GraphQL/Liquid via Prettier
- Lua via Stylua (`--indent-width 2`, spaces)
- Python via `isort` + `black`
- Shell via `shfmt` (and `beautysh` for bash)
- C/Java/Swift/ObjC via `clang-format`
- `format_on_save` enabled with timeout `1000ms`

### Lint matrix (`plugins/linting.lua`)
- `eslint_d` for JS/TS/React/Svelte
- `pylint` for Python
- `eslint_d` cwd resolved from nearest `package.json` / `.eslintrc.js` / `.git`

### Treesitter languages ensured (`plugins/tree-sitter.lua`)
- Frontend: javascript, typescript, tsx, html, css, scss, svelte, vue, comment, markdown_inline, regex
- Backend/misc: json, yaml, graphql, bash, dockerfile, prisma, elixir, heex, eex, zig, surface, erlang
- Mobile/native: java, swift, objc
- Essentials/docs: markdown, gitignore, lua, vim, vimdoc, query, c

### Themes (`themes/*.lua`)
- Active: `catppuccin` (enabled=true, `macchiato` flavor)
- Inactive alternative: `rose-pine` (`enabled=false`)

### UI setup highlights
- Bufferline with diagnostics badges and NvimTree offset
- Lualine custom mode compaction, macro recording indicator, lazy updates section
- Snacks split across two specs:
  - `plugins/dashboard.lua`: dashboard layout and panda terminal art (`ascii-image-converter`)
  - `plugins/ui/snacks.lua`: indent/scope/chunk/notifier and keybinds

### Lazy lock (`nvim/lazy-lock.json`)
- `54` plugins pinned to exact commits.
- This guarantees reproducible plugin versions across machines.

### File-by-file Neovim detail reference
- `nvim/init.lua`: loads `meena.core` then `meena.config`.
- `nvim/lua/meena/core/init.lua`: loads options and keymaps modules.
- `nvim/lua/meena/config/init.lua`: loads lazy bootstrap.
- `nvim/lua/meena/config/lazy.lua`: bootstraps lazy.nvim if missing, sets leaders before plugin load, imports plugin groups, enables update checker.
- `nvim/lua/meena/plugins/init.lua`: core shared plugins (`plenary.nvim`, `vim-tmux-navigator`) and theme import.
- `nvim/lua/meena/plugins/which-key.lua`: timeout enabled (`timeoutlen=500`), modern preset, immediate popup delay (`delay=0`), custom icons, spelling suggestions disabled.
- `nvim/lua/meena/plugins/comments.lua`: `Comment.nvim` with Treesitter-aware commentstring (`ts_context_commentstring`) and empty-line ignore (`ignore=\"^$\"`).
- `nvim/lua/meena/plugins/package-info.lua`: package.json dependency inline status/icons enabled, package manager default `npm`, notifications/autostart enabled.
- `nvim/lua/meena/plugins/amp-ai.lua`: `sourcegraph/amp.nvim` auto-start enabled, log level `info`.
- `nvim/lua/meena/plugins/nvim-tree.lua`: disables netrw plugin, left tree width `30`, relative numbers, git + diagnostics + modified markers, filters `.DS_Store` and `node_modules`.
- `nvim/lua/meena/plugins/trouble.lua`: Trouble with focus enabled by default and todo-comments integration.
- `nvim/lua/meena/plugins/spectre.lua`: lazy-loaded project refactor/search-replace UI.
- `nvim/lua/meena/plugins/linting.lua`: lints on enter/write/insert-leave using `nvim-lint`.
- `nvim/lua/meena/plugins/formatting.lua`: conform with format-on-save and root-aware prettier execution.
- `nvim/lua/meena/plugins/auto-session.lua`: session save/restore configured, auto restore disabled, suppresses home/common folders.
- `nvim/lua/meena/plugins/vim-maximizer.lua`: split maximize toggle mapping.
- `nvim/lua/meena/plugins/fzf-lua.lua`: preview wrapping enabled, `--wrap` fzf option, custom `ctrl-y` action copies selected file path.
- `nvim/lua/meena/plugins/tree-sitter.lua`: syntax highlight/indent/autotag enabled, fold expr via treesitter, incremental selection and textobject mappings enabled.
- `nvim/lua/meena/plugins/complition.lua`: nvim-cmp with LSP/buffer/path/snippet/codeium sources, ghost text disabled, cmdline completion for `/` and `:`, autopairs integration, autotag and surround plugins.
- `nvim/lua/meena/plugins/dap.lua`: DAP + DAP UI + virtual text + dap_repl treesitter parser setup; auto-opens/closes debug UI from debug events; JS/TS/Vue/Svelte adapters and launch/attach presets for chrome/node/next/jest/vitest/deno.
- `nvim/lua/meena/plugins/git/gitsigns.lua`: hunk nav/stage/reset/blame/diff mappings registered per attached buffer.
- `nvim/lua/meena/plugins/git/lazygit.lua`: command-based lazy loading and one keymap entrypoint.
- `nvim/lua/meena/plugins/lsp/mason.lua`: Mason UI icons + ensured LSP servers and tooling installers.
- `nvim/lua/meena/plugins/lsp/lspconfig.lua`: LSP attach mappings, diagnostic sign icons/config, plus server-specific handlers for `svelte`, `graphql`, `emmet_ls`, `lua_ls`, `elixirls`.
- `nvim/lua/meena/plugins/dashboard.lua`: Snacks dashboard sections plus terminal-rendered panda image (`ascii-image-converter ~/.config/nvim/lua/meena/assets/panda.png -C -c`).
- `nvim/lua/meena/plugins/ui/snacks.lua`: Snacks indent/scope/chunk/notifier config and terminal/history keybinds.
- `nvim/lua/meena/plugins/ui/bufferline.lua`: LSP diagnostics indicators/icons, NvimTree offset title, excludes `qf`, `fugitive`, `git` filetypes from bufferline.
- `nvim/lua/meena/plugins/ui/lualine.lua`: compact mode display, lazy update indicator, wordcount for markdown/text, search/selection counters, macro recording status, custom scroll position glyphs.
- `nvim/lua/meena/plugins/ui/dressing.lua`: enhanced select/input UI with default settings.
- `nvim/lua/meena/plugins/ui/colorizer.lua`: color highlights for all filetypes, rgb() in css, named colors in html.
- `nvim/lua/meena/themes/catppuccin.lua`: active colorscheme with many integrations (cmp, gitsigns, nvimtree, treesitter, telescope, notify, mason, bufferline, markdown, flash, noice, semantic tokens), custom highlights for line numbers/visual/search.
- `nvim/lua/meena/themes/rose-pine.lua`: alternate colorscheme config present but disabled.
- `nvim/lua/meena/assets/panda.png`: dashboard art asset displayed through external converter.

---

## Ghostty documentation

Config file: `ghostty/config`

### Appearance and fonts
- Font family: BerkeleyMono Nerd Font (regular/bold/italic/bold italic explicitly set)
- Font size: `16`
- Font style: `medium`
- Theme: `Solarized Osaka Night`
- Background opacity: `0.96`
- Cursor: block, no blink, invert fg/bg enabled

### Window behavior
- `window-padding-balance = true`
- `window-save-state = always`
- `macos-titlebar-style = transparent`
- `window-colorspace = "display-p3"`

### Ghostty keybinds (complete list)

| Key | Action |
|---|---|
| `cmd+s>r` | reload config |
| `cmd+s>x` | close surface |
| `cmd+s>n` | new window |
| `cmd+s>shift+t` | new tab |
| `cmd+s>shift+l` | next tab |
| `cmd+s>shift+h` | previous tab |
| `cmd+s>comma` | move tab left |
| `cmd+s>period` | move tab right |
| `cmd+s>1`..`cmd+s>9` | go to tab 1..9 |
| `cmd+s>\\` | split right |
| `cmd+s>-` | split down |
| `cmd+s>k` | go to bottom split |
| `cmd+s>j` | go to top split |
| `cmd+s>h` | go to left split |
| `cmd+s>l` | go to right split |

### Shader files in repo
- `shaders/crt.glsl`: CRT simulation shader (scanlines, warp, mask, vignette)
- `shaders/galaxy.glsl`: animated volumetric galaxy overlay with brightness mask blending
- `shaders/inside-the-matrix.glsl`: 3D digital-rain matrix effect blending with terminal content
- `shaders/starfield-colors.glsl`: multi-layer starfield/spectrum effect with luminance-based blending

Current `ghostty/config` has shader lines commented out.

---

## Other `.config` files (user + tools)

### `.luarc.json`
- Lua LS diagnostics globals: `vim`, `timeout`
- Disables `unused-local` diagnostic

### `.gitignore`
- Ignores `.DS_Store`
- Ignores `github-copilot/`

### `README.md`
- Minimal placeholder comments (`# dot-files` variations)

### `amp/settings.json`
- `amp.dangerouslyAllowAll = true`

### `configstore/reactNativeToolsConfig.json`
- Stores survey/tips metadata and usage dates for RN tools extension
- Contains no obvious auth token in this file

### `configstore/firebase-tools.json`
- Contains Firebase CLI profile, analytics UUID, Google identity metadata, and OAuth token data
- Sensitive values present in file:
  - user email and org domain
  - access token / refresh token / id token

### `configstore/update-notifier-firebase-tools.json`
- Update notifier state (`lastUpdateCheck`, opt-out flag)

### `github-copilot/apps.json`
- Contains GitHub Copilot OAuth token mapping (sensitive)

### `github-copilot/versions.json`
- Copilot plugin versions (`copilot.vim`, `copilot.lua`)

### `uv/uv-receipt.json`
- uv install receipt
- version `0.9.24`, install prefix `/Users/cepl/.local/bin`, provider metadata

---

## Security and privacy notes (important)

Sensitive credentials are currently stored in plain text in:
- `configstore/firebase-tools.json`
- `github-copilot/apps.json`

Recommended immediate actions:
1. Rotate Firebase/Google OAuth tokens.
2. Rotate GitHub Copilot OAuth token.
3. Keep these files out of any public repo sync.
4. If this repo is already shared, treat those secrets as compromised.

---

## Validation checklist for this doc
- All files under `/Users/cepl/.config` inventory included.
- All explicit Neovim keymap definitions included.
- All explicit Ghostty keybinds included.
- Key overlaps noted (`<leader>ee`).
- User/tool config files documented with secret-awareness.


# Neovim Swift + iOS Setup

This config now includes a production-style Swift/iOS workflow:
- `sourcekit-lsp` via Xcode toolchain
- `swiftformat` formatting
- `swiftlint` linting
- `xcodebuild.nvim` build/test/run/debug commands
- `codelldb` DAP for Swift executables

## 1) System prerequisites (macOS)

Install Apple tooling:

```bash
xcode-select --install
sudo xcodebuild -runFirstLaunch
```

Install extra CLI tools (recommended):

```bash
brew install xcbeautify xcode-build-server
```

`sourcekit-lsp` is provided by Xcode and is discovered with:

```bash
xcrun -f sourcekit-lsp
```

## 2) Neovim dependencies

Open Neovim and run:

```vim
:Lazy sync
:Mason
:MasonToolsInstallSync
: XcodebuildSetup
```

Ensure these are installed in Mason:
- `swiftformat`
- `swiftlint`
- `codelldb`
- `xcode-build-server`
- `xcbeautify`
- `xcodeprojectcli`

## 3) Swift/iOS keymaps

Core xcodebuild:
- `<leader>X` actions picker
- `<leader>xf` project manager

iOS workflow:
- `<leader>ii` setup project
- `<leader>ib` build
- `<leader>iB` clean build
- `<leader>ir` build and run
- `<leader>id` build and debug
- `<leader>it` test nearest
- `<leader>iT` test all
- `<leader>ic` test class
- `<leader>is` select scheme
- `<leader>iv` select device
- `<leader>iN` next device
- `<leader>iP` previous device
- `<leader>il` toggle logs
- `<leader>iC` toggle code coverage
- `<leader>io` open in Xcode

General code quality:
- `<leader>mp` format file/range
- `<leader>l` run linter

## 4) Practical usage

For Swift Package projects:
1. Open package folder in Neovim.
2. Use standard LSP actions (`cd`, `cK`, `<leader>ca`, `<leader>crn`).
3. Format with `<leader>mp`.
4. Debug executable with DAP (`<leader>db`, `<leader>da`, etc.) after selecting the binary path.

For iOS app projects:
1. Open `.xcodeproj` or `.xcworkspace` root in Neovim.
2. Run `<leader>ii` once for setup.
3. Pick scheme/device with `<leader>is` and `<leader>iv`.
4. Build/run/debug using `<leader>ib`, `<leader>ir`, `<leader>id`.
5. Run tests with `<leader>it` or `<leader>iT`.
