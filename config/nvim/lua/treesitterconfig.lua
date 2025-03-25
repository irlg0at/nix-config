require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "rust"},
	disable = {},

	highlight = {
		enable = true,
	}
}
