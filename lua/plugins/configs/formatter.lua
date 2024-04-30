-- local M = {
--   filetype = {
--     javascript = {
--       require("formatter.filetypes.javascript").prettier
--     },
--     typescript = {
--       require("formatter.filetypes.typescript").prettier
--     },
--     ["*"] = {
--       require("formatter.filetypes.any").remove_trailing_whitespace
--     }
--   }
-- }
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   command = "FormatWriteLock"
-- })
--
-- return M

local formatter = require('formatter')

local M = {
  filetype = {
    javascript = {
      function()
        return {
          exe = "prettier",  -- specifying the executable
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
    },
    typescript = {
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
    },
    ["*"] = {
      function()
        return {
          exe = "sed",
          args = {'-e', 's/[ \t]*$//'},
          stdin = true
        }
      end
    }
  }
}

-- Setup formatter
formatter.setup(M)

-- Auto command to format on save
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    vim.cmd('FormatWrite')
  end
})

