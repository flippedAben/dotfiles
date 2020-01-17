set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tComment'

" Linter
Plugin 'dense-analysis/ale'

" Latex
Plugin 'lervag/vimtex'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Color schemes
Plugin 'morhetz/gruvbox'

" Markdown
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Auto complete
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" syntax processing
syntax enable

set ignorecase
set smartcase

" spaces
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=0
set autoindent
set listchars=tab:◦◦,eol:◀,trail:·
set list!

" ui
set number

" for quick jumping
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

" Save those folds
autocmd BufWinLeave *.tex mkview
autocmd BufWinEnter *.tex loadview

set foldcolumn=1

" Save that juicy energy from pushing shift
noremap ; :
imap kj <Esc>
imap jk <Esc>

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

" Learning VIM shortcuts
" put filename of current file into text
fun! ReadCurrFileName()
    r! echo %
endfun
command! Rcfn call ReadCurrFileName()

" \ is too far of a reach
let mapleader = ","

" shortcut to replace words
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

""""""""""""
" markdown "
""""""""""""

" Allow spell check for certain files only
autocmd FileType text,tex,markdown setlocal spell

autocmd BufRead,BufNewFile,BufEnter *.md call SetMarkdownSettings()
function SetMarkdownSettings()
    setlocal tw=100
endfunction

" My blog uses this
autocmd BufRead,BufNewFile,BufEnter ~/projects/flippedaben.github.io/** setlocal tw=100

" don't show urls on links
let g:pandoc#syntax#conceal#urls = 1
" don't automatically fold
let g:pandoc#modules#disabled = ["folding"]

""""""""""
" python "
""""""""""

" follow PEP 8 indentation
au BufNewFile,BufRead,BufEnter *.py call AdhereToPEP8()
function AdhereToPEP8()
    setlocal encoding=utf-8
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=79
    setlocal expandtab
    setlocal autoindent
    setlocal fileformat=unix
    let b:ale_fixers = ['autopep8']
endfunction

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""
" ALE "
"""""""
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>

