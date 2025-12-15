--here we fucking go again

----------------------------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set rnu")
vim.cmd("set nu")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")



--
--KEYBINDS  
--
--
--
--
--
--
vim.keymap.set('n', '<leader>Z', '<cmd>ZenMode <cr>')
--Bufferline
--
vim.keymap.set('n', '<leader>1', 'require("lazy").setup(plugins)<cmd>BufferLineGoToBuffer 1 <cr>')
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2 <cr>')
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3 <cr>')
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4 <cr>')
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5 <cr>')
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6 <cr>')
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7 <cr>')
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8 <cr>')
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9 <cr>')
--
vim.keymap.set('n', '<leader>e', '<cmd>BufferLineCycleNext <cr>')
vim.keymap.set('n', '<leader>q', '<cmd>BufferLineCycleNext <cr>')
--Games 
vim.keymap.set('n', '<leader>Gp', '<cmd>Playtime <cr>')
vim.keymap.set('n', '<leader>Gs', '<cmd>Sudoku <cr>')
vim.keymap.set('n', '<leader>Gv', '<cmd>VimBeGood <cr>')
vim.keymap.set('n', '<leader>Gt', '<cmd>Tetris <cr>')
vim.keymap.set('n', '<leader>Gr', '<cmd>CellularAutomaton make_it_rain <cr>')
vim.keymap.set('n', '<leader>Gl', '<cmd>CellularAutomaton game_of_life <cr>')
--
vim.keymap.set('n', '<leader>R', '<cmd>RunCode <cr>')
vim.keymap.set('n', '<leader>.', '<cmd>split <cr>')
vim.keymap.set('n', '<leader>,', '<cmd>vsplit <cr>')
vim.keymap.set('n', '<leader>/', '<cmd>SunglassesEnableToggle <cr>')
vim.keymap.set('n', '<leader>j', '<cmd>:LuxtermToggle <cr>')
vim.keymap.set('n', '<leader>N', '<cmd>Telekasten <cr>')
vim.keymap.set('n', '<leader>n', '<cmd>Telekasten new_note<cr>')
-----------------------------------------------------------------------------------
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
-----------------------------------------------------------------------------------
--PLUGINS
local plugins = {

  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme moonlight]])
    end,
  },
  {"dgox16/oldworld.nvim",
  lazy = false},
  {"maxmx03/fluoromachine.nvim", 
  lazy = false},
  {"catppuccin/nvim", 
  lazy = false},
  {"EdenEast/nightfox.nvim", 
  lazy = false},
  {"eldritch-theme/eldritch.nvim", 
  lazy = false},
  {"shaunsingh/moonlight.nvim", 
  lazy = false},
  {"ficcdaf/ashen.nvim",  
  lazy = false},
  {"sekke276/dark_flat.nvim",  
  lazy = false},
  {"sainnhe/everforest", 
  lazy = false},
  {"uhs-robert/oasis.nvim", 
  lazy = false},
  {"wurli/cobalt.nvim", 
  lazy = false,},
  {"everviolet/nvim", name = 'evergarden', 
  lazy = false},
  { "zootedb0t/citruszest.nvim", 
  lazy = false,},
  {"samharju/serene.nvim", 
  lazy = false,},

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
      "<leader>?",
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
  
--NOICE GUI
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  },

--BUFFERLINE
 {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},


--LUALINE
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

