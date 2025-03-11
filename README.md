# Neovim Configuration

This is my personal Neovim configuration, powered by **lazy.nvim** for plugin management. It includes LSP support, autocompletion, debugging, a theme, and other essential enhancements.

## Installation

Clone this repository into your Neovim configuration directory:

### **Linux & macOS**

```sh
git clone https://github.com/yourusername/nvim-config.git ~/.config/nvim
```

### **Windows (PowerShell)**

```powershell
git clone https://github.com/yourusername/nvim-config.git $env:LOCALAPPDATA\nvim
```

After cloning, open Neovim and run:

```sh
nvim
```

Lazy.nvim will automatically install the required plugins.

## Configuration Structure

```sh
.
├── init.lua
├── lazy-lock.json
├── .tmux.conf
├── lua
│   ├── config
│   │   └── lazy.lua
│   └── plugins
│       ├── autopairs.lua
│       ├── catppuccin.lua
│       ├── comment.lua
│       ├── dap.lua
│       ├── dashboard.lua
│       ├── gitsigns.lua
│       ├── lspconfig.lua
│       ├── lualine.lua
│       ├── nvimcmp.lua
│       ├── render_markdown.lua
│       ├── telescope.lua
│       ├── treesitter.lua
│       ├── visual_multi.lua
└── README.md
```

## Plugin List

- [**lazy.nvim**](https://github.com/folke/lazy.nvim) - Plugin manager
- [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting & parsing
- [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [**nvim-cmp**](https://github.com/hrsh7th/nvim-cmp) - Autocompletion
- [**LuaSnip**](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [**nvim-dap**](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol
- [**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy Finder
- [**gitsigns.nvim**](https://github.com/lewis6991/gitsigns.nvim) - Git integration
- [**lualine.nvim**](https://github.com/nvim-lualine/lualine.nvim) - Statusline
- [**dashboard-nvim**](https://github.com/glepnir/dashboard-nvim) - Neovim startup dashboard
- [**nvim-autopairs**](https://github.com/windwp/nvim-autopairs) - Auto-close brackets & quotes
- [**Comment.nvim**](https://github.com/numToStr/Comment.nvim) - Commenting utility
- [**vim-visual-multi**](https://github.com/mg979/vim-visual-multi) - Multi-cursor support
- [**render-markdown.nvim**](https://github.com/MeanderingProgrammer/render-markdown.nvim) - Markdown preview
- [**catppuccin.nvim**](https://github.com/catppuccin/nvim) - Theme

## Features

- **LSP Support** - Auto-install and configure language servers
- **Autocompletion** - Intelligent suggestions with `nvim-cmp`
- **Syntax Highlighting** - Treesitter-enhanced highlighting
- **Git Integration** - View diffs, hunks, and blame with `gitsigns.nvim`
- **Debugging** - Integrated debugging with `nvim-dap`
- **File Searching** - Fuzzy file and text search with `telescope.nvim`
- **Statusline & Dashboard** - Aesthetic enhancements with `lualine.nvim` & `dashboard-nvim`

> Note:<br>
> There's also a [**tmux**](https://github.com/tmux/tmux) config file. Can ignore it if not required.

## Contributions

Feel free to fork and modify this configuration to suit your workflow. PRs are welcome!
