require "nvchad.mappings"

-- add yours here
--
vim.api.nvim_del_keymap("n", "<leader>wK")
vim.api.nvim_del_keymap("n", "<leader>wk")

local map = vim.keymap.set
local harpoon = require "harpoon"
harpoon:setup()

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
--
-- Manage files
map("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle NvimTree" })

-- Close and Save
map("n", "<leader>w", ":w<CR>", { desc = "Save", noremap = true, silent = true })
map("n", "<leader>q", ":q<CR>", { desc = "Exit", noremap = true, silent = true })
map("n", "<leader>Q", ":qall!<CR>", { desc = "Exit", noremap = true, silent = true })

-- DAP
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dr", "<cmd> DapContinue <CR>", { desc = "Run or continue the debugger" })

-- Harpoon
map("n", "<leader>a", function()
  harpoon:list():add()
end, { desc = "Add harpoon" })
map("n", "<leader>v", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Add harpoon" })

-- Buffers
map("n", "<leader>bd", "<cmd> bd <CR>", { desc = "Delete buffer" })
map("n", "<leader>bn", "<cmd> bn <CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd> bp <CR>", { desc = "Previous buffer" })
map("n", "<leader>bb", "<cmd> lua require('telescope.builtin').buffers()<CR>", { desc = "List buffers" })
map("n", "<leader>bs", "<cmd> lua require('telescope.builtin').buffers()<CR>", { desc = "List buffers" })
map("n", "<leader>bc", "<cmd> :b#|bd# <CR>", { desc = "Close buffer" })
map("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer tab" })
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })

-- LSP
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<<CR>", { desc = "Signature help" })
map("n", "<leader>lr", "<cmd> IncRename <CR>", { desc = "Rename" })
map("n", "<leader>lh", "<cmd> lua vim.lsp.buf.hover() <CR>", { desc = "Hover" })
map("n", "<leader>lj", "<cmd> lua vim.diagnostic.goto_next() <CR>", { desc = "Next error" })
map("n", "<leader>lk", "<cmd> lua vim.diagnostic.goto_prev() <CR>", { desc = "Previous error" })
map("n", "<leader>lq", "<cmd> lua vim.diagnostic.setqflist() <CR>", { desc = "Quickfix error" })
map(
  "n",
  "<leader>lQ",
  "<cmd> lua vim.diagnostic.setqflist({workspace: true}) <CR>",
  { desc = "Quickfix error of workspace" }
)
map("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "Format document" })
map("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "Go to Implementation" })
map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
map("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "Go to References" })
map("n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Detailed Diagnostics" })
map("n", "<leader>lE", "<cmd>lua vim.diagnostic.close_float({})<CR>", { desc = "Close Diagnostics" })
map("n", "<leader>lD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { desc = "Go to Type Definition" })
map("n", "<leader>lS", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { desc = "Document Symbol" })

-- Find files
map("n", "<leader>fs", "<cmd> lua require('telescope.builtin').live_grep() <CR>", { desc = "Hover" })

-- git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazygit" })
map("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<CR>", { desc = "Git status" })
map("n", "<leader>gC", "<cmd>lua require('telescope.builtin').git_commits()<CR>", { desc = "Git commits" })
map("n", "<leader>gB", "<cmd>lua require('telescope.builtin').git_branches()<CR>", { desc = "Git branches" })
map("n", "<leader>gpl", "<cmd>Octo pr list<cr>", { desc = "Git pull requests list" })
map("n", "<leader>gpc", "<cmd>Octo pr create<cr>", { desc = "Git pull requests" })
map(
  "n",
  "<leader>gcp",
  '<cmd>lua require"gitsigns".prev_hunk()<CR>',
  { desc = "Last modification", noremap = true, silent = true }
)
map(
  "n",
  "<leader>gcn",
  '<cmd>lua require"gitsigns".next_hunk()<CR>',
  { desc = "Next modification", noremap = true, silent = true }
)
-- blame
map(
  "n",
  "<leader>gb",
  '<cmd>lua require"gitsigns".blame_line(true)<CR>',
  { desc = "Blame", noremap = true, silent = true }
)

-- find text
map("n", "<leader>st", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { desc = "Find files" })

-- Move lines UP and DOWN
map("x", "J", ":move '>+1<CR>gv-gv", { desc = "Move line down in visual block mode" })
map("x", "K", ":move '<-2<CR>gv-gv", { desc = "Move line up in visual block mode" })

-- neovim
vim.api.nvim_set_keymap(
  "n",
  "<leader>Lr",
  "<cmd>source ~/.config/nvim/init.lua<CR>",
  { noremap = true, silent = true, desc = "Reload NVChad configurations" }
)
