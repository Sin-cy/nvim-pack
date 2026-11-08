-- lua/sethy/pack.lua
-- native 0.12 vimpack plugin manager

-- early pack hooks
require("sethy.plugins.pack-hooks")

-- Plugins
vim.pack.add({
    -- Core
    { src = "https://github.com/nvim-lua/plenary.nvim" }, --enabled (used by telescope & git_worktree.nvim)
    { src = "https://github.com/christoomey/vim-tmux-navigator" }, --enabled
    { src = "https://github.com/folke/lazydev.nvim" }, --enabled

    -- Plugins
    { src = "https://github.com/dmtrKovalenko/fff.nvim" }, --enabled
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/bluz71/vim-moonfly-colors" },

    -- all telescope
    { src = "https://github.com/nvim-telescope/telescope.nvim", branch = "master" },--enabled
    { src = "https://github.com/andrew-george/telescope-themes" }, --enabled

    { src = "https://github.com/windwp/nvim-autopairs" }, --enabled

    { src = "https://github.com/stevearc/oil.nvim" }, --enabled

    { src = "https://github.com/olrtg/nvim-emmet" }, --enabled

    -- folding
    { src = "https://github.com/kevinhwang91/nvim-ufo" }, --enabled
    { src = "https://github.com/kevinhwang91/promise-async" }, --nvim-ufo dependency

    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/kylechui/nvim-surround", branch = "main" }, --disabled

    -- { src = "https://github.com/ThePrimeagen/harpoon", branch = "harpoon2" }, -- disabled: currently broken with builtin vimpack
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" }, --enabled

    { src = "https://github.com/folke/todo-comments.nvim" }, --enabled
    { src = "https://github.com/folke/trouble.nvim" }, --enabled

    { src = "https://github.com/mbbill/undotree" },--enabled

    { src = "https://github.com/folke/snacks.nvim" }, --enabled
    { src = "https://github.com/echasnovski/mini.nvim" }, --enabled

    { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" }, -- enabled
    { src = "https://github.com/numToStr/Comment.nvim" }, --enabled

    -- git
    { src = "https://github.com/ThePrimeagen/git-worktree.nvim" }, --enabled
    { src = "https://github.com/lewis6991/gitsigns.nvim" }, --enabled
    { src = "https://github.com/tpope/vim-fugitive" }, --enabled
    { src = "https://github.com/kdheepak/lazygit.nvim" }, --enabled

    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }, --enabled
    { src = "https://github.com/windwp/nvim-ts-autotag" }, --enabled


    -- blink completions
    { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
    -- completions cmp
    -- { src = "https://github.com/hrsh7th/nvim-cmp" }, --enabled
    -- completions dependency
    -- { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    -- { src = "https://github.com/hrsh7th/cmp-buffer" },
    -- { src = "https://github.com/hrsh7th/cmp-path" },
    -- { src = "https://github.com/hrsh7th/cmp-cmdline" },
    -- { src = "https://github.com/f3fora/cmp-spell" },
    -- { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    -- { src = "https://github.com/onsails/lspkind.nvim" },
    { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.1" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },

    -- LSP stack
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

    { src = "https://github.com/NvChad/nvim-colorizer.lua" }, --enabled

    -- icons
    { src = "https://github.com/nvim-tree/nvim-web-devicons" }, --enabled

    -- colorschemes
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
    { src = "https://github.com/ellisonleao/gruvbox.nvim", name = "gruvbox" },
    { src = "https://github.com/rebelot/kanagawa.nvim", name = "kanagawa" },
    { src = "https://github.com/craftzdog/solarized-osaka.nvim" },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/loctvl842/monokai-pro.nvim" },
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin-nvim" },
})

-- NOTE: Call plugins
-- This can be moved to init.lua @ sethy/plugins/

-- Core & Foundations
require("sethy.plugins.lazydev")

-- Syntax & Highlighting
require("sethy.plugins.treesitter")

-- Theme & Colors
require("sethy.plugins.colorscheme")

-- UI & Others
require("sethy.plugins.mini")
require("sethy.plugins.snacks")

-- File Management
require("sethy.plugins.oil")
require("sethy.plugins.fff")
require("sethy.plugins.telescope")

-- Editing Helpers
-- require("sethy.plugins.harpoon")
require("sethy.plugins.formatting")
require("sethy.plugins.nvim-ufo")
require("sethy.plugins.auto-pairs")
require("sethy.plugins.comment")
require("sethy.plugins.colorizer")
require("sethy.plugins.render-markdown")
require("sethy.plugins.emmet")
require("sethy.plugins.lualine")

-- Git
require("sethy.plugins.gitstuff")

-- Completion
require("sethy.plugins.blink")

-- LSP Stack
require("sethy.plugins.lsp.mason") -- mason has to load before lspconfig
require("sethy.plugins.lsp.lspconfig")

-- Diagnostics & Notes
require("sethy.plugins.trouble")
require("sethy.plugins.todo-comments")
