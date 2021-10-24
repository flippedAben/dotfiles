call plug#begin(stdpath('data') . '/plugged')

Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'

Plug 'preservim/nerdcommenter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

call plug#end()

" convenient remaps
let mapleader = ","

set clipboard+=unnamedplus
noremap <Leader>y "+y
noremap <Leader>p "+p

noremap <Leader>f :FZF<CR>
noremap <Leader>g :Rg<CR>
noremap <Leader>h :noh<CR>
noremap ; :

let g:NERDCreateDefaultMappings = 0
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" search
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
set nojoinspaces

" ui
set number
set foldcolumn=1
set cul

" colors
colorscheme sonokai

" splits
set splitbelow
set splitright

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


" R
let R_assign = 0

" Markdown
au BufNewFile,BufRead,BufEnter *.md,*.jrnl call MarkdownSettings()
function MarkdownSettings()
    setlocal encoding=utf-8
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal autoindent
    setlocal spell
endfunction
