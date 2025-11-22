--got tired of the previous config, too complicated for me.
--SIMPL NVIM

vim.cmd("colorscheme habamax")
--KEYBINDSa
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.cmd("set nu")

vim.keymap.set('n', '<leader>z1', 'require("lazy").setup(plugins)<cmd>BufferLineGoToBuffer 1 <cr>')
vim.keymap.set('n', '<leader>z2', '<cmd>BufferLineGoToBuffer 2 <cr>')
vim.keymap.set('n', '<leader>z3', '<cmd>BufferLineGoToBuffer 3 <cr>')
vim.keymap.set('n', '<leader>z4', '<cmd>BufferLineGoToBuffer 4 <cr>')
vim.keymap.set('n', '<leader>z5', '<cmd>BufferLineGoToBuffer 5 <cr>')
vim.keymap.set('n', '<leader>z6', '<cmd>BufferLineGoToBuffer 6 <cr>')
vim.keymap.set('n', '<leader>z7', '<cmd>BufferLineGoToBuffer 7 <cr>')
vim.keymap.set('n', '<leader>z8', '<cmd>BufferLineGoToBuffer 8 <cr>')
vim.keymap.set('n', '<leader>z9', '<cmd>BufferLineGoToBuffer 9 <cr>')
--
vim.keymap.set('n', '<leader>e', '<cmd>BufferLineCycleNext <cr>')
vim.keymap.set('n', '<leader>q', '<cmd>BufferLineCycleNext <cr>')

vim.keymap.set('n', '<leader>R', '<cmd>RunCode <cr>')
vim.keymap.set('n', '<leader>.', '<cmd>split <cr>')
vim.keymap.set('n', '<leader>,', '<cmd>vsplit <cr>')
vim.keymap.set('n', '<F7>', '<cmd>SunglassesEnableToggle <cr>')
vim.keymap.set('n', '<leader>j', '<cmd>:LuxtermToggle <cr>')
vim.keymap.set('n', '<leader>N', '<cmd>Telekasten <cr>')
vim.keymap.set('n', '<leader>n', '<cmd>Telekasten new_note<cr>')

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




--PLUGINS 
local plugins = {

  {"maxmx03/fluoromachine.nvim", 
  lazy = false},
  {"shaunsingh/moonlight.nvim", 
  lazy = false},
  {"sainnhe/everforest", 
  lazy = false},
  {"uhs-robert/oasis.nvim", 
  lazy = false},
  {"everviolet/nvim", name = 'evergarden', 
  lazy = false},






--TREESITTER
  {"nvim-treesitter/nvim-treesitter", branch = 'main', lazy = false, build = ":TSUpdate"},

--WHICHKEY
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
  },
  keys = {
    {
      "<leader>h",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

--TELESCOPE
  {
    lazy = true,
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

--AUTOPAIRS
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

--NEOTREE
  {                                                                                             
    "nvim-neo-tree/neo-tree.nvim",                                                              
    branch = "v3.x",                                                                            
    dependencies = {                                                                            
   "nvim-lua/plenary.nvim",                                                                  
      "MunifTanjim/nui.nvim",                                                                   
      "nvim-tree/nvim-web-devicons", -- optional, but recommended                               
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
 

--BUFFERLINE
 {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},


--LUALINE
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

--TRIFORCE
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

--Terminal?
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
{"eandrju/cellular-automaton.nvim"},
{ "karb94/neoscroll.nvim" },                                                              
{"miversen33/sunglasses.nvim",
  config = true,
  filter_type = "SHADE", -- "SHADE" "TINT" "NOSYNTAX"
  filter_percent = 0.05, 
},
 


-- SNACKS
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





--New opyable
--Dropnvim
{
  "folke/drop.nvim",
  opts = {
    -- ...
  }
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









--OPTS
local opts = {
}












--CONFIGS \/
-----------------------------------------------------------------------------------
--LAZY-NVIM SETUP
require("lazy").setup(plugins, opts)
-----------------------------------------------------------------------------------
--TREESITTER
local config = require("nvim-treesitter.config")
 config.setup ({
   ensure_installed = { "c", "bash", "lua", "cmake", "gdscript", "html", "hyprlang", "asm", "python", "cpp", "dockerfile", "vim", "vimdoc" },
   highlight = { enable = true },
   indent = { enable = true },
 })
-----------------------------------------------------------------------------------
--WHICHKEY
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
-----------------------------------------------------------------------------------
--TELESCOPE
require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
--
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>O', builtin.find_files, {desc = 'find files'})
vim.keymap.set('n', '<leader>l', builtin.live_grep,  {desc = 'live grep'})
vim.keymap.set('n', '<leader>t', builtin.colorscheme, {desc = 'switch colorscheme'})
vim.keymap.set('n', '<leader>m', builtin.man_pages, {desc = 'Man-Pages'})
vim.keymap.set('n', '<leader>c', builtin.registers, {desc = 'registers/system clipboard'})
vim.keymap.set('n', '<leader>s', builtin.pickers, {desc = 'Find in currently open file'})
-----------------------------------------------------------------------------------
--BUFFERLINE
vim.opt.termguicolors = true
require("bufferline").setup{}
-----------------------------------------------------------------------------------
--LUALINE
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
      refresh_time = 4, -- ~60fps
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
    lualine_x = { },
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
-----------------------------------------------------------------------------------
--TRIFORCE
require("triforce").setup({
  enabled = true,              -- Enable/disable the entire plugin
  gamification_enabled = true, -- Enable XP, levels, achievements

  {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'xzbdmw/colorful-menu.nvim', -- make sure this is loaded before blink.cmp
  },
  version = '1.*',
  event = "InsertEnter",
  opts = {
    keymap = { preset = 'super-tab' },

    appearance = {
      nerd_font_variant = 'mono', -- perfect alignment
    },

    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' },
    },

    windows = {
      autocomplete = {
        draw = {
          columns = { { "kind_icon", gap = 1 }, { "label" } },
          components = {
            kind_icon = {
              text = function(ctx) return ctx.kind_icon .. " " end,
              highlight = function(ctx) return ctx.kind_hl end,
            },
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      documentation = { auto_show = true },
      signature = { enabled = true },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
},-- Notification settings
  notifications = {
    enabled = true,       -- Master toggle for all notifications
    level_up = true,      -- Show level up notifications
    achievements = true,  -- Show achievement unlock notifications
  },

  -- Keymap configuration
  keymap = {
    show_profile = "<leader>p", -- Set to nil to disable default keymap
  },

  -- Auto-save interval (in seconds)
  auto_save_interval = 300, -- Save stats every 5 minutes

  -- Add custom language support
  custom_languages = {
    gleam = { icon = "✨", name = "Gleam" },
    odin = { icon = "🔷", name = "Odin" },
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
})
-----------------------------------------------------------------------------------
--LUXTERM
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
    toggle_manager = "<C-/>",     -- Toggle session manager
    next_session = "<C-k>",       -- Next session keybinding
    prev_session = "<C-j>",       -- Previous session keybinding
    global_session_nav = false,   -- Enable global session navigation
  }
})
-----------------------------------------------------------------------------------
--NOTES
require('telekasten').setup({
  home = vim.fn.expand("$HOME/zettelkasten"), -- Put the name of your notes directory here
})
-----------------------------------------------------------------------------------
