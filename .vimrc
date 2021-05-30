syntax enable 

set noerrorbells visualbell t_vb=
set tabstop=4 softtabstop=4
set hidden
set relativenumber
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set nohlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set updatetime=50
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=16
set colorcolumn=80
set signcolumn=yes
set backspace=2
set cmdheight=2
set shortmess+=c
set laststatus=2
set t_Co=256
set autoindent
" set statusline+=%F
call plug#begin('~/.vim/plugged')

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'itchyny/lightline.vim'

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Themes
Plug 'nightsense/cosmic_latte'
Plug 'gruvbox-community/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'wadackel/vim-dogrun'

Plug 'relastle/bluewery.vim'

call plug#end()

" for coc
set shiftwidth=4
"Apply theme after plugins are loaded
let ayucolor="dark"
autocmd vimenter * ++nested colorscheme gruvbox

" let g:lightline = { 'colorscheme': 'bluewery' }
" set background=dark

let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:fzf_layout = { 'window': { 'width':0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Leader macros
let mapleader = ' '

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>

" Find files using Telescope
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> rn <Plug>(coc-rename)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

