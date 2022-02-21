require('/plugins/configs')
vim.g.mapleader = " " -- let leader to space (' ')
-- nnoremap <C-n> :NvimTreeToggle<CR>
-- nnoremap <C-s> :write<CR>

-- bindings
--vim.api.nvim_set_keymap( 'n',   '<leader>e', ':NvimTreeToggle<CR>', {noremap = true}) -- toggle nerd tree with space + e

--If you want to automatically ensure that packer.nvim is installed on any machine you clone your configuration to,
--add the following snippet (which is due to @Iron-E) somewhere in your config before your first usage of packer:

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup{function()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { -- A collection of common configurations for Neovim's built-in language server client
          'neovim/nvim-lspconfig',
          config = [[ require('plugins/lspconfig') ]]
  }

  use {
          'williamboman/nvim-lsp-installer',
          config = [[ require('plugins/lsp_installer_nvim') ]]
  }

  use { -- vscode-like pictograms for neovim lsp completion items Topics
          'onsails/lspkind-nvim',
          config = [[ require('plugins/lspkind') ]]
  }

  use { -- Utility functions for getting diagnostic status and progress messages from LSP servers, for use in the Neovim statusline
          'nvim-lua/lsp-status.nvim',
          config = [[ require('plugins/lspstatus') ]]
  }

  use { -- A completion plugin for neovim coded in Lua.
        'hrsh7th/nvim-cmp',
        requires = {
          "hrsh7th/cmp-nvim-lsp",           -- nvim-cmp source for neovim builtin LSP client
          "hrsh7th/cmp-nvim-lua",           -- nvim-cmp source for nvim lua
          "hrsh7th/cmp-buffer",             -- nvim-cmp source for buffer words.
          "hrsh7th/cmp-path",               -- nvim-cmp source for filesystem paths.
          "hrsh7th/cmp-calc",               -- nvim-cmp source for math calculation.
          "saadparwaiz1/cmp_luasnip",       -- luasnip completion source for nvim-cmp
        },
        config = [[ require('plugins/cmp') ]],
  }

  use { -- Snippet Engine for Neovim written in Lua.
        'L3MON4D3/LuaSnip',
        requires = {
          "rafamadriz/friendly-snippets",   -- Snippets collection for a set of different programming languages for faster development.
        },
        config = [[ require('plugins/luasnip') ]],
  }

  use { --  colorscheme for (neo)vim written in lua specially made for roshnivim
  'Mofiqul/dracula.nvim',
  }

 use { -- Nvim Treesitter configurations and abstraction layer
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[ require('plugins/treesitter') ]]
  }
  use { -- A super powerful autopairs for Neovim. It support multiple character.
       'windwp/nvim-autopairs',
       config = [[ require('plugins/autopairs') ]]
  }

  use 'fatih/vim-go'

  use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      }

  use 'vim-airline/vim-airline'

  use 'vim-airline/vim-airline-themes'

  use 'mortepau/codicons.nvim'

	-- tree - a file explorer
  use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {
					disable_netrw        = false,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  auto_close           = false,
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = false,
  hijack_unnamed_buffer_when_opening = true,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
				} end
    }

    use { -- nvim dashboard
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

use({
    "aserowy/tmux.nvim",
    config = function()
        require("tmux").setup({
            -- overwrite default configuration
            -- here, e.g. to enable default bindings
            copy_sync = {
                -- enables copy sync and overwrites all register actions to
                -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                enable = true,
            },
            navigation = {
                -- enables default keybindings (C-hjkl) for normal mode
                enable_default_keybindings = true,
            },
            resize = {
                -- enables default keybindings (A-hjkl) for normal mode
                enable_default_keybindings = true,
            }
        })
    end
})

 use({
		'https://gitlab.com/yorickpeterse/nvim-window.git',
		config = function ()
		require('nvim-window').setup({
			-- The characters available for hinting windows.
			chars = {
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
				'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
			},

			-- A group to use for overwriting the Normal highlight group in the floating
			-- window. This can be used to change the background color.
			normal_hl = 'Normal',

			-- The highlight group to apply to the line that contains the hint characters.
			-- This is used to make them stand out more.
			hint_hl = 'Bold',

			-- The border style to use for the floating window.
			border = 'single'
		})
	end
})

end, config = {
  -- Move to lua dir so impatient.nvim can cache it
  compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'

  }
}
