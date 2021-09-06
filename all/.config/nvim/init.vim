call plug#begin(stdpath('data') . '/plugged')

" Color schemes
Plug 'morhetz/gruvbox'

" Easy comments
Plug 'preservim/nerdcommenter'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Sneak
Plug 'justinmk/vim-sneak'

" R
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

call plug#end()

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" syntax processing
syntax enable

set ignorecase
set smartcase

" spaces
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=0
set listchars=tab:◦◦,eol:◀,trail:·
set list!

" ui
set number

" Set each line to have a character limit
set tw=80

" Color scheme in current use
colorscheme gruvbox

" search (must be after color scheme section)
hi Search ctermbg=208 ctermfg=239
nnoremap <space> :nohlsearch<CR>

" easier global copy and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
set clipboard+=unnamedplus

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

" \ is too far of a reach
let mapleader = ","

" fzf
noremap <Leader>f :FZF<CR>
noremap <Leader>g :Rg<CR>

" shortcut to replace words
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" put only one space after a period
set nojoinspaces

" Allow spell check for certain files only
autocmd FileType text,tex,markdown setlocal spell
autocmd FileType text,tex,markdown setlocal tw=80

" CoC
nmap <F2> <Plug>(coc-rename)

" R
let R_assign = 0

" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#s_next = 1
