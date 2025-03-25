vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>",
    { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>",
    { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>",
    { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>",
    { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
    { silent = true, desc = "evaluate visual selection" })
vim.keymap.set("n", "<localleader>mfe", ":MoltenExportOutput!",
    { silent = true, desc = "Export Jupyter Notebook of same name" })
vim.keymap.set("n", "<localleader>mfi", ":MoltenImportOutput!",
    { silent = true, desc = "Import Jupyter Notebook of same name" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", 
		{ desc = "close output window", silent = true })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>",
    { silent = true, desc = "show/enter output" })
vim.keymap.set("n", "<localleader>md", ":MoltenDelete<CR>", 
		{ desc = "delete Molten cell", silent = true })

-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = false
vim.g.molten_enter_output_behaviour = "open_and_enter"

-- set auto image 
vim.g.molten_auto_image_popup = "true"

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
vim.g.molten_image_provider = "none"

-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
vim.g.molten_virt_text_output = true

-- this will make it so the output shows up below the \`\`\` cell delimiter
vim.g.molten_virt_lines_off_by_1 = true

local quarto = require("quarto")
quarto.setup({
    lspFeatures = {
        -- NOTE: put whatever languages you want here:
        languages = { "r", "python", "rust" },
        chunks = "all",
        diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
        },
        completion = {
            enabled = true,
        },
    },
    keymap = {
        -- NOTE: setup your own keymaps:
        hover = "H",
        definition = "gd",
        rename = "<leader>rn",
        references = "gr",
        format = "<leader>gf",
    },
    codeRunner = {
        enabled = true,
        default_method = "molten",
    },
})

local runner = require("quarto.runner")
vim.keymap.set("n", "<localleader>rc", runner.run_cell,  { desc = "run cell", silent = true })
vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
vim.keymap.set("n", "<localleader>rA", runner.run_all,   { desc = "run all cells", silent = true })
vim.keymap.set("n", "<localleader>rl", runner.run_line,  { desc = "run line", silent = true })
vim.keymap.set("v", "<localleader>r",  runner.run_range, { desc = "run visual range", silent = true })
vim.keymap.set("n", "<localleader>RA", function()
  runner.run_all(true)
end, { desc = "run all cells of all languages", silent = true })

require("jupytext").setup({
    style = "markdown",
    output_extension = "md",
    force_ft = "markdown",
})

local otter = require('otter')
otter.setup({
	lsp = {
		diagnostics_update_events = { "BufWritePost", "InsertLeave", "TextChanged" }
	},
	buffers = {
	}
})