{
    "xzbdmw/colorful-menu.nvim",
  lazy = false,
    config = function()
        -- You don't need to set these options.
        require("colorful-menu").setup({
            ls = {
                lua_ls = {
                    -- Maybe you want to dim arguments a bit.
                    arguments_hl = "@comment",
                },
                gopls = {
                    -- By default, we render variable/function's type in the right most side,
                    -- to make them not to crowd together with the original label.

                    -- when true:
                    -- foo             *Foo
                    -- ast         "go/ast"

                    -- when false:
                    -- foo *Foo
                    -- ast "go/ast"
                    align_type_to_right = true,
                    -- When true, label for field and variable will format like "foo: Foo"
                    -- instead of go's original syntax "foo Foo". If align_type_to_right is
                    -- true, this option has no effect.
                    add_colon_before_type = false,
                    -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                -- for lsp_config or typescript-tools
                ts_ls = {
                    -- false means do not include any extra info,
                    -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
                    extra_info_hl = "@comment",
                },
                vtsls = {
                    -- false means do not include any extra info,
                    -- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
                    extra_info_hl = "@comment",
                },
                ["rust-analyzer"] = {
                    -- Such as (as Iterator), (use std::io).
                    extra_info_hl = "@comment",
                    -- Similar to the same setting of gopls.
                    align_type_to_right = true,
                    -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                clangd = {
                    -- Such as "From <stdio.h>".
                    extra_info_hl = "@comment",
                    -- Similar to the same setting of gopls.
                    align_type_to_right = true,
                    -- the hl group of leading dot of "•std::filesystem::permissions(..)"
                    import_dot_hl = "@comment",
                    -- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
                    preserve_type_when_truncate = true,
                },
                zls = {
                    -- Similar to the same setting of gopls.
                    align_type_to_right = true,
                },
                roslyn = {
                    extra_info_hl = "@comment",
                },
                dartls = {
                    extra_info_hl = "@comment",
                },
                -- The same applies to pyright/pylance
                basedpyright = {
                    -- It is usually import path such as "os"
                    extra_info_hl = "@comment",
                },
                pylsp = {
                    extra_info_hl = "@comment",
                    -- Dim the function argument area, which is the main
                    -- difference with pyright.
                    arguments_hl = "@comment",
                },
                -- If true, try to highlight "not supported" languages.
                fallback = true,
                -- this will be applied to label description for unsupport languages
                fallback_extra_info_hl = "@comment",
            },
            -- If the built-in logic fails to find a suitable highlight group for a label,
            -- this highlight is applied to the label.
            fallback_highlight = "@variable",
            -- If provided, the plugin truncates the final displayed text to
            -- this width (measured in display cells). Any highlights that extend
            -- beyond the truncation point are ignored. When set to a float
            -- between 0 and 1, it'll be treated as percentage of the width of
            -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
            -- Default 60.
            max_width = 60,
        })
    end,
},


--BLINK.CMP (auto complete suggestions)
  {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets',
                    'xzbdmw/colorful-menu.nvim' },
  version = '1.*',
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
    keymap = { preset = 'super-tab', 
    ['Up'] = false,
    ['Down'] = false
       },
    appearance = {
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets'},
    },
    completion = {
     ghost_text = { enabled = true },

    },
        },
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" },

  
  
  opts_extend = { "sources.default" }
  },



 
