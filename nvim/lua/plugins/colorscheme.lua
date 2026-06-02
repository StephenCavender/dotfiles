return {
  {
    "Mofiqul/dracula.nvim",
    lazy = false, -- colorscheme is applied at startup, so load eagerly
    priority = 1000,
    opts = {
      transparent_bg = true,
    },
  },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
