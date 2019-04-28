set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'

Plugin 'ctrlp.vim'
Plugin 'tComment'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'

" Plugin 'vim-airline/vim-airline'
Plugin 'lervag/vimtex'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Languages
" Plugin 'rust-lang/rust.vim'
" Plugin 'neovimhaskell/haskell-vim'

" Color schemes
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'

" Markdown
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

" syntax processing
syntax enable

set ignorecase
set smartcase

" spaces
set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set autoindent
set listchars=tab:⍈➞,eol:¶,trail:·
set list!

" ui
set number

" for quick jumping
" set rnu
set wildmenu
set wildmode=longest:list,full
set lazyredraw

" Set each line to have a max of 80 characters
set tw=80

" Color scheme in current use
set background=dark
" colorscheme solarized
" colorscheme molokai
colorscheme gruvbox

" search (must be after color scheme section)
set incsearch
set hlsearch
hi Search ctermbg=208 ctermfg=239
nnoremap <space> :nohlsearch<CR>

" airline
" set laststatus=2
" set noshowmode

" Allow spell check for certain files only
autocmd FileType text,tex,markdown setlocal spell

" Save those folds
autocmd BufWinLeave *.tex mkview
autocmd BufWinEnter *.tex loadview

set foldcolumn=1

" Save that juicy energy from pushing shift
noremap ; :

" splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


" Functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()

" haskell C-- maps to ->
fun! DoHaskell()
  inoremap [ []<Left>
  inoremap ( ()<Left>
  inoremap { {}<Left>
endfun
autocmd FileType haskell call DoHaskell()

" Go uses Tabs
autocmd BufRead,BufNewFile,BufEnter ~/ut/sem5/virt/p2/gocode/** setlocal noexpandtab

" Multicore and Computer Vision use 4 space indents
autocmd BufRead,BufNewFile,BufEnter ~/ut/sem6/multicore/code/** setlocal ts=4
autocmd BufRead,BufNewFile,BufEnter ~/ut/sem6/multicore/code/** setlocal shiftwidth=4
autocmd BufRead,BufNewFile,BufEnter ~/ut/sem6/vision/** setlocal ts=4
autocmd BufRead,BufNewFile,BufEnter ~/ut/sem6/vision/** setlocal shiftwidth=4

" My blog uses this
autocmd BufRead,BufNewFile,BufEnter ~/projects/flippedaben.github.io/** setlocal tw=100

" Learning VIM shortcuts
" put filename of current file into text
fun! ReadCurrFileName()
  r! echo %
endfun
command! Rcfn call ReadCurrFileName()

let g:syntastic_python_checkers=["pycodestyle"]
