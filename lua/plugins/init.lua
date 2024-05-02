return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "typescript-language-server",
        "eslint-lsp",
        "css-lsp",
        "html-lsp",
        "prettier",
        "yaml-language-server",
        "tsserver",
        "jsonls",
        "eslint_d",
        "prettierd",
        "eslint-lsp",
        "lua",
        "xml",
        "http",
        "json",
        "graphql",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "markdown",
        "markdown_inline",
        "lua",
        "xml",
        "http",
        "json",
        "graphql",
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      require "plugins.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "plugins.configs.lint"
    end,
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      require "plugins.configs.formatter"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      require "plugins.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "plugins.configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function() -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = "  "
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping sectio
    end,
  },
  {
    "folke/noice.nvim",
    lazy = false,
    event = "VeryLazy",
    opts = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      presets = {
        lsp_doc_border = true,
        inc_rename = true,
      },
      routes = {
        {
          -- lspsaga: avoids annoying messages in notify
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      },
      lsp = {
        hover = {
          enabled = false,
        },
        signature = {
          enabled = false,
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      preview_config = {
        border = "rounded", -- single|rounded
        style = "minimal",
      },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true,
  },
  {
    "folke/neodev.nvim",
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "tpope/vim-surround",
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
      require("typescript").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
  },
  {
    "danielpieper/telescope-tmuxinator.nvim",
  },
  {
    "pwntester/octo.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup {
        enable_builtin = true,
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }
      vim.cmd [[hi OctoEditable guibg=none]]
    end,
  },
  {
    "tpope/vim-rails",
    cmd = {
      "Eview",
      "Econtroller",
      "Emodel",
      "Smodel",
      "Sview",
      "Scontroller",
      "Vmodel",
      "Vview",
      "Vcontroller",
      "Tmodel",
      "Tview",
      "Tcontroller",
      "Rails",
      "Generate",
      "Runner",
      "Extract",
    },
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup {
        width = 120, -- Width of the floating window
        height = 25, -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false, -- Print debug information
        opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        vim.cmd "nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        vim.cmd "nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
        vim.cmd "nnoremap gpP <cmd>lua require('goto-preview').close_all_win()<CR>",
        vim.cmd "nnoremap gpc <cmd>lua require('goto-preview').close_all_win()<CR>",
      }
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    -- module = "persistence",
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "folke/trouble.nvim",
    branch = "dev", -- IMPORTANT!
    keys = {
      {
        "<leader>te",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tE",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {}, -- for default options, refer to the configuration section for custom setup.
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "klen/nvim-test",
    lazy = false,
    config = function()
      require("nvim-test").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
  },
  {
    "sbdchd/neoformat",
    lazy = false,
  },
  { "echasnovski/mini.nvim", version = false, lazy = false },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    lazy = false,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
    },
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
}
