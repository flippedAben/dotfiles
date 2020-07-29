call plug#begin('~/.vim/plugged')

" Color schemes
Plug 'morhetz/gruvbox'

" Easy comments
Plug 'preservim/nerdcommenter'

" Auto complete
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Linter
Plug 'dense-analysis/ale', { 'for': 'python' }

" Latex
Plug 'lervag/vimtex'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

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

" Set each line to have a character limit
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

" fzf
noremap <Leader>f :FZF<CR>

" easier global copy and paste
noremap <Leader>y "*y
noremap <Leader>p "*p

" shortcut to replace words
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" put only one space after a period
set nojoinspaces

""""""""""""
" markdown "
""""""""""""

" Allow spell check for certain files only
autocmd FileType text,tex,markdown setlocal spell

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

"""""""
" ALE "
"""""""
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>

".
let g:deoplete#enable_at_startup = 1
set completeopt+=noselect
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

""""""""""""
" Deoplete "
""""""""""""
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
