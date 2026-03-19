
" ==============================================================================
" CORE SYSTEM & UI
" ==============================================================================
syntax on                  " Enable syntax highlighting
set termguicolors          " Enable true color for exact VS Code hex colors
set number                 " Show absolute line number on the current line
set cursorline             " Highlight the entire line your cursor is currently on
set signcolumn=yes         " Keep a margin on the left for error markers
set clipboard=unnamedplus  " Link Neovim's yank/paste to the system clipboard

" ==============================================================================
" SEARCHING
" ==============================================================================
set ignorecase             " Case-insensitive search
set smartcase              " Case-sensitive if you type a capital letter
set incsearch              " Show search matches instantly as you type
set hlsearch               " Highlight all search results (type :noh to clear)

" ==============================================================================
" PYTHON INDENTATION
" ==============================================================================
filetype plugin indent on  " Apply correct indentation rules based on file type
set autoindent
set smartindent
set tabstop=4              " A tab is 4 spaces
set shiftwidth=4           " An auto-indent is 4 spaces
set expandtab              " Convert tabs to spaces

" ==============================================================================
" INVISIBLE CHARACTERS
" ==============================================================================
" Disabled to keep the screen completely clean of dots and arrows
" set list
" set listchars=tab:▸\ ,extends:❯,precedes:❮

" ==============================================================================
" PLUGINS
" ==============================================================================
call plug#begin()

" The modern, smart indent line plugin
Plug 'lukas-reineke/indent-blankline.nvim'
" VS Code Dark Theme
Plug 'tomasiser/vim-code-dark'

call plug#end()

" ==============================================================================
" COLOR SCHEME & THEME TWEAKS
" ==============================================================================
autocmd VimEnter * colorscheme codedark


" --- THE UBUNTU PURPLE FIX ---
" Must be placed AFTER the colorscheme to override its default black background
highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
" highlight EndOfBuffer guibg=NONE ctermbg=NONE

" Add this line to force standard text to be pure white
" highlight Normal guifg=#FFFFFF ctermfg=White


" ==============================================================================
" PLUGIN CONFIGURATION
" ==============================================================================
" Configure indent-blankline to be smart and highlight active blocks
lua << EOF
require("ibl").setup {
    indent = { 
        char = "│", 
    },
    scope = {
        enabled = true,          -- Highlights the current if/for block you are in
        show_start = false,
        show_end = false,
    },
}
EOF


