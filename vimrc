""""""" Plugin Installations """""""

"-- General Plugins --"
call plug#begin('~/.vim/plugged')                     " call vim-plug
Plug 'vim-scripts/directionalWindowResizer'           " easier window resizing
Plug 'vim-scripts/bufkill.vim'                        " leave window open when closing buffer
Plug 'tpope/vim-fugitive'                             " git integration
Plug 'tpope/vim-commentary'                           " toggle comments
Plug 'tpope/vim-endwise'                              " autocomplete block endings
Plug 'tpope/vim-surround'                             " surround keybindings
Plug 'tpope/vim-eunuch'                               " integrate unix commands
Plug 'tpope/vim-rsi'                                  " emacs like edit bindings
Plug 'airblade/vim-gitgutter'                         " show git changes inline
Plug 'ntpeters/vim-better-whitespace'                 " show trailing whitespace
Plug 'scrooloose/syntastic'                           " check syntax errors
Plug 'Yggdroot/indentLine'                            " show line indents
Plug 'itchyny/lightline.vim'                          " statusbar
Plug 'mattn/emmet-vim'                                " awsome html editing
Plug 'rking/ag.vim'                                   " use ag for searching
Plug 'kien/ctrlp.vim'                                 " quickly open files
Plug 'majutsushi/tagbar'                              " tag sidebar plus in-memory tags file
Plug 'mtth/scratch.vim'                               " better scratch buffer
Plug 'SirVer/ultisnips'                               " snip engine
Plug 'honza/vim-snippets'                             " snippets collection
Plug 'amdt/vim-niji'                                  " rainbow parentheses
Plug 'ELouisYoung/vim-better-molokai'                 " molokai with no background

"-- Language-specific plugins --"
Plug 'JuliaLang/julia-vim'                            " julia support
Plug 'plasticboy/vim-markdown'                        " markdown support
Plug 'ekalinin/Dockerfile.vim'                        " syntax highlighting for dockerfiles
Plug 'pangloss/vim-javascript'                        " better javascript support
Plug 'mxw/vim-jsx'                                    " Support for jsx files
Plug 'vim-ruby/vim-ruby'                              " better ruby support
call plug#end()

""""""" General configurations """""""

"-- General options --"
filetype plugin indent on                   " enable file type detection
set undodir=~/.tmp/undo                     " undo directory
set backupdir=~/.tmp                        " change backups
set dir=~/.tmp                              " temporal files directory
set hidden                                  " hide instead of closing buffers
set wildmenu                                " zsh-style autocomplete
set wildmode=full                           " style the autocomplete menu
runtime macros/matchit.vim                  " enable matchit plugin
set ignorecase                              " case insensitive searching
set smartcase                               " improve case sensitivity
set ttyfast                                 " improve scrolling speed
set lazyredraw                              " buffer screen updates (faster)

"-- Visual configurations --"
syntax on                                   " enable syntax highlighting
set t_Co=256                                " set color support
set number                                  " show line numbers
set relativenumber                          " easier motion with relative line numbers
set showmatch                               " show matching parentheses
hi MatchParen cterm=bold ctermbg=none ctermfg=none
colorscheme better-molokai                  " set colorscheme
set incsearch                               " incremental search (preview position)
set scrolloff=1                             " try to show one line above/bellow cursor
set laststatus=2                            " always show status bar
set listchars=tab:▸\ ,eol:¬                 " Use the same symbols as TextMate for tabstops and EOLs
set hlsearch                                " Enable highlight search
" set cursorline                              " highlight current line

"-- General keybindings configuration --"
" Make space the leader key
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
" Change key for moving up in command history
cnoremap <C-p> <Up>
" Change key for moving down in command history
cnoremap <C-n> <Down>
" Expand %% to current buffer's path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Enable Spanish spell-checker
command! SCES setlocal spell spelllang=es_mx
" Enable English spell-checker
command! SCEN setlocal spell spelllang=en_us
" Disable spell-checker
command! DSC setlocal nospell
" Shortcut to rapidly toggle `set list`
nmap <Leader>m :set list!<CR>
" Temporarily disable text highlight
nmap <Leader>c :<C-u>nohlsearch<CR>
" Count search matches
command! CM %s///gn
" Help endwise a little bit
imap <C-J> <CR>
" Improve & command - repeat substitution with same flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Easier file saving
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wa<CR>
" Easier quit
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :qa<CR>
" Easier buffer change
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>b :bp<CR>
" Easier tab change
nnoremap <Leader>r gt
nnoremap <Leader>e gT
" Easier enter to visual mode
nnoremap <Leader>v V
" Easier copy and paste to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Close buffer
nnoremap <Leader>x :bd<CR>
" Close buffer without altering layout
nnoremap <Leader>X :BD<CR>

"-- Plugin keybindings --"
" Remap Ag search
nnoremap <Leader>f :Ag<SPACE>
" Tagbar toggle
noremap <F8> :TagbarToggle<CR>
" Stage and revert hunks
nmap <Leader>ah <Plug>GitGutterStageHunk
nmap <Leader>uh <Plug>GitGutterRevertHunk

"-- Editing configuration --"
set expandtab                               " use spaces for indenting
set shiftwidth=2                            " for manual indentation
set softtabstop=2                           " for automatic indentation
set autoindent                              " simplest automatic indentation
set shiftround                              " use multiple of shiftwidth when indenting

"-- File type specific configurations --"
au FileType python setl sw=4 sts=4 et
au FileType fortran setl sw=4 sts=4 et
au FileType perl setl sw=4 sts=4 et
au FileType javascript setl sw=4 sts=4 et
au FileType java setl sw=3 sts=3 et
au FileType go setl noet ts=8 sw=8 sts=8
au FileType julia setl sw=4 sts=4 et

