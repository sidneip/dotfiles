vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
-- vim.o.cursorline = true
-- vim.cmd [[highlight CursorLine cterm=NONE ctermbg=236 ctermfg=NONE gui=NONE guibg=LightGrey guifg=NONE]]

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local wk = require "which-key"
local telescope = require "telescope"
telescope.load_extension "refactoring"
telescope.load_extension "octo"

wk.register {
  ["<leader>"] = {
    l = {
      name = "lsp",
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
      r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
      R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code action" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
    },
    d = {
      name = "dap",
      b = { "<cmd> DapToggleBreakpoint <CR>", "Add breakpoint at line" },
      r = { "<cmd> DapContinue <CR>", "Run or continue the debugger" },
    },
    f = {
      name = "files",
      f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find files" },
      t = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Grep" },
      b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
      h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help tags" },
    },
    g = {
      name = "git",
      g = { "<cmd>Lazygit<CR>", "Lazygit" },
      s = { "<cmd>lua require('telescope.builtin').git_status()<CR>", "Git status" },
      c = { "<cmd>lua require('telescope.builtin').git_commits()<CR>", "Git commits" },
      b = { "<cmd>lua require('telescope.builtin').git_branches()<CR>", "Git branches" },
    },
    l = {
      name = "live server",
      s = { "<cmd>lua require('liveserver').start()<CR>", "Start live server" },
      r = { "<cmd>lua require('liveserver').stop()<CR>", "Stop live server" },
    },
    o = {
      name = "octo",
      p = { "<cmd>Octo pr list<cr>", "List PRs" },
      o = { "<cmd>Octo pr create<cr>", "Create PR" },
    },
  },
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "Neoformat",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.cmd "Neoformat"
  end,
})

vim.g.neoformat_enabled_typescript = { "prettier" }
require("mini.bracketed").setup()
require("mini.surround").setup()
require("mini.ai").setup()
require("mini.extra").setup()
require("mini.pick").setup()
