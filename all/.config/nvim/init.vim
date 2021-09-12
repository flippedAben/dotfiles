call plug#begin(stdpath('data') . '/plugged')

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'

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

" \ is too far of a reach
let mapleader = ","

" syntax processing
syntax enable

set ignorecase
set smartcase

" spacing
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=0
set listchars=tab:◦◦,eol:◀,trail:·
set list!
set tw=80

" ui
set number

" Color scheme in current use
colorscheme sonokai

" search (must be after color scheme section)
nnoremap <space> :nohlsearch<CR>

" easier global copy and paste
noremap <Leader>y "+y
noremap <Leader>p "+p
set clipboard+=unnamedplus

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

" Use tab for completion.
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

" Commenter
let g:NERDCreateDefaultMappings = 0
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle

" R
let R_assign = 0

" Sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#s_next = 1

" Markdown
au BufNewFile,BufRead,BufEnter *.md,*.jrnl call MarkdownSettings()
function MarkdownSettings()
    setlocal encoding=utf-8
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
    setlocal autoindent
endfunction
