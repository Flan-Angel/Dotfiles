--set number
--TABS AND SPACES

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("") 
vim.g.mapleader = " "

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
  { "olimorris/onedarkpro.nvim" },
  { "scottmckendry/cyberdream.nvim" },  
  { "eldritch-theme/eldritch.nvim" },
  { "uloco/bluloco.nvim" },  
  { "shaunsingh/moonlight.nvim" }, 
  { "datsfilipe/vesper.nvim" },
  { "samharju/synthweave.nvim" },  
  { "Tsuzat/NeoSolarized.nvim" },
  { "ficcdaf/ashen.nvim" },
  { "sekke276/dark_flat.nvim" },
  { "sainnhe/everforest" },
  

  

  
  

  

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

  
  --bufferline
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

  --miniicons
  --{ 'nvim-mini/mini.icons', version = '*' },

  --MINI
  { 'nvim-mini/mini.nvim', version = '*' },




  --trouble (error thing)
  {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  },

  --lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },


  --persistence
  -- Lua
  {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  }
  },

  --autocompletemenuthing
  {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'super-tab' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
  },
  

  --dashboard
    {
    "goolord/alpha-nvim",
    -- dependencies = { 'echasnovski/mini.icons' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local startify = require("alpha.themes.startify")
      -- available: devicons, mini, default is mini
      -- if provider not loaded and enabled is true, it will try to use another provider
      startify.file_icons.provider = "devicons"
      require("alpha").setup(
        startify.config
      )
    end,
  },


  --window manager thing
  { 'nvim-focus/focus.nvim', version = false },
    

  --code runner
  { "CRAG666/code_runner.nvim", config = true },


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


  --daash






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
vim.opt.termguicolors = true
require("bufferline").setup{}
--
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
--
require("focus").setup({
    enable = true, -- Enable module
    commands = true, -- Create Focus commands
    autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 0, -- Force minimum width for the unfocused window
        minheight = 0, -- Force minimum height for the unfocused window
        focusedwindow_minwidth = 0, --Force minimum width for the focused window
        focusedwindow_minheight = 0, --Force minimum height for the focused window
        height_quickfix = 10, -- Set the height of quickfix panel
    },
    split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
    },
    ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

        cursorline = true, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = '+1', -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = true, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
    }
})

