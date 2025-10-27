--set number
--TABS AND SPACES

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = "<C>"

-------------------------------------------------------------------------------------

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-----------------------------------------------------------------------------------

local plugins = {

  --COLOURSCHEMES
  { "dgox16/oldworld.nvim" },
  { "shaunsingh/nord.nvim" },
  { "kdheepak/monochrome.nvim" },
  { "dark-orchid/neovim" },
  { "maxmx03/fluoromachine.nvim", name = "fluoromachine", priority = 1000 },
  { "catppuccin/nvim" },
  { "EdenEast/nightfox.nvim" },

  --OTHER PLUGINS
  
  --telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },

  --neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },

  --treesitter
   {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
  
  --autopair
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  
  --noicegui
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
  },

  --Sncaks
  {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  },
  --idk man
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  --miniicons
  --{ 'nvim-mini/mini.icons', version = '*' },

  --MINI
  { 'nvim-mini/mini.nvim', version = '*' },



  { "AckslD/nvim-neoclip.lua" },
  { "karb94/neoscroll.nvim" },
  { "jim-fx/sudoku.nvim" },
  { "alec-gibson/nvim-tetris" },
  { "ThePrimeagen/vim-be-good" },
  { "saxon1964/neovim-tips" },





  }
-----------------------------------------------------------------------------------------------------

local opts = {




  --bufferline
   options = {
    -- stylua: ignore
    close_command = function(n) Snacks.bufdelete(n) end,
    -- stylua: ignore
    right_mouse_command = function(n) Snacks.bufdelete(n) end,
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    diagnostics_indicator = function(_, _, diag)
      local icons = LazyVim.config.icons.diagnostics
      local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        .. (diag.warning and icons.Warn .. diag.warning or "")
      return vim.trim(ret)
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Neo-tree",
        highlight = "Directory",
        text_align = "left",
      },
      {
        filetype = "snacks_layout_box",
      },
    },
    ---@param opts bufferline.IconFetcherOpts
    get_element_icon = function(opts)
      return LazyVim.config.icons.ft[opts.filetype]
    end,
  },




--i have no fucking clue omg
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
}



-- Setup lazy.nvim
require("lazy").setup(plugins, opts)
--
require("fluoromachine").setup()
vim.cmd.colorscheme "fluoromachine"
--
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-o>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep,  {})
vim.keymap.set('n', '<C-c>', builtin.colorscheme, {})
--
local config = require("nvim-treesitter.configs")
config.setup ({
  ensure_installed = { "c", "bash", "lua" },
  highlight = { enable = true },
  indent = { enable = true },
})
--
require('neoclip').setup({
  history = 1000,
  enable_persistent_history = false,
  length_limit = 1048576,
  continuous_sync = false,
  db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
  filter = nil,
  preview = true,
  prompt = nil,
  default_register = '"',
  default_register_macros = 'q',
  enable_macro_history = true,
  content_spec_column = false,
  disable_keycodes_parsing = false,
  dedent_picker_display = false,
  initial_mode = 'insert',
  on_select = {
	move_to_front = false,
	close_telescope = true,
  },
  on_paste = {
	set_reg = false,
	move_to_front = false,
	close_telescope = true,
  },
  on_replay = {
	set_reg = false,
	move_to_front = false,
	close_telescope = true,
  },
  on_custom_action = {
	close_telescope = true,
  },
  keys = {
	telescope = {
	  i = {
		select = '<cr>',
		paste = '<c-p>',
		paste_behind = '<c-k>',
		replay = '<c-q>',  -- replay a macro
		delete = '<c-d>',  -- delete an entry
		edit = '<c-e>',  -- edit an entry
		custom = {},
	  },
	  n = {
		select = '<cr>',
		paste = 'p',
		--- It is possible to map to more than one key.
		-- paste = { 'p', '<c-p>' },
		paste_behind = 'P',
		replay = 'q',
		delete = 'd',
		edit = 'e',
		custom = {},
	  },
	},
	fzf = {
	  select = 'default',
	  paste = 'ctrl-p',
	  paste_behind = 'ctrl-k',
	  custom = {},
	},
  },
})
--


