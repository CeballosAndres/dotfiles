"""""""""""""""""""""""""""""""""""""
" Andres Ceballos Vimrc configuration
"""""""""""""""""""""""""""""""""""""

"""" START Plug Configuration

call plug#begin('~/.vim/plugged')

" Tools
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/neocomplete.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-treesitter/nvim-treesitter'

" Markdown / writting
Plug 'dpelle/vim-languagetool'

" Elixir plugins
Plug 'elixir-editors/vim-elixir'

" Theme / Interface
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

lua << EOF
require('telescope')
EOF

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
set nowrap
set hlsearch
let mapleader=" "

" Buffer config
nmap <leader>1 :bp<Cr>
nmap <leader>2 :bn<Cr>
nmap <leader>0 :bd<Cr>
nmap <leader>w :w<Cr>
nmap <leader>q :q<Cr>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>r :w \| :so %<CR> 

" Telescope
nnoremap <leader>f <cmd>Telescope <cr>

nnoremap <silent><leader>p :Telescope find_files<CR>
nnoremap <silent><leader>/ :Telescope live_grep<CR>
nnoremap <silent><leader>b :Telescope buffers<CR>
nnoremap <silent><leader>gi :Telescope git_files
nnoremap <silent><leader>z :Telescope oldfiles<CR>
nnoremap <silent><leader>co :Telescope git_commits<CR>


" Remap plus and minus
nnoremap + <C-a>
nnoremap - <C-x>

" Show what commands you’re typing
set showcmd
set showmatch
set mouse=a
set sw=2 

set scrolloff=7

" Show linenumbers
set number
set numberwidth=1
set relativenumber

" Config clipboard
set clipboard=unnamed

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

" LangugeTool
:let g:languagetool_jar='~/languagetool/LanguageTool-5.5/languagetool-commandline.jar'

" Theme and Styling
set termguicolors
syntax enable
colorscheme solarized8

if $BG_COLOR == 'dark'
  set background=dark
else
  set background=light
endif

highlight Normal ctermbg=None

" Git Gutter
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
set updatetime=100

" Nerd Commenter
filetype plugin on
let g:NERDCreateDefaultMappings=1 "Create default mappings
let g:NERDSpaceDelims=1 "Add spaces after comment delimiters by default

" Config easymotion
nmap <Leader>s <Plug>(easymotion-s2)


" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
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
