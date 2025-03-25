" Set leader to spacebar
let mapleader=" "
let maplocalleader = " "

lua require("lazyconfig")

colorscheme dracula
syntax on

" ------------------------------------
"           Configurations 
" ------------------------------------


" Enable line numbers
set number

" Set a tab to two spaces
set tabstop=2

" Set shiftwidth(starting tab) to two spaces
set shiftwidth=2

set conceallevel=2

" ------------------------------------
"         Plugin configurations
" ------------------------------------

" Load a server for vimtex to rely on

let g:vimtex_compiler_progname = 'nvr'

" Load latex when encountering a .tex file
let g:tex_flavor = 'latex'

" Set default vimtex pdf viewer to zathura
let g:vimtex_view_method = 'zathura'

" Let airline-vim use powerline fonts
let g:airline_powerline_fonts=1


" dap config
lua require("dapconfig")
lua require("dapuiconfig")
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

" treesitter config
lua require("treesitterconfig")

" whichkey config
lua require("whichkeyconfig")

" neorg config
lua require("neorgconfig")

" image setup
lua require("imageconfig")

" neovide config
let g:neovide_scale_factor = 1


" luasnips config
lua require("luasnipconfig")

" setup up language servers
lua require("languageconfig")

" ------------------------------------
"        	 Keymaps 
" ------------------------------------

" dap
nnoremap <silent> <leader>dt <Cmd>lua require('dapui').toggle()<CR>
nnoremap <silent> <leader>dc <Cmd>lua require('dap').continue()<CR>
nnoremap <silent> <leader>db <Cmd>lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent> <leader>do <Cmd>lua require('dap').step_over()<CR>
nnoremap <silent> <leader>di <Cmd>lua require('dap').step_into()<CR>
nnoremap <silent> <leader>du <Cmd>lua require('dap').step_out()<CR>

" molten.nvim
lua require("moltenconfig")
