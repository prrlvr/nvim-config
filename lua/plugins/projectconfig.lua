local dashboard = require("alpha.themes.dashboard")

require('nvim-projectconfig').setup({
  project_dir = "~/.config/projects-config/",
  project_config={
    {
        path = "~/backend", 
        config = function ()
            print("abcde")
        end
    },
  },
  silent = false,-- display message after load config file
})

