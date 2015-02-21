""""""" Plugin Installations """""""

"-- General Plugins --"
call plug#begin('~/.vim/plugged')                     " call vim-plug
Plug 'vim-scripts/directionalWindowResizer'           " resize windows with C-(hjkl)
Plug 'vim-scripts/bufkill.vim'                        " leave window open when closing buffer
Plug 'tpope/vim-fugitive'                             " git integration
Plug 'tpope/vim-commentary'                           " toggle comments
Plug 'tpope/vim-unimpaired'                           " quick switch between elements
Plug 'tpope/vim-endwise'                              " autocomplete block endings
Plug 'tpope/vim-surround'                             " surround keybindings
Plug 'tpope/vim-eunuch'                               " integrate unix commands
Plug 'airblade/vim-gitgutter'                         " show git changes inline
Plug 'ntpeters/vim-better-whitespace'                 " show trailing whitespace
Plug 'ciaranm/detectindent'                           " autodetect indent
Plug 'scrooloose/syntastic'                           " check syntaxis for different languages
Plug 'Yggdroot/indentLine'                            " show line indents
Plug 'itchyny/lightline.vim'                          " statusbar
Plug 'mattn/emmet-vim'                                " awsome html editing
Plug 'nanotech/jellybeans.vim'                        " awesome colorscheme
Plug 'noahfrederick/vim-hemisu'                       " another awesome color scheme
Plug 'ajh17/Spacegray.vim'                            " yet another colorscheme
Plug 'dsolstad/vim-wombat256i'
Plug 'rking/ag.vim'                                   " use ag for searching
Plug 'kien/ctrlp.vim'                                 " quickly open files
Plug 'nelstrom/vim-visual-star-search'                " use * for searching visual selection
Plug 'sjl/gundo.vim'                                  " view undo tree
Plug 'nelstrom/vim-qargs'                             " set arglist to files in quicklist
Plug 'majutsushi/tagbar'                              " tag sidebar plus in-memory tags file
Plug 'gregsexton/gitv'                                " browse git history
Plug 'mtth/scratch.vim'                               " better scratch buffer
Plug 'arecarn/crunch.vim'                             " calculator powers for vim

"-- Text Objects --"
Plug 'kana/vim-textobj-user'                          " user text objects
Plug 'kana/vim-textobj-entire'                        " ae becomes entire text object
Plug 'kana/vim-textobj-function'                      " af/if for function as text objects
Plug 'bps/vim-textobj-python', {'for': 'python'}      " af/if, ac,ic for function/classes objexts
Plug 'thinca/vim-textobj-function-javascript',
      \{'for': 'javascript'}                          " javascript functions text objets
Plug 'nelstrom/vim-textobj-rubyblock',
      \{'for': 'ruby'}                                " ar/ir for ruby blocks text objects

"-- Language-specific plugins --"
Plug 'plasticboy/vim-markdown'                        " markdown support
Plug 'ekalinin/Dockerfile.vim'                        " syntax highlighting for dockerfiles
Plug 'pangloss/vim-javascript', {'for': 'javascript'} " better javascript support
Plug 'marijnh/tern_for_vim',
      \{'for': 'javascript', 'do': 'npm install'}     " tern-based javascript completition
Plug 'mxw/vim-jsx'                                    " Support for jsx files
Plug 'othree/html5.vim', {'for': 'html'}              " html5 tags support
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}             " better ruby support
Plug 'davidhalter/jedi-vim', {'for': 'python'}        " better python autocompletition
call plug#end()

""""""" Plugin configurations """""""

let g:syntastic_python_pylint_args = "--disable=import-error" " syntastic - disable import error with pylint
" Remap Ag search
nnoremap <SPACE>f :Ag<SPACE>
" Map gundo toggle
nnoremap <F5> :GundoToggle<CR>
" Tagbar toggle
noremap <F8> :TagbarToggle<CR>
" Stage and revert hunks
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk

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
set showmatch                               " show matching parentheses
set background=dark                         " use dark background by default
colorscheme hemisu                          " set colorscheme
set incsearch                               " incremental search (preview position)
set scrolloff=1                             " try to show one line above/bellow cursor
set laststatus=2                            " always show status bar
set listchars=tab:▸\ ,eol:¬                 " Use the same symbols as TextMate for tabstops and EOLs
set hlsearch                                " Enable highlight search
set cursorline                              " highlight current line

"-- General keybindings configuration --"
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
nmap <leader>l ;set list!<CR>
" Temporarily disable text highlight
nmap <leader>c ;<C-u>nohlsearch<CR>
" Colon is used way more than semicolon
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" Count search matches
command! CM %s///gn
" Help endwise a little bit
imap <C-J> <CR>
" Improve & command - repeat substitution with same flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

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

