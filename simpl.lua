--I remade my entire fucking config again

--"lazy = true" DOES NOT PRELOAD
--"lazy = false" PRELOADS

--Defaults
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("set expandtab")
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=1")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.cmd("set nu")

--Easier split management
vim.keymap.set('n', '<leader>.', '<cmd>split <cr>')
vim.keymap.set('n', '<leader>,', '<cmd>vsplit <cr>')
vim.keymap.set('n', '<leader>/', '<cmd>SunglassesEnableToggle <cr>')

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--Switching tabs
vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1 <cr>')
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2 <cr>')
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3 <cr>')
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4 <cr>')
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5 <cr>')
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6 <cr>')
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7 <cr>')
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8 <cr>')
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9 <cr>')
vim.keymap.set('n', '<leader>e', '<cmd>BufferLineCycleNext <cr>')
vim.keymap.set('n', '<leader>q', '<cmd>BufferLineCycleNext <cr>')

--Games 
vim.keymap.set('n', '<leader>Gt', '<cmd>Tetris <cr>')

--Zenmode/focus
vim.keymap.set('n', '<leader>Z', '<cmd>ZenMode <cr>')
--Runcode
vim.keymap.set('n', '<leader>R', '<cmd>RunCode <cr>')
--Terminal
vim.keymap.set('n', '<leader>T', '<cmd>:LuxtermToggle <cr>')
--Notes
vim.keymap.set('n', '<leader>N', '<cmd>Telekasten <cr>')
vim.keymap.set('n', '<leader>n', '<cmd>Telekasten new_note<cr>')

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--Lazy nvim
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

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
local plugins = {

  --Colorschemes
  {"maxmx03/fluoromachine.nvim", 
  lazy = false, 
    priority = 1000, 
    config = function()
      vim.cmd([[colorscheme habamax]])
    end,},
  {"eldritch-theme/eldritch.nvim", 
  lazy = false},
  {"shaunsingh/moonlight.nvim", 
  lazy = false},
  {"sainnhe/everforest", 
  lazy = false},
  {"uhs-robert/oasis.nvim", 
  lazy = false},
  {"everviolet/nvim", name = 'evergarden', 
  lazy = false},

  --TreeSitter
  {"nvim-treesitter/nvim-treesitter", branch = 'main', lazy = false, build = ":TSUpdate"},

  --WhichKey
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  --Telescope
  {
    lazy = true,
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  --AutoPairs
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  --NeoTree
  {                                                                                             
    "nvim-neo-tree/neo-tree.nvim",                                                              
    branch = "v3.x",                                                                            
    dependencies = {                                                                            
   "nvim-lua/plenary.nvim",                                                                  
      "MunifTanjim/nui.nvim",                                                                   
      "nvim-tree/nvim-web-devicons", 
    },                                                                                          
    lazy = false, -- neo-tree will lazily load itself   
    keys = {
      {
        "<leader>o",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            source = "filesystem",
            position = "right",
          })
        end,
        desc = "Buffers (root dir)",
      },
    }
  },
  

  --BufferLine
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},

--Snacks 
  {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true},
    dashboard = {
       preset = {
          header = [[
███████╗██╗███╗   ███╗██████╗ ██╗    ██╗   ██╗██╗███╗   ███╗
██╔════╝██║████╗ ████║██╔══██╗██║    ██║   ██║██║████╗ ████║
███████╗██║██╔████╔██║██████╔╝██║    ██║   ██║██║██╔████╔██║
╚════██║██║██║╚██╔╝██║██╔═══╝ ██║    ╚██╗ ██╔╝██║██║╚██╔╝██║
███████║██║██║ ╚═╝ ██║██║     ███████╗╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝ ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                            

          ]],
        },
    sections = {
    { section = "header" },
    { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
    { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    { section = "startup" },
    },
  
  

	
	},
    explorer = { enabled = true},
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = true},
    notifier = { enabled = true },
    quickfile = { enabled = true},
    scope = { enabled = true},
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
},

--TriForce
{
  "gisketch/triforce.nvim",
  dependencies = {
    "nvzone/volt",
  },
  config = function()
    require("triforce").setup({
      -- Optional: Add your configuration here
      keymap = {
        show_profile = "<leader>p", -- Open profile with <leader>tp
      },
    })
  end,
},

--Terminal
  {
  "luxvim/nvim-luxterm",
  config = function()
    require("luxterm").setup({
      -- Optional configuration
      manager_width = 0.8,
      manager_height = 0.8,
      preview_enabled = true,
      auto_hide = true,
      keymaps = {
        toggle_manager = "<C-/>",
      }
    })
  end
  },

--Notes
  {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'}
  },