--TROUBLE (shows errors in file or something)
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
⠀⠀⠀⠀⠀⠀⠀⣠⡤⠶⡄⠀⠀⠀⠀⠀⠀⠀⢠⠶⣦⣀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣴⣿⡟⠀⠈⣀⣾⣝⣯⣿⣛⣷⣦⡀⠀⠈⢿⣿⣦⡀⠀⠀⠀⠀
⠀⠀⠀⣴⣿⣿⣿⡇⠀⢼⣿⣽⣿⢻⣿⣻⣿⣟⣷⡄⠀⢸⣿⣿⣾⣄⠀⠀⠀
⠀⠀⣞⣿⣿⣿⣿⣷⣤⣸⣟⣿⣿⣻⣯⣿⣿⣿⣿⣀⣴⣿⣿⣿⣿⣯⣆⠀⠀
⠀⡼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣜⡆⠀
⢠⣟⣯⣿⣿⣿⣷⢿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣟⠿⣿⣿⣿⣿⡷⣾⠀
⢸⣯⣿⣿⡏⠙⡇⣾⣟⣿⡿⢿⣿⣿⣿⣿⣿⢿⣟⡿⣿⠀⡟⠉⢹⣿⣿⢿⡄
⢸⣯⡿⢿⠀⠀⠱⢈⣿⢿⣿⡿⣏⣿⣿⣿⣿⣿⣿⣿⣿⣀⠃⠀⢸⡿⣿⣿⡇
⢸⣿⣇⠈⢃⣴⠟⠛⢉⣸⣇⣹⣿⣿⠚⡿⣿⣉⣿⠃⠈⠙⢻⡄⠎⠀⣿⡷⠃
⠈⡇⣿⠀⠀⠻⣤⠠⣿⠉⢻⡟⢷⣝⣷⠉⣿⢿⡻⣃⢀⢤⢀⡏⠀⢠⡏⡼⠀
⠀⠘⠘⡅⠀⣔⠚⢀⣉⣻⡾⢡⡾⣻⣧⡾⢃⣈⣳⢧⡘⠤⠞⠁⠀⡼⠁⠀⠀
⠀⠀⠀⠸⡀⠀⢠⡎⣝⠉⢰⠾⠿⢯⡘⢧⡧⠄⠀⡄⢻⠀⠀⠀⢰⠁⠀⠀⠀
⠀⠀⠀⠀⠁⠀⠈⢧⣈⠀⠘⢦⠀⣀⠇⣼⠃⠰⣄⣡⠞⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢤⠼⠁⠀⠀⠳⣤⡼⠀⠀⠀⠀⠀⠀
          ]],
        },
    sections = {
    { section = "header" },
    {
      pane = 2,
      section = "header",
      height = 5,
      padding = 1,
    },
    { section = "keys", gap = 1, padding = 1 },
    { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
    {
      pane = 2,
      icon = " ",
      title = "Git Status",
      section = "terminal",
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = "git status --short --branch --renames",
      height = 5,
      padding = 1,
      ttl = 5 * 60,
      indent = 3,
    },
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




-- Colourful auto complete suggestions

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

{"rktjmp/playtime.nvim",
 },  
{
  'jim-fx/sudoku.nvim',
  
  cmd = "Sudoku",
  config = function()
    require("sudoku").setup({
      -- configuration ...
    })
  end
},
{ "alec-gibson/nvim-tetris"},                                                            
{ "ThePrimeagen/vim-be-good"},                                                         
{"eandrju/cellular-automaton.nvim"},


{ "karb94/neoscroll.nvim" },                                                              
{ "saxon1964/neovim-tips" },
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
-----------------------------------------------------------------------------------
local opts = {
 }
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

-----------------------------------------------------------------------------------
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
--NOICE GUI
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = false, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

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
    lualine_x = {
       {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      }
    },
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
-----------------------------------------------------------------------------------
---BLINKCMP

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
    toggle_manager = "<leader>T",     -- Toggle session manager
    next_session = "<C-k>",       -- Next session keybinding
    prev_session = "<C-j>",       -- Previous session keybinding
    global_session_nav = false,   -- Enable global session navigation
  }
})
-----------------------------------------------------------------------------------
--NOTES
require('telekasten').setup({
  home = vim.fn.expand("$HOME/.config/zettelkasten"), -- Put the name of your notes directory here
})
-----------------------------------------------------------------------------------
require("blink.cmp").setup({
  appearance = {
    kind_icons = {
      Text = "󰉿",
      Method = "󰆧",
      Function = "󰊕",
      Constructor = "",
      Field = "󰜢",
      Variable = "󰀫",
      Class = "󰠱",
      Interface = "",
      Module = "",
      Property = "󰜢",
      Unit = "󰑭",
      Value = "󰎠",
      Enum = "",
      Keyword = "󰌋",
      Snippet = "",
      Color = "󰏘",
      File = "󰈙",
      Reference = "󰈇",
      Folder = "󰉋",
      EnumMember = "",
      Constant = "󰏿",
      Struct = "󰙅",
      Event = "",
      Operator = "󰆕",
      TypeParameter = "",
    },
  },
})
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------re("lazy").setup(plugins)e-----------------------------------------------
