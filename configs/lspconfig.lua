local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
lspconfig.typst_lsp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
	settings = {
		exportPdf = "onSave" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	},
  filetypes = {"typst"},
}
