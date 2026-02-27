#!/usr/bin/env sh

# Neovim installation script with LazyVim
# This script sets up Neovim with the LazyVim starter and applies personal config

NVIM_CONFIG_DIR="$HOME/.config/nvim"

# Backup existing nvim config if it exists
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Backing up existing nvim config to $NVIM_CONFIG_DIR.backup"
    mv "$NVIM_CONFIG_DIR" "$NVIM_CONFIG_DIR.backup"
fi

# Clone LazyVim starter configuration
echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter "$NVIM_CONFIG_DIR"

# Remove the .git directory to make it a personal config
rm -rf "$NVIM_CONFIG_DIR/.git"

# --- lua/config/options.lua ---
cat > "$NVIM_CONFIG_DIR/lua/config/options.lua" << 'EOF'
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set colorscheme
vim.opt.termguicolors = true

-- Additional options
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
EOF

# --- lua/plugins/colorscheme.lua ---
echo "Configuring Dracula theme..."
cat > "$NVIM_CONFIG_DIR/lua/plugins/colorscheme.lua" << 'EOF'
return {
  -- add dracula
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
EOF

# --- lua/plugins/opencode.lua ---
echo "Installing opencode.nvim plugin..."
cat > "$NVIM_CONFIG_DIR/lua/plugins/opencode.lua" << 'EOF'
return {
  "nickjvandyke/opencode.nvim",
  version = "*", -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = {  -- Enhances `select()`
          actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type or field for details
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end,
      { desc = "Ask opencode…" })
    vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
      { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
      { desc = "Add range to opencode", expr = true })
    vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
      { desc = "Add line to opencode", expr = true })

    vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
      { desc = "Scroll opencode up" })
    vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
      { desc = "Scroll opencode down" })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
    vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
  end,
}
EOF

echo "Neovim with LazyVim installed successfully!"
echo "Run 'nvim' to start — plugins will be installed on first launch."
