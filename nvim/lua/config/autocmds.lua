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
-- Enable lazily on first JS/TS FileType so `npx @knip/language-server` is only
-- spawned when actually editing those files, not eagerly at startup.
vim.lsp.config("knip", {
  cmd = { "npx", "--yes", "@knip/language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "knip.json", "knip.jsonc" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  once = true,
  callback = function()
    vim.lsp.enable("knip")
  end,
})
