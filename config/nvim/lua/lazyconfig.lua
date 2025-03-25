-- Installation of lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setting leader already
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				vim.o.timeout = true
				vim.o.timeoutlen = 300
			end,

		},
		{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			theme = 'dracula'
		}
		},
    "lervag/vimtex",
    {"Mofiqul/dracula.nvim", name = "dracula"},
		{"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
			-- disable netrw at the very start of your init.lua
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		keys = {
			{"<leader>n", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree"}
		}
		},
    "mfussenegger/nvim-dap",
		{"rcarriga/nvim-dap-ui", init = function()
			require("dapui").setup()
		end
		},
    "mfussenegger/nvim-dap-python",
   {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
	 	config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "markdown" },
				highlight = {
					enable = true,
					disable = {""},
					additional_vim_regex_highlighting = { "latex", "markdown" },
				},
			})
		end
 },
	 { "nvim-neotest/nvim-nio" },
	{
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    --version = "*", -- Pin Neorg to the latest stable release
		branch = "main"
	},
	{
			"3rd/image.nvim",
			dependencies = { "leafo/magick" }
	},
	{
			"benlubas/molten-nvim",
			version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
			dependencies = { "3rd/image.nvim" },
			build = ":UpdateRemotePlugins"
  },
	{
			"quarto-dev/quarto-nvim",
			dependencies = {
				"jmbuhr/otter.nvim",
				"nvim-treesitter/nvim-treesitter",
				"neovim/nvim-lspconfig"
			},
			ft = {"quarto", "markdown"}

	},
  "GCBallesteros/jupytext.nvim",
	{
		"jbyuki/nabla.nvim",
		config = function()
			vim.cmd('nnoremap <leader>p :lua require("nabla").popup({border = "rounded"})<CR>')
			--[[
			require("nabla").enable_virt({
				autogen = false,
				silent = true,
			})
			]]--
		end
	},
	{"dhruvasagar/vim-table-mode"},
	{ 'echasnovski/mini.nvim', version = false },
	{
		"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
  opts = {
    file_types = { "markdown", "Avante" },
		latex = {enabled = false}
  },
  ft = { "markdown", "Avante" },
	dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	},
	{
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' }
  },
	{
			"lukas-reineke/indent-blankline.nvim",
			main = "ibl",
			---@module "ibl"
			---@type ibl.config
			opts = {},
			init = function()
				require("ibl").setup()
			end
	},
	{
		'hat0uma/csvview.nvim',
		config = function()
			require('csvview').setup()
		end
	},{
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
        'csv',
        'tsv',
        'csv_semicolon',
        'csv_whitespace',
        'csv_pipe',
        'rfc_csv',
        'rfc_semicolon'
    },
    cmd = {
        'RainbowDelim',
        'RainbowDelimSimple',
        'RainbowDelimQuoted',
        'RainbowMultiDelim'
    }
},
{
  "yetone/avante.nvim",
  event = "VeryLazy",
	enabled = false,
  lazy = true,
  version = false, -- set this if you want to always pull the latest change
  opts = { 
		provider='copilot'
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
	}
},
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		opts = {},
		enabled = false

	},
	{
    "williamboman/mason.nvim",
		opts = {}
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			automatic_installation = true
		}
	},
	{
		'saghen/blink.cmp',
		lazy = false,
		opts = {},
  	version = 'v0.*',
	},
	{'liuchengxu/graphviz.vim'},
	{
		"allaman/emoji.nvim",
			version = "1.0.0", -- optionally pin to a tag
			ft = "markdown", -- adjust to your needs
			dependencies = {
				-- util for handling paths
				"nvim-lua/plenary.nvim",
				-- optional for telescope integration
				"nvim-telescope/telescope.nvim",
			},
			config = function()
				local ts = require('telescope').load_extension 'emoji'
				vim.keymap.set('n', '<leader>fe', ts.emoji, { desc = 'Find Emoji' })
			end,
	},
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
    },

	{
    'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end,
    
	}
}


})
