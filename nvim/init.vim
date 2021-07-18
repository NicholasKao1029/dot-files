syntax on 

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
Plug 'tpope/vim-sensible'
" comments and parenthesis  
Plug 'tpope/vim-commentary'
Plug '9mm/vim-closer'
" visuals not really
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
"
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Git stuff
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
" nvim LSP
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Themes
Plug 'gruvbox-community/gruvbox'
"B team Themes
Plug 'folke/tokyonight.nvim'
Plug 'nightsense/cosmic_latte'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'wadackel/vim-dogrun'
Plug 'relastle/bluewery.vim'
Plug 'chriskempson/base16-vim'
call plug#end()

set shiftwidth=4
"Apply theme after plugins are loaded
" let g:tokyonight_style = "day"
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal"]

" Load the colorscheme
colorscheme gruvbox
set t_Co=256

let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_winsize=25

let g:fzf_layout = { 'window': { 'width':0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

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

let g:diagnostic_enable_virtual_text = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_confirm_key = "\<C-y>"
let g:completion_matching_smart_case = 1

" LSP CONFIG
lua << EOF
     local nvim_lsp = require('lspconfig')
     local on_attach = function(client, bufnr)
         require('completion').on_attach()
         local opts = { noremap=true, silent=true }
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
         vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.util.show_line_diagnostics({}, bufnr,_,client.id )<CR>', opts)
     end
     -- Have to download the language servers
     local servers = {'pyright', 'tsserver', 'html', 'jsonls'}
     for _, lsp in ipairs(servers) do 
         nvim_lsp[lsp].setup {
             on_attach=on_attach
         }
     end
     -- diagnostics

     vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    })

     local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

     for type, icon in pairs(signs) do
       local hl = "LspDiagnosticsSign" .. type
       vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
     end
EOF

" Lightline config
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }


" TreeSitter
lua <<EOF
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        custom_captures = {
          -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
          ["foo.bar"] = "Identifier",
        },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    }
EOF

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Todo
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" DevIcons
lua <<EOF
require'nvim-web-devicons'.setup {
 { default = true }
};
EOF

 

" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