--MISC
{ "CRAG666/code_runner.nvim", config = true },
{ "alec-gibson/nvim-tetris"},
{ "ThePrimeagen/vim-be-good"}, 
{"miversen33/sunglasses.nvim",
  config = true,
  filter_type = "SHADE", -- "SHADE" "TINT" "NOSYNTAX"
  filter_percent = 0.05, 
},

{
  "folke/zen-mode.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},



  








}

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
local opts = {}

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
--SETUPS

--Lazy-Nvim
require("lazy").setup(plugins, opts)

--TreeSitter
local config = require("nvim-treesitter.config")
 config.setup ({
   ensure_installed = { "c", "bash", "lua", "cmake", "gdscript", "html", "hyprlang", "asm", "python", "cpp", "dockerfile", "vim", "vimdoc" },
   highlight = { enable = true },
   indent = { enable = true },
})

--WhichKey
local wk = require("which-key")
wk.add({
    
--  { "<leader>f", group = "file" }, -- group
--  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
--  { "<leader>fb", function() print("hello") end, desc = "Foobar" },
--  { "<leader>fn", desc = "New File" },
--  { "<leader>f1", hidden = true }, -- hide this keymap
  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
--    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
--    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})

--TeleScope
require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>O', builtin.find_files, {desc = 'find files'})
vim.keymap.set('n', '<leader>l', builtin.live_grep,  {desc = 'live grep'})
vim.keymap.set('n', '<leader>t', builtin.colorscheme, {desc = 'switch colorscheme'})
vim.keymap.set('n', '<leader>m', builtin.man_pages, {desc = 'Man-Pages'})
vim.keymap.set('n', '<leader>c', builtin.registers, {desc = 'registers/system clipboard'})
vim.keymap.set('n', '<leader>s', builtin.pickers, {desc = 'Find in currently open file'})


--BufferLine
vim.opt.termguicolors = true
require("bufferline").setup{}

--Triforce
require('triforce').setup({
  enabled = true,              -- Enable/disable the entire plugin
  gamification_enabled = true, -- Enable XP, levels, achievements

  -- Notification settings
  notifications = {
    enabled = true,       -- Master toggle for all notifications
    level_up = true,      -- Show level up notifications
    achievements = true,  -- Show achievement unlock notifications
  },

  -- Keymap configuration
  keymap = {
    show_profile = '<leader>tp', -- Set to nil to disable default keymap
  },

  -- Auto-save interval (in seconds)
  auto_save_interval = 300, -- Save stats every 5 minutes

  -- Add custom language support
  custom_languages = {
    gleam = { icon = '✨', name = 'Gleam' },
    odin = { icon = '🔷', name = 'Odin' },
    -- Add more languages...
  },

  -- Customize level progression (optional)
  level_progression = {
    tier_1 = { min_level = 1, max_level = 10, xp_per_level = 300 },   -- Levels 1-10
    tier_2 = { min_level = 11, max_level = 20, xp_per_level = 500 },  -- Levels 11-20
    tier_3 = { min_level = 21, max_level = math.huge, xp_per_level = 1000 }, -- Levels 21+
  },

  -- Customize XP rewards (optional)
  xp_rewards = {
    char = 1,   -- XP per character typed
    line = 1,   -- XP per new line
    save = 50,  -- XP per file save
  },

  -- Add filetypes to be excluded
  ignore_ft = {},

  -- Override heatmap highlight groups (hex colors or existing hl groups)
  heat_highlights = {
    TriforceHeat1 = '#f0f0a0',
    TriforceHeat2 = '#f0a0a0',
    TriforceHeat3 = '#a0a0a0',
    TriforceHeat4 = '#707070',
    -- Or link to your colorscheme's groups:
    -- TriforceHeat1 = 'DiffText',
  },

  -- Enable some debugging messages
  debug = false,
})

--LuxTerm
require("luxterm").setup({
  -- Manager window dimensions (0.1 to 1.0)
  manager_width = 0.8,          -- 80% of screen width
  manager_height = 0.8,         -- 80% of screen height
  -- Enable live preview pane
  preview_enabled = true,
  -- Focus new sessions when created via :LuxtermNew
  focus_on_create = false,
  -- Auto-hide floating windows when cursor leaves
  auto_hide = true,
  -- Keybinding configuration
  keymaps = {
    toggle_manager = "<leader>T",     -- Toggle session manager
    next_session = "<C-k>",       -- Next session keybinding
    prev_session = "<C-j>",       -- Previous session keybinding
    global_session_nav = false,   -- Enable global session navigation
  }
})

--Notes
require('telekasten').setup({
  home = vim.fn.expand("$HOME/.local/zettelkasten"), -- Put the name of your notes directory here
})

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
