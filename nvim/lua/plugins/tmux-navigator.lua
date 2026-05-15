-- Tmux pane navigation with Ctrl+hjkl
-- Pairs with christoomey/vim-tmux-navigator in tmux.conf
return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>",     desc = "Navigate pane left" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>",     desc = "Navigate pane down" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>",       desc = "Navigate pane up" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>",    desc = "Navigate pane right" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate previous pane" },
    },
  },
}
