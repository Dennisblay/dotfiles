-- init.lua or keymaps.lua

-- Source vimrc (if you have a .vimrc and want to source it in Neovim)
--vim.cmd('source ~/.vimrc')

-- Set options
vim.opt.scrolloff = 5          -- Show a few lines of context around the cursor
vim.opt.incsearch = true        -- Do incremental searching
vim.opt.autoindent = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.clipboard:append { "unnamedplus" }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.mouse = 'a'
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 4
vim.opt.shiftwidth = 2
vim.opt.showmode = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spelllang = { "en" }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.undodir"
vim.opt.undofile = true
vim.opt.undolevels = 100
vim.opt.visualbell = true

-- Keymap options
vim.g.mapleader = " "

-- Keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Navigate windows
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Insert mode - exit insert mode with "jk"
map('i', 'jk', '<ESC>', opts)

-- Open a new line in normal mode
map('n', '<M-o>', 'o<ESC>', opts)

-- NERDTree mappings (replace with Neovim equivalent, like nvim-tree or netrw)
map('n', '<leader>ee', ':NERDTreeToggle<CR>', opts)

-- File navigation
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fs', ':Telescope symbols<CR>', opts)

-- Prevent 'J' from joining lines
map('n', 'J', '<Nop>', opts)
map('n', '<leader>j', 'J', opts)

-- Clear search highlights
map('n', '<leader>nh', ':nohlsearch<CR>', opts)

-- Quit Neovim
map('n', '<leader>qq', ':qa<CR>', opts)

-- Window management
map('n', '<leader>se', '<C-w>=', opts)  -- Equalize window size
map('n', '<leader>sh', '<C-w>s', opts)  -- Horizontal split
map('n', '<leader>sv', '<C-w>v', opts)  -- Vertical split
map('n', '<leader>sx', ':close<CR>', opts) -- Close window

-- Save file
map('n', '<leader>w', ':w<CR>', opts)

-- Moving around lines
map('n', 'K', '6k', opts)
map('n', 'J', '6j', opts)

-- Vim commentary plugin equivalent for commenting code
-- vim.cmd [[
--  Plug 'tpope/vim-commentary'
-- ]]
-- map('n', 'gc', '<Plug>Commentary', opts)

-- Add intention action (not directly mapped in nvim, but for code actions)
--
map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', opts)

-- Add this inside your Packer setup function or your init.lua
vim.api.nvim_set_keymap('n', '<leader>db', ':Dashboard<CR>', { noremap = true, silent = true })

-- Mapping for next tab
map('n', 'gt', ':tabnext<CR>', { noremap = true, silent = true })

-- Mapping for previous tab
map('n', 'gT', ':tabprevious<CR>', { noremap = true, silent = true })

-- Highlight text after yank (if using vim-highlightedyank)
-- vim.cmd [[
--  Plug 'machakann/vim-highlightedyank'
--  autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual = false}
-- ]]

-- -- Plugins loading (if using packer.nvim or another plugin manager)
-- require('packer').startup(function()
  -- use 'tpope/vim-commentary'
  --  use 'machakann/vim-highlightedyank'
  -- Add your other plugins here
  -- end)



