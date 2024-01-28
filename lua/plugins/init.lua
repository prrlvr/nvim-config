local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    defaults = {
        lazy = false,
        version = nil,
    },
    {
      "Tsuzat/NeoSolarized.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
          vim.cmd [[ colorscheme NeoSolarized ]]
          require("plugins.colorscheme")
        end
    },
    -- {
    --     "svrana/neosolarized.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     dependencies = {
    --         { "tjdevries/colorbuddy.nvim" },
    --     },
    --     config = function()
    --         require("plugins.colorscheme")
    --     end,
    -- },
    -- {
    --     "maxmx03/solarized.nvim",
    --     lazy = false,
    --     priority = 3000,
    --     config = function()
    --         require("plugins.colorscheme")
    --     end,
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/playground" },
        config = function()
            require("plugins.treesitter")
        end,
    },
    {
        "folke/which-key.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("plugins.telescope")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "kosayoda/nvim-lightbulb",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.completion")
        end,
    },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("plugins.dressing")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.snippets")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("plugins.dap")
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugins.autopairs")
        end,
    },
    {
        "kylechui/nvim-surround",
        config = function()
            require("plugins.surround")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("plugins.comment")
        end,
    },
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("plugins.eyeliner")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufNewFile" },
        opts = {
            show_current_context = true,
            buftype_exclude = { "terminal", "help" },
            filetype_exclude = { "alpha", "lazy", "NvimTree" },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.statusline")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.alpha")
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.tree")
        end,
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.formatter")
        end,
    },
    {
        "TimUntersberger/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = function()
            require("plugins.neogit")
        end,
    },
    {
        "windwp/nvim-projectconfig",
        config = function()
            require("plugins.projectconfig")
        end,
    },
    {
        "Olical/conjure",
        ft = { "mitscheme" },
        lazy = false,
        -- [Optional] cmp-conjure for cmp
        dependencies = {
            {
                "PaterJason/cmp-conjure",
                config = function()
                    local cmp = require("cmp")
                    local config = cmp.get_config()
                    table.insert(config.sources, {
                        name = "buffer",
                        option = {
                            sources = {
                                { name = "conjure" },
                            },
                        },
                    })
                    cmp.setup(config)
                end,
            },
        },
        config = function(_, opts)
            require("conjure.main").main()
            require("conjure.mapping")["on-filetype"]()
        end,
        init = function()
            -- Set configuration options here
            vim.g["conjure#debug"] = true
        end,
    },
})
