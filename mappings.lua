local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
      ["<leader>fo"] = "",
      -- ["<C-a>"] = ""
  }
}

-- Your custom mappings
M.new = {
  n = {
     ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
     ["<leader>e"] = { "<cmd> NvimTreeToggle<CR>", "Toggle files"},
     ["<leader>gg"] = {
      function()
        local term = require("nvterm.terminal").new("float")
        vim.api.nvim_chan_send(term.job_id, "lazygit\n")
      end,
      "open Lazygit",
    },
  },

  i = {
     -- ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
    -- ...
  }
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<leader>dt"] = {
      function ()
        require("dapui").toggle();
      end,
      "Toggle DapUI"
    },

 }
}

return M

