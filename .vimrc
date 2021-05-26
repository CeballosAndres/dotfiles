"""""""""""""""""""""""""""""""""""""
" Andres Ceballos Vimrc configuration
"""""""""""""""""""""""""""""""""""""

"""" START Vundle Configuration

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Tools
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-sensible'

" Elixir plugins
Plugin 'elixir-editors/vim-elixir'
"Plugin 'dense-analysis/ale'
Plugin 'w0rp/ale'

" Theme / Interface
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
Plugin 'dracula/vim'

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration


"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
set nowrap
set hlsearch

" Remap aumetar decrecer
nnoremap + <C-a>
nnoremap - <C-x>

" Show what commands you’re typing
set showcmd

" Show linenumbers
set number

" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the column just after our line limit so that we don’t type over it
set colorcolumn=+1

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" Theme and Styling
syntax enable
colorscheme dracula

highlight Normal ctermbg=None

" CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode='ca'
let g:ctrlp_max_files = 1000
let g:ctrlp_cmd = 'CtrlPMixed'
set autochdir

" Elixir configuration
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

augroup elixir
  nnoremap <leader>r :! elixir %<cr>
  autocmd FileType elixir nnoremap <c-]> :ALEGoToDefinition<cr>
augroup END

let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers.elixir = ['mix_format']

let g:ale_elixir_elixir_ls_release='/Users/andres/.ale/elixir-ls'
let g:ale_sign_column_always = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:webdevicons_enable_airline_statusline = 1

" NerdTree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1

" Devicons configuration
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
