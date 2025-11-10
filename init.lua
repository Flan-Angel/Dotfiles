--here we fucking go again
-----------------------------------------------------------------------------------
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.keymap.set('n', '<F8>', '<cmd>split <cr>')
vim.keymap.set('n', '<F7>', '<cmd>vsplit <cr>')
vim.keymap.set('n', '<F9>', '<cmd>Gitstatus <cr>')
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

vim.g.mapleader = " "
vim.g.maplocalleader = " "
-----------------------------------------------------------------------------------
--PLUGINS
local plugins = {

  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[colorscheme nord]])
    end,
  },
  {"dgox16/oldworld.nvim",
  lazy = false},
  {"shaunsingh/nord.nvim",
  lazy = false},
  {"kdheepak/monochrome.nvim",
  lazy = false},
  {"dark-orchid/neovim", 
  lazy = false},
  {"maxmx03/fluoromachine.nvim",
  lazy = false},
  {"catppuccin/nvim",
  lazy =false},
  {"EdenEast/nightfox.nvim",
  lazy = false},
  {"olimorris/onedarkpro.nvim",
  lazy = false},
  {"scottmckendry/cyberdream.nvim",
  lazy = false},
  {"eldritch-theme/eldritch.nvim",
  lazy = false},
  {"uloco/bluloco.nvim", 
  lazy = false},
  {"shaunsingh/moonlight.nvim",
  lazy = false},
  {"datsfilipe/vesper.nvim",
  lazy = false},
  {"samharju/synthweave.nvim", 
  lazy = false},
  {"Tsuzat/NeoSolarized.nvim", 
  lazy = false},
  {"ficcdaf/ashen.nvim", 
  lazy = false},
  {"sekke276/dark_flat.nvim", 
  lazy = false},
  {"sainnhe/everforest",
  lazy = false},


--TREESITTER
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},

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
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
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
            position = "left",
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

--BLINK.CMP (auto complete suggestions)
  {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
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


--GIT
{
  'Mauritz8/gitstatus.nvim',
  -- optional dependencies
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- displays filetype icons
    -- 'nvim-mini/mini.icons' -- use mini.icons instead if you prefer
    'rcarriga/nvim-notify', -- displays nice notifications
  },
},


--MISC
{ "CRAG666/code_runner.nvim", config = true },
{ "jim-fx/sudoku.nvim" },             
{ "karb94/neoscroll.nvim" },                                                              
{ "alec-gibson/nvim-tetris" },                                                            
{ "ThePrimeagen/vim-be-good" },                                                         
{ "saxon1964/neovim-tips" },



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
local config = require("nvim-treesitter.configs")
 config.setup ({
   ensure_installed = { "c", "bash", "lua", "cmake", "gdscript", "hyprlang" },
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
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {desc = 'find files'})
vim.keymap.set('n', '<leader>l', builtin.live_grep,  {desc = 'live grep'})
vim.keymap.set('n', '<leader>c', builtin.colorscheme, {desc = 'switch colorscheme'})
vim.keymap.set('n', '<leader>m', builtin.man_pages, {desc = 'Man-Pages'})
vim.keymap.set('n', '<leader>k', builtin.keymaps, {desc = 'Keymaps? why tho'})
vim.keymap.set('n', '<leader>r', builtin.registers, {desc = 'registers/system clipboard'})
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
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

  local noice = require("noice")
  noice.setup({
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
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
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
