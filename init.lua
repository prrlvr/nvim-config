-- Indentation --
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "make", "go" },
    command = "setlocal noexpandtab shiftwidth=8",
})

-- Search --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- File --
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hidden = true
-- vim.filetype.add({
--     extension = {
--         h = "c",
--         ll = "lex",
--         tig = "tiger",
--         tih = "tiger",
--     },
--     filename = {
--         ["local.am"] = "automake",
--     },
-- })

-- Interface --
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.colorcolumn = "120"
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "¤" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 20
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.wrap = false

-- Miscellaneous --
vim.g.mapleader = " "
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 100
vim.opt.timeoutlen = 200
vim.opt.shortmess:append({ c = true })
vim.opt.tildeop = true
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    command = "setlocal textwidth=120",
})


vim.cmd "set noshowmode"
vim.cmd "set noshowcmd"
require("plugins")
require("mappings")
require("lsp")
