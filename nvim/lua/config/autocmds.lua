-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Knip language server (https://github.com/webpro-nl/knip/tree/main/packages/language-server)
-- Not yet in nvim-lspconfig/Mason; configured via native vim.lsp API.
-- Must run after VeryLazy (vim_did_enter=1) so vim.lsp.enable() fires doautoall for open buffers.
vim.lsp.config("knip", {
  cmd = { "npx", "--yes", "@knip/language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "knip.json", "knip.jsonc" },
})
vim.lsp.enable("knip")
