-- This file can be loaded by calling lua require('plugins') from your init.lua

-- Only required if you have packer configured as opt
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope for fuzzy finding
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Rose Pine colorscheme
  use {
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  }

  -- Treesitter for better syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Harpoon for quick navigation between files
  use 'ThePrimeagen/harpoon'

  -- UndoTree for visualizing undo history
  use 'mbbill/undotree'

  -- Git integration with Fugitive
  use 'tpope/vim-fugitive'

  -- LSP and autocompletion setup using lsp-zero
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'}
    }
  }

  -- Commenting plugin (numToStr/Comment.nvim)
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        mappings = {
          basic = true,  -- Includes gc, gcc
        }
      }
    end
  }

  -- Surround plugin (kylechui/nvim-surround)
  use {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup()
    end
  }

  -- Auto pairs (windwp/nvim-autopairs)
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
    event = "InsertEnter" -- Lazy load in insert mode
  }

  -- Bufferline (akinsho/nvim-bufferline.lua)
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons', -- Icons for buffers
    config = function()
      require('bufferline').setup{}
    end,
    event = "BufWinEnter" -- Lazy load on opening a buffer
  }

  -- Dashboard (glepnir/dashboard-nvim)
  use {
    'glepnir/dashboard-nvim',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
          header = {
            "Welcome to Neovim!",
            "Your custom message here."
          },
          shortcuts = {
            ["f"] = "Find File",
            ["r"] = "Recently Used Files",
            ["n"] = "New File",
          },
        }
      }
    end
  }

  -- Toggle Terminal (akinsho/toggleterm.nvim)
use {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<C-t>]],  -- This sets the toggle key to Ctrl + t
    }
  end,
  keys = {'<C-t>'}  -- Lazy load on toggle terminal keypress
}

  -- Status Line (nvim-lualine/lualine.nvim)
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'rose-pine' }
      }
    end,
    event = 'VimEnter'  -- Lazy load on Vim start
  }



  -- LSP and autocompletion setup using lsp-zero
use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x', -- Make sure to specify the version branch
        requires = {
            {'neovim/nvim-lspconfig'}, -- Required for LSP support
            {'hrsh7th/nvim-cmp'}, -- Required for autocompletion
            {'hrsh7th/cmp-nvim-lsp'}, -- LSP source for nvim-cmp
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-cmdline'},
            {'L3MON4D3/LuaSnip'}, -- Snippets
        }
    }

  -- -- Indent guides (lukas-reineke/indent-blankline.nvim)
  -- use {
  --   'lukas-reineke/indent-blankline.nvim',
  --   config = function()
  --     require('ibl').setup {
  --       scope = {
  --         enabled = true, -- This enables the context line scope display
  --       },
  --     }
  --   end,
  --   event = "BufReadPre" -- Lazy load on buffer read
  -- }

end)
