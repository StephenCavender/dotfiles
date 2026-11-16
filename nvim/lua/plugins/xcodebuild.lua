-- Xcode from nvim: build/run/test/debug via xcodebuild + simulators.
-- Deps (Brewfile.work): xcbeautify, xcode-build-server. sourcekit-lsp ships with Xcode.
-- First run in a project: :XcodebuildSetup (writes buildServer.json for LSP).
return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = { "folke/snacks.nvim", "MunifTanjim/nui.nvim" },
    ft = { "swift", "objc" },
    cmd = { "XcodebuildSetup", "XcodebuildPicker" },
    opts = {},
    keys = {
      { "<leader>XX", "<cmd>XcodebuildPicker<cr>", desc = "Xcodebuild actions" },
      { "<leader>Xb", "<cmd>XcodebuildBuild<cr>", desc = "Xcode build" },
      { "<leader>Xr", "<cmd>XcodebuildBuildRun<cr>", desc = "Xcode build & run" },
      { "<leader>Xt", "<cmd>XcodebuildTest<cr>", desc = "Xcode test" },
      { "<leader>Xd", "<cmd>XcodebuildSelectDevice<cr>", desc = "Xcode select device" },
      { "<leader>Xl", "<cmd>XcodebuildToggleLogs<cr>", desc = "Xcode toggle logs" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- From the Xcode toolchain, not Mason.
        sourcekit = { mason = false },
      },
    },
  },
}
