-- Indentation --
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("autocmd Filetype make setlocal noexpandtab shiftwidth=8")
-- Search --
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- File --
vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.hidden = true
vim.cmd("autocmd BufEnter *.ll set filetype=lex")
vim.cmd("autocmd BufEnter local.am set filetype=automake")
vim.api.nvim_create_user_command("Leodagan", "!~/epita/news/leodagan/leodagan.py %", {})

-- Interface --
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.list = true
-- vim.opt.listchars = { trail = "·" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.pumheight = 20
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.wrap = false

-- Miscellaneous --
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.shortmess:append({ c = true })

-- Plugins --
require("plugins")

-- LSP --
require("lsp")
