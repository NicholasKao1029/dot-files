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
set guicursor=
" set colorcolumn=80
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
Plug 'nvim-lua/plenary.nvim'
" comments ,parenthesis and quotes
Plug 'tpope/vim-commentary'
Plug '9mm/vim-closer'
Plug 'tpope/vim-surround'
" visuals not really
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'
"Linting
Plug 'dense-analysis/ale'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Git stuff
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" Diagnostics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'
" nvim LSP
Plug 'folke/lsp-colors.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
" TODO: install cmp over deprecated compe
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/nvim-compe'
" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Themes
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'
"B team Themes
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'relastle/bluewery.vim'
Plug 'chriskempson/base16-vim'
" Spectre find and remove
Plug 'windwp/nvim-spectre'

"" This stuff tracks you
" AI programming copilot
Plug 'github/copilot.vim'
" Time tracking
Plug 'wakatime/vim-wakatime'

" Temp .sol syntax highlighting
Plug 'tomlion/vim-solidity'
" Trial see if go plugin works well for 416
Plug 'ray-x/go.nvim'

call plug#end()

set shiftwidth=4
" Apply theme after plugins are loaded
 "let g:tokyonight_style = "night"
 "let g:tokyonight_italic_functions = 1
 "let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal"]

"lua << EOF
 "   vim.g.tokyonight_dev = true
 "   vim.g.tokyonight_style = "storm"
 "   vim.g.tokyonight_sidebars = {
 "     "qf",
 "     "vista_kind",
 "     "terminal",
 "     "packer",
 "     "spectre_panel",
 "     "NeogitStatus",
 "     "help",
 "   }
 "   vim.g.tokyonight_cterm_colors = false
 "   vim.g.tokyonight_terminal_colors = true
 "   vim.g.tokyonight_italic_comments = true
 "   vim.g.tokyonight_italic_keywords = true
 "   vim.g.tokyonight_italic_functions = false
 "   vim.g.tokyonight_italic_variables = false
 "   vim.g.tokyonight_transparent = false
 "   vim.g.tokyonight_hide_inactive_statusline = true
 "   vim.g.tokyonight_dark_sidebar = true
 "   vim.g.tokyonight_dark_float = true
 "   vim.g.tokyonight_colors = {}
 "   vim.g.tokyonight_colors = { border = "orange" }
"EOF
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

" inter-window movement
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

" Directory pull up and misc
nnoremap <leader>pv :NvimTreeToggle<CR>
nnoremap <leader>pr :NvimTreeRefresh<CR>
nnoremap <leader>pn :NvimTreeFindFile<CR>

nnoremap <leader>ps :Rg<SPACE>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap Y y$

" Spectre
nnoremap <leader>S :lua require('spectre').open()<CR>
"search current word
nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

" cursor centering during movements
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap = =<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap ` `<c-g>u
inoremap + +<c-g>u
inoremap - -<c-g>u
inoremap _ _<c-g>u

" Move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==
" nnoremap <leader>k :m .-2<CR>==
 

" completion-nvim
" let g:diagnostic_enable_virtual_text = 1
" " let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" " Use <Tab> and <S-Tab> to navigate through popup menu
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" " Avoid showing message extra message when using completion
" set shortmess+=c
" let g:completion_confirm_key = "\<C-y>"
" let g:completion_matching_smart_case = 1

command! Format execute 'lua vim.lsp.buf.formatting()'

" ALE Config
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

" LSP CONFIG
lua << EOF
    -- go.nvim setup
    require('go').setup()

    local nvim_lsp = require('lspconfig')
    local on_attach = function(client, bufnr)
        -- require('completion').on_attach()
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>;', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>xd', '<cmd>lua vim.lsp.util.show_line_diagnostics({}, bufnr,_,client.id )<CR>', opts)
    end
    -- Have to download the language servers
    -- 'pyright',
    local servers = {'pylsp', 'tsserver', 'html', 'jsonls', 'hls', 'gopls', 'solidity_ls'}
    for _, lsp in ipairs(servers) do 
        nvim_lsp[lsp].setup {
            on_attach=on_attach
        }
    end
    -- diagnostics

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
       underline = true,
       update_in_insert = false,
       virtual_text = { spacing = 4, prefix = "■" },
       severity_sort = true,
    )

    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end


    -- DIAGNOSTICS
    -- Show all diagnostics on current line in floating window
    vim.api.nvim_set_keymap(
      'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>', 
      { noremap = true, silent = true }
    )
    -- -- Go to next diagnostic (if there are multiple on the same line, only shows
    -- -- one at a time in the floating window)
    -- vim.api.nvim_set_keymap(
    --   'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
    --   { noremap = true, silent = true }
    -- )
    -- -- -- Go to prev diagnostic (if there are multiple on the same line, only shows
    -- -- -- one at a time in the floating window)
    -- vim.api.nvim_set_keymap(
    --   'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
    --   { noremap = true, silent = true }
    -- )

    

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

" Telescope
lua << EOF 
    require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
            },
        prompt_prefix = "> ",
        selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
        horizontal = {
            mirror = false,
            },
        vertical = {
            mirror = false,
            },
        },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
extensions = {
    fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
        }
    }
  }
    require('telescope').load_extension('fzf')
EOF 

" TreeSitter
lua << EOF
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

-- for solidity 
--    require "nvim-treesitter.parsers".get_parser_configs().Solidity = {
--      install_info = {
--        url = "https://github.com/JoranHonig/tree-sitter-solidity",
--        files = {"src/parser.c"},
--        requires_generate_from_grammar = true,
--      },
--      filetype = 'solidity'
--    }


EOF

" Tree
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_special_files = { 'README.md': 1 }
lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
    require'nvim-tree'.setup {
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
  }
EOF

" DevIcons
lua << EOF
    require'nvim-web-devicons'.setup {
     { default = true }
    };
EOF

" gitsigns
lua << EOF
    require('gitsigns').setup()
EOF

" Compe
lua << EOF
    vim.o.completeopt = "menuone,noselect"

    require("compe").setup({
      enabled = true,
      autocomplete = true,
      debug = false,
      min_length = 1,
      preselect = "enable", -- changed to "enable" to prevent auto select
      throttle_time = 80,
      source_timeout = 200,
      incomplete_delay = 400,
      max_abbr_width = 100,
      max_kind_width = 100,
      max_menu_width = 100,
      documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },

      source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = false,
        vsnip = false,
        luasnip = true,
        treesitter = false,
        emoji = true,
        spell = true,
      },
    })


    local function complete()
      if vim.fn.pumvisible() == 1 then
        return vim.fn["compe#confirm"]({ keys = "<cr>", select = true })
      else
        return require("nvim-autopairs").autopairs_cr()
      end
    end

    vim.cmd([[autocmd User CompeConfirmDone silent! lua vim.lsp.buf.signature_help()]])
EOF
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap("<C-Space>", "compe#complete()", { expr = true })
" inoremap("<C-e>", "compe#close('<C-e>)", { expr = true })
" imap("<CR>", complete, { expr = true })
 

" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
