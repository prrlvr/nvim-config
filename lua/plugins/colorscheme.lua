-- vim.g.neosolarized_contrast=normal
-- vim.background=dark
-- vim.cmd("colorscheme NeoSolarized")
n = require('neosolarized').setup({
  comment_italics = true,
  background_set = true,
})
n.Group.link('WarningMsg', n.groups.Comment)
