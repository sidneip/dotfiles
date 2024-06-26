-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  -- theme = "solarized_osaka",
  theme = "jabuti",

  hl_override = {
    CursorLine = {
      bg = "#313244",
    },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvimtree = {
  auto_open = 1,
  git = {
    enable = true,
  },
}

M.options = {
  relativenumber = true,
  scrolloff = 10,
}

M.general = {
  n = {
    ["<leader>w"] = { "<cmd> :w<CR>", "save" },
  },
}

return M
