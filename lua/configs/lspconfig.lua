require("nvchad.configs.lspconfig").defaults()

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = true
})

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- Simple servers (use vim.lsp.enable)
local servers = {
  "bashls",
  "lua_ls",
  "ast_grep",
  "asm_lsp",
  "vhdl_lsp",
  "harper-ls"
}

vim.lsp.enable(servers)

-- Clangd with custom config
vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
        "--fallback-style=none",
    },
    on_attach = on_attach,
    capabilities = vim.tbl_deep_extend('force', capabilities, {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = false
                }
            }
        }
    }),
})
vim.lsp.enable('clangd')

-- DANGC LSP
vim.lsp.config('dangc', {
    cmd = { vim.fn.expand("~/git/dangc/build/bin/dangcc"), "--lsp" },
    filetypes = { "dangc" },
    root_markers = { ".git", "CMakeLists.txt" },
    on_attach = on_attach,
    capabilities = capabilities,
})
vim.lsp.enable('dangc')
