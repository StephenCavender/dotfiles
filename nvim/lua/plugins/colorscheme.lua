return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- colorscheme is applied at startup, so load eagerly
    priority = 1000,
    opts = {
      transparent = true,
    },
  },

  -- Configure LazyVim to load tokyonight (matches ghostty, tmux, sketchybar, borders)
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
