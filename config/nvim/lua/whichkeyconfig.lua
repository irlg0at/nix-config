local wk = require("which-key")
wk.add({
    { "<localleader>d", desc = "dap" },
    { "<localleader>db", desc = "Dap: Toggle Breakpoint" },
    { "<localleader>dc", desc = "Dap: Continue" },
    { "<localleader>di", desc = "Dap: Step Into" },
    { "<localleader>do", desc = "Dap: Step Over" },
    { "<localleader>dt", desc = "Toggle DapUI" },
    { "<localleader>du", desc = "Dap: Step Out" },
    { "<localleader>e", "<cmd>e $MYVIMRC<cr>", desc = "Open init" },
    { "<localleader>p", desc = "Latex preview" },
		{"<leader>ff","<cmd>Telescope find_files<cr>", desc="TS: Find files"},
		{"<leader>fg","<cmd>Telescope live_grep<cr>", desc="TS: Live Grep"},
		{"<leader>fb","<cmd>Telescope buffers<cr>", desc="TS: Buffers"},
		{"<leader>fh","<cmd>Telescope help_tags<cr>", desc="TS: Help Tags"},
})
