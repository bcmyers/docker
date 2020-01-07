"*****************************************************************************
" Neovim defaults
"*****************************************************************************

if !has("nvim")
    syntax on
    filetype plugin indent on
    set autoindent
    set autoread
    set background=dark
    set backspace=indent,eol,start
    set belloff=all
    set nocompatible
    set complete-=i
    set cscopeverbose
    set display=lastline
    set encoding=utf-8
    set fillchars=vert:│,fold:·"
    set formatoptions=tcqj
    set nofsync
    set history=10000
    set hlsearch " Highlight search terms
    set incsearch " Show matches as you type
    set langnoremap
    set nolangremap
    set laststatus=2 " 0 = never, 1 = only if there are at least 2 windows, 2 = always
    set listchars="tab:> ,trail:-,nbsp:+"
    set nrformats=bin,hex
    set ruler
    set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
    set showcmd
    set sidescroll=1
    set shortmess=filnxtToOF
    set smarttab
    set nostartofline
    set tabpagemax=50
    set tags=./tags;,tags
    set ttimeoutlen=50
    set ttyfast
    set wildmenu
    set wildoptions=tagfile
    set viminfo=!,'100,<50,s10,h
endif

"*****************************************************************************
" Plugins
"*****************************************************************************

"" Must come first
set modeline
set modelines=10

call plug#begin(expand('~/.vim/plugged'))

" base-16 vim: Base16 color scheme
Plug 'chriskempson/base16-vim'

" delimitMate: Insert mode auto-completion for quotes, parens, brackets, etc.
Plug 'Raimondi/delimitMate'

" deoplete: Asynchronous completion framework
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" fzf: Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }

" LanguageClient-neovim: Language Server Protocol (LSP) support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" lightline: A light and configurable statusline / tabline plugin
Plug 'itchyny/lightline.vim'

" nerdtree: Tree explorer plugin
Plug 'scrooloose/nerdtree'

" vim-better-whitespace: Color / remove whitespace at the end of lines
Plug 'ntpeters/vim-better-whitespace'

" vim-commentary: Comment stuff out
Plug 'tpope/vim-commentary'

" vim-css-color: Preview colours in source code while editing
Plug 'ap/vim-css-color'

" vim-gitgutter: Shows a git diff in the gutter (sign column)
Plug 'airblade/vim-gitgutter'

" vim-highlightedyank: Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" vim-polyglot: A solid language pack (syntax highlighting for many languages)
Plug 'sheerun/vim-polyglot'

" vim-shellcheck: Vim wrapper for ShellCheck
Plug 'itspriddle/vim-shellcheck'

"" Languages...

" C
Plug 'm-pilia/vim-ccls'
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Markdown
" Plug 'gabrielelana/vim-markdown'

" Python
Plug 'psf/black', {'for': 'python'}

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Typescript / Javascript
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'prettier/vim-prettier', {'do': 'yarn install' }

" Config
Plug 'cespare/vim-toml'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'ron-rs/ron.vim'
Plug 'stephpy/vim-yaml'

call plug#end()

"*****************************************************************************
" Basic
"*****************************************************************************

set clipboard=unnamedplus
set expandtab " Insert spaces instead of tabs
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
set hidden " Enable hidden buffers
set mouse=a " Mouse
set shiftwidth=4 " Number of spaces for auto-indenting
" set shortmess+=I " Don't give the intro message when starting up
set showmatch " Show matching parenthesis
set softtabstop=0
set tabstop=4 " Tabs are 4 spaces

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

"" Searching
set ignorecase
set smartcase

"" Shell
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"" Swap files
set nobackup
set noswapfile

"" Syntax highlighting syncing
autocmd BufEnter * :syntax sync maxlines=2000

"" Undos
set undofile
set undodir=/tmp

"*****************************************************************************
"" Visual
"*****************************************************************************

" General
" set cursorline " Cursor line
set guicursor=a:ver25-blinkon0
set guifont=Monospace\ 10
set guioptions=egmrti
set mousemodel=popup
set number
" set relativenumber
set scrolloff=3 " Minimum number of screen lines to keep above and below the cursor
set title
set titleold="Terminal"
set titlestring=%F

" Colors
if !has("nvim") && exists("$TMUX") && &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
" let base16colorspace=256  " Must come before colorscheme declaration
colorscheme base16-default-dark
highlight LineNr guibg=NONE ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight GitGutterAdd    guibg=NONE ctermbg=NONE
highlight GitGutterChange guibg=NONE ctermbg=NONE
highlight GitGutterChangeDelete guibg=NONE ctermbg=NONE
highlight GitGutterDelete guibg=NONE ctermbg=NONE

" Visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Leader
let mapleader = "\<Space>"

"" Better verticle movement for wrapped lines
nnoremap j gj
nnoremap k gk

" NerdTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Search
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <silent> <leader><space> :noh<cr>

"" Split windows
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Visual mode - move blocks
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap H <gv
vnoremap L >gv

"*****************************************************************************
"" Extensions
"*****************************************************************************

"" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
    \ 'c': ['LanguageClient'],
    \ 'cpp': ['LanguageClient'],
    \ 'javascript': ['LanguageClient'],
    \ 'rust': ['LanguageClient'],
    \ 'python': ['LanguageClient'],
    \ 'sh': ['LanguageClient'],
    \ 'typescript': ['LanguageClient'],
    \})
inoremap <expr> <C-j> pumvisible() ? "\<Down>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<Up>" : "<C-k>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview " Disables the preview window feature
set pumheight=15 " Sets the maximum height of the pop-up window

"" fzf
nnoremap <C-p> :FZF<cr>
set wildmode=list:longest,full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"" LanguageClient-neovim
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls'],
    \ 'cpp': ['ccls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'rust': ['rustup', 'run', 'stable', 'ra_lsp_server'],
    \ 'python': ['pyls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ }

"" nerdtree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeWinSize = 25
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
" If NERDTree is open when the last buffer is closed, close it and quit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" prettier
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,
    \*.json,*.graphql,*.yml,*.yaml,*.html PrettierAsync
let g:prettier#autoformat = 0
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

"" vim-better-whitespace
let g:better_whitespace_enabled=1
let g:show_spaces_that_precede_tabs=1
let g:strip_whitespace_on_save=1
let g:strip_whitelines_at_eof=1

"" vim-clang-format
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable

"" vim-highlightedyank
let g:highlightedyank_highlight_duration = 3000

"" vim-gitgutter
let g:gitgutter_override_sign_column_highlight = 0

"" vim-javascript
let g:javascript_enable_domhtmlcss = 1

"" vim-markdown
let g:markdown_enable_spell_checking = 0
