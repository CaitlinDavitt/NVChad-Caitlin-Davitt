local M = {}
M.ui = {theme = 'onenord'}
M.plugins = 'custom.plugins'
M.mappings = require "custom.mappings"

vim.opt.spelllang = "en"
vim.g.typst_pdf_viewer= "evince"
M.ui = {

  theme = "everforest", -- default theme
  theme_toggle = { "everforest", "everforest_light" },
   hl_override = {
    NvDashAscii = {
      bg = "none",
      fg  = "green"
    },

    -- NvDashButtons = {
    --   bg = "none",
    --   fg  = "light_grey"
    -- },
  },
  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

	  header = {
	 "                                                                   ",
	 "      ████ ██████           █████      ██                    ",
	 "     ███████████             █████                            ",
	 "     █████████ ███████████████████ ███   ███████████  ",
	 "    █████████  ███    █████████████ █████ ██████████████  ",
	 "   █████████ ██████████ █████████ █████ █████ ████ █████  ",
	 " ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
	 "██████  █████████████████████ ████ █████ █████ ████ ██████",

    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Text", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "typst" },
  callback = function()
    vim.cmd("TypstWatch")
    vim.cmd("setlocal spell")
    vim.cmd("set linebreak")
    vim.opt_local.wrap = true
  end,
})

return M
