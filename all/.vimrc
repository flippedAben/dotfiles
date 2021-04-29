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

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

" Markdown from pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

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

set pastetoggle=<F2>

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

" \ is too far of a reach
let mapleader = ","

" fzf
noremap <Leader>f :FZF<CR>
noremap <Leader>g :Rg<CR>

" easier global copy and paste
noremap <Leader>y "*y
noremap <Leader>p "*p

" shortcut to replace words
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" put only one space after a period
set nojoinspaces

" jrnl
au BufNewFile,BufRead,BufEnter /tmp/*.jrnl call JrnlStyle()
function JrnlStyle()
    setlocal spell
    setlocal wrap
    setlocal linebreak
    setlocal tw=0
    setlocal wrapmargin=0
endfunction

""""""""""""
" markdown "
""""""""""""

" Allow spell check for certain files only
autocmd FileType text,tex,markdown setlocal spell
autocmd FileType text,tex,markdown setlocal tw=80

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

let g:ale_linters = { 'python': ['flake8'] }

""""""""""""
" Deoplete "
""""""""""""
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Commenter
let g:NERDCreateDefaultMappings = 0
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle

" R
let R_assign = 0

" vim-rmarkdown
au BufNewFile,BufRead,BufEnter *.Rmd call RmdSettings()
function RmdSettings()
    nmap <F1> :RMarkdown<CR>
endfunction

""""""""""""
" TypeScript "
""""""""""""
au BufNewFile,BufRead,BufEnter *.ts,*.tsx call TypeScript()
function TypeScript()
    setlocal ts=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction
