local wk = require("which-key")

require("neogit").setup({
    integrations = {
        diffview = true,
    },

})

wk.register({
    name = "neogit",
    g = { "<cmd>Neogit<cr>", "neogit" },
}, {
    prefix = "<leader>",
    noremap = true,
})
