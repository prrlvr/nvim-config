require("lsp.ui")

local function on_attach(client, bufnr)
    require("lsp.mappings").setup(bufnr)
    require("lsp.highlight").setup(client, bufnr)
    require("lsp.lightbulb").setup(bufnr)
end

local function clangd_attach(client, bufnr)
    on_attach(client, bufnr)
    require("lsp.mappings").setup_clangd(bufnr)
end

local servers = {
    -- pyright = {},
    -- bashls = {},
    -- dockerls = {},
    -- tsserver = {},
    -- html = {},
    -- emmet_ls = {},
    -- cssls = {},
    -- tailwindcss = {},
    -- texlab = {},
    -- vuels = {},
    -- cmake = {},
    -- rust_analyzer = {},
    gopls = {},
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")
for server, config in pairs(servers) do
    lspconfig[server].setup(vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
    }, config))
end

local clangd_capabilities = vim.deepcopy(capabilities)
clangd_capabilities.textDocument.completion.completionItem.snippetSupport =
    true
lspconfig.clangd.setup({
    on_attach = clangd_attach,
    capabilities = clangd_capabilities,
    cmd = {
        "clangd",
        "-background-index",
        "-compile-commands-dir=/home/users/pierre-olivier.rey/build-backend/backend/build",
        "--header-insertion=never"
    },
})

local configs = require 'lspconfig/configs'
if not configs.golangcilsp then
 	configs.golangcilsp = {
		default_config = {
			cmd = {'golangci-lint-langserver'},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
					command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
			}
		};
	}
end
lspconfig.golangci_lint_ls.setup {
	filetypes = {'go','gomod'}
}


-- lspconfig.golangcilsp.setup({
--         on_attach = on_attach,
--         capabilities = capabilities,
--         cmd = {'golangci-lint-langserver'},
--         root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
--         command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json", "--issues-exit-code=1" };
--         filetypes = {'go','gomod'}
--
-- })
