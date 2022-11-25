-- ## General ## --
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "gruvbox"

vim.cmd [[ set mouse-=a ]]
vim.opt.listchars = { tab = "├─", trail = "·", nbsp = "⎵" }
vim.opt.list = true
vim.opt.showmode = true
vim.opt.laststatus = 3
vim.opt.startofline = true
vim.opt.confirm = true
vim.opt.wrap = true
vim.g["loaded_node_provider"] = 0
vim.g["loaded_perl_provider"] = 0
vim.g["loaded_ruby_provider"] = 0

-- ## Keymappings ## --
-- view all the defaults by pressing <leader>Lk
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = "<CMD>w<CR>"
lvim.keys.insert_mode["<C-s>"] = "<ESC><CMD>w<CR>"
-- lvim.keys.normal_mode["<Tab>"] = "<CMD>BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-Tab>"] = "<CMD>BufferLineCyclePrev<CR>"
lvim.keys.normal_mode[",<Tab>"] = "<CMD>tabNext<CR>"
lvim.keys.normal_mode[",<S-Tab>"] = "<CMD>tabprevious<CR>"
lvim.keys.normal_mode["<CR>"] = "<CMD>nohlsearch<CR><CR>"
lvim.builtin.which_key.mappings["h"] = nil
lvim.keys.normal_mode[",,"] = "<C-^>"
-- lvim.keys.insert_mode["<Up>"] = "<ESC><Up>"
-- lvim.keys.insert_mode["<Down>"] = "<ESC><Down>"
lvim.keys.normal_mode["<F2>"] = "<CMD>set number!<CR><CMD>set list!<Bar>set list?<CR>"
lvim.keys.visual_mode["p"] = "\"_dP"
lvim.keys.visual_mode[",'"] = "<C-v>I'<ESC>gv$A',<ESC>gvgJ$r<CMD>keeppatterns s/\\(.\\{-\\},\\)\\{10\\}/&\r/g<CR>"
lvim.keys.normal_mode["<leader>z"] = "<CMD>MaximizerToggle<CR>"
lvim.keys.visual_mode["<leader>z"] = "<CMD>MaximizerToggle<CR>gv"
-- lvim.keys.normal_mode["<leader>C"] = "<CMD>BufferKill!<CR>"
lvim.builtin.which_key.mappings['x'] = {
  "<CMD>enew | setlocal bt=nofile bh=hide noswapfile nu | file Scratch<CR>", "Scratch"
}

-- for neoscroll support
lvim.keys.normal_mode["<PageUp>"] = { '<C-b>', { remap = true } }
lvim.keys.normal_mode["<PageDown>"] = { '<C-f>', { remap = true } }
lvim.keys.visual_mode["<PageUp>"] = { '<C-b>', { remap = true } }
lvim.keys.visual_mode["<PageDown>"] = { '<C-f>', { remap = true } }


lvim.keys.insert_mode["<C-l>"] = "<ESC><C-w>l"
lvim.keys.insert_mode["<C-h>"] = "<ESC><C-w>h"
lvim.keys.insert_mode["<C-k>"] = "<ESC><C-w>k"
lvim.keys.insert_mode["<C-j>"] = "<ESC><C-w>j"

-- lvim.keys.normal_mode["<leader>y"] = "\"+y"
-- lvim.keys.normal_mode["<leader>p"] = "\"+p"
-- lvim.keys.normal_mode["<leader>P"] = "\"+P"
-- lvim.keys.normal_mode["<leader>d"] = "\"+d"

-- lvim.keys.visual_mode["<leader>y"] = "\"+y"
-- lvim.keys.visual_mode["<leader>p"] = "\"+p"
-- lvim.keys.visual_mode["<leader>P"] = "\"+P"
-- lvim.keys.visual_mode["<leader>d"] = "\"+d"


-- comment line gcc fix
vim.api.nvim_set_keymap('o', 'c', '^', { noremap = true, silent = true })

-- ## Builtins ## --
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.mode = "startify"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.bufferline.options.always_show_bufferline = true
lvim.builtin.bufferline.options.buffer_close_icon = ""

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  -- "c",
  -- "javascript",
  "json",
  "lua",
  "python",
  "vim",
  -- "typescript",
  -- "tsx",
  -- "css",
  -- "rust",
  -- "java",
  "yaml",
  "r"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


-- Additional Plugins
lvim.plugins = {
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" },
  { "tpope/vim-obsession" },
  { "szw/vim-maximizer" },
  { "christoomey/vim-tmux-navigator" },
  -- { "ivanov/vim-ipython" },
  { "bfredl/nvim-ipy" },

  -- ## colorscheme ##
  { "morhetz/gruvbox" },
  -- { "Mofiqul/dracula.nvim" },
  -- { "folke/tokyonight.nvim" },

  -- {
  --   "jpalardy/vim-slime",
  --   ft = { 'python' },
  --   config = function()
  --     vim.cmd([[
  --     let g:slime_target = "tmux"
  --     let g:slime_cell_delimiter = "^#\s*%%"
  --     let g:slime_default_config = { "socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1" }
  --     let g:slime_dont_ask_default = 1
  --     let g:slime_bracketed_paste = 1
  --     let g:slime_no_mappings = 1
  --     let g:slime_python_ipython = 1
  --     nmap <leader>rv <Plug>SlimeConfig
  --     vmap <leader>rr <Plug>SlimeRegionSend
  --     nmap <leader>rr <Plug>SlimeCellsSendAndGoToNext
  --     nmap <leader>rj <Plug>SlimeCellsNext
  --     nmap <leader>rk <Plug>SlimeCellsPrev
  --     ]])
  --   end
  -- },

  -- {
  --   'klafyvel/vim-slime-cells',
  --   requires = { { 'jpalardy/vim-slime', opt = true } },
  --   ft = { 'python' },
  -- },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indentLine_enabled = 1
      vim.g.indent_blankline_char = "▏"
      vim.g.indent_blankline_filetype_exclude = { "help", "terminal", "dashboard" }
      vim.g.indent_blankline_buftype_exclude = { "terminal", "NvimTree" }
      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = false
    end
  },

  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },

  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
          '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = nil, -- Function to run before the scrolling animation starts
        post_hook = nil, -- Function to run after the scrolling animation ends
      })
    end
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- { "vimwiki/vimwiki" },
  -- { "tools-life/taskwiki" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocmds = {
  { "BufWinEnter",
    {
      pattern = { "*.lua" },
      command = "setlocal ts=8 sw=8",
    },
  },
  { "BufWritePre",
    {
      pattern = { "*" },
      command = "%s/\\s\\+$//e",
    },
  },
  { "TermOpen",
    {
      pattern = { "*" },
      command = [[tnoremap <buffer> <Esc> <c-\><c-n>]],
    },
  },
  { "TermOpen",
    {
      pattern = { "*" },
      command = "startinsert",
    },
  },
  { "TermEnter",
    {
      pattern = { "*" },
      command = "startinsert",
    },
  },
  { "TermOpen",
    {
      pattern = { "*" },
      command = "setlocal listchars= nonumber norelativenumber",
    },
  },
}
