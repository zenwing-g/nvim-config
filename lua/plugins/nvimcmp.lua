return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
        "windwp/nvim-autopairs",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load() -- Load snippets

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
            formatting = {
                format = require("lspkind").cmp_format({ with_text = true }),
            },
            window = {
                completion = cmp.config.window.bordered(), -- Adds a border around the suggestions
                documentation = cmp.config.window.bordered(), -- Adds a border around documentation popups
            },
        })

        require("nvim-autopairs").setup({})
    end,
}

