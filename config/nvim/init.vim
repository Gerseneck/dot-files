:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set whichwrap+=<,>,[,]
:set encoding=UTF-8

call plug#begin()

Plug 'https://github.com/tpope/vim-surround'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/lifepillar/pgsql.vim'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " :CocInstall coc-pyright coc-java
call plug#end()

:colorscheme jellybeans

nnoremap <C-f> <cmd>CHADopen<CR>
nnoremap <C-t> <cmd>TagbarToggle<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
