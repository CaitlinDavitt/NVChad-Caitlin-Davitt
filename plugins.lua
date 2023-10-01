local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
      -- "rust-analyzer",
      "nil_ls",
      "pyright",
      "lua_ls",
      "typst_lsp",

      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },

  {
  "NvChad/nvterm",
  config = function ()
    require("nvterm").setup({
      terminals = {
      shell = vim.o.shell,
      list = {},
      type_opts = {
        float = {
          relative = 'editor',
          row = 0.25,
          col = 0.25,
          width = .9,
          height = .9,
          border = "single",
        },
        horizontal = { location = "rightbelow", split_ratio = .5, },
        vertical = { location = "rightbelow", split_ratio = .5 },
      }
    },
    behavior = {
      autoclose_on_quit = {
        enabled = true,
        confirm = false,
      },
     close_on_exit = true,
     auto_insert = true,
    },
       })
    end,
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function ()
      require("dapui").setup({
      }) 
    end,
  },

  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=false,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
    init = function ()
      vim.ui.select = function(...)
       require("lazy").load({ plugins = { "dressing.nvim" } })
       return vim.ui.select(...)
      end
      vim.ui.input = function(...)
       require("lazy").load({ plugins = { "dressing.nvim" } })
       return vim.ui.input(...)
      end
    end,
  },
}
return plugins
