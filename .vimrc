"""""""""""""""""""""""""""""""""""""
" Andres Ceballos Vimrc configuration
"""""""""""""""""""""""""""""""""""""

"""" START Plug Configuration

call plug#begin('~/.vim/plugged')

" Tools
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'shougo/neocomplete.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Elixir plugins
Plug 'elixir-editors/vim-elixir'

" Theme / Interface
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
set nowrap
set hlsearch
let mapleader=" "

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :w \| :source ~/.vimrc<CR> 
nnoremap <silent><leader>2 :PlugInstall<CR>

" Remap aumetar decrecer
nnoremap + <C-a>
nnoremap - <C-x>

" Show what commands you’re typing
set showcmd
set showmatch
set mouse=a
set sw=2 

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

" Nerd Commenter
filetype plugin on
let g:NERDCreateDefaultMappings=1 "Create default mappings
let g:NERDSpaceDelims=1 "Add spaces after comment delimiters by default

" Config easymotion
nmap <Leader>s <Plug>(easymotion-s2)

" coc cofig
set completeopt=longest,menuone

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" set python verison to provider coc-snippets
let g:python3_host_prog='/Users/andres/.asdf/shims/python3'
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

let g:coc_snippet_next = '<tab>'

" fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(blue)%C(bold)%cr%C(white)"'
autocmd! FileType fzf
autocmd  FileType fzf set nonu nornu

nnoremap <silent><leader>p :FzfFiles<CR>
nnoremap <silent><leader>/ :FzfRg<CR>
nnoremap <silent><leader>. :FzfFiles <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent><leader>b :FzfBuffers<CR>
nnoremap <silent><leader>g :FzfGFiles?
nnoremap <silent><leader>] :FzfTags<CR>
nnoremap <silent><leader>B :FzfBTags<CR>
nnoremap <silent><leader>gc :FzfCommits<CR>
nnoremap <silent><leader>gbc :FzfBCommits<CR>

" CTRL-A CTRL-Q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

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
