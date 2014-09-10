" Vundle related configurations
set nocompatible                            " enable vim features not in vi
filetype off                                " required for bundle
set rtp=/usr/share/vim/vim74,
        \~/.vim,~/.vim/bundle/vundle        " define runtime path
call vundle#rc()                            " call vundle
Plugin 'gmarik/vundle'                      " let vundle mange itself

" Plugins
Plugin 'kien/ctrlp.vim'                     " fuzzy text finder
Plugin 'tpope/vim-fugitive'                 " git integration
Plugin 'tomtom/tcomment_vim'                " toggle comments
Plugin 'sirver/ultisnips'                   " snippet engine
Plugin 'honza/vim-snippets'                 " snippet collection
Plugin 'airblade/vim-gitgutter'             " show git changes inline
Plugin 'bling/vim-airline'                  " status bar
Plugin 'edkolev/tmuxline.vim'               " use ariline theme in tmux
Plugin 'tpope/vim-surround'                 " surround keybindings
Plugin 'bronson/vim-trailing-whitespace'    " show trailing whitespace
Plugin 'ciaranm/detectindent'               " autodetect indent
Plugin 'Yggdroot/indentLine'                " show line indents
Plugin 'plasticboy/vim-markdown'            " markdown support
Plugin 'jelera/vim-javascript-syntax'       " better javascript syntax support
Plugin 'pangloss/vim-javascript'            " better javascript support
Plugin 'julialang/julia-vim'                " julia support
Plugin 'marijnh/tern_for_vim'               " tern-based javascript completition
Plugin 'othree/html5.vim'                   " html5 tags supprt
Plugin 'davidhalter/jedi-vim'               " jedi-python for completition
Plugin 'vim-scripts/fortran.vim'            " extra fortran 90 support
Plugin 'vim-perl/vim-perl'                  " extra syntax support for perl
Plugin 'vim-ruby/vim-ruby'                  " better ruby support
Plugin 'fatih/vim-go'                       " better go-lang support
Plugin 'fatih/molokai'                      " modified molokai
Plugin 'majutsushi/tagbar'                  " tagbar plugin
Plugin 'derekwyatt/vim-scala'               " better scala support
Plugin 'rainerborene/vim-heroku'            " heroku theme
Plugin 'godlygeek/csapprox'                 " correct non-terminal colorschemes
Plugin 'scrooloose/syntastic'               " check syntaxis for different languages
Plugin 'Valloric/YouCompleteMe'             " better autocompletition

" Plugin configurations
let g:ctrlp_map='<c-p>'                     " ctrlp - set keyboard shortcut
let g:ctrlp_command='CtrlP'                 " ctrlp - default ctrlp action
let g:UltiSnipsExpandTrigger='<tab>'        " ultisnips - expand with tab
let g:UltiSnipsJumpForwardTrigger='<c-b>'   " ultisnips - jump next with CtrlB
let g:UltiSnipsJumpBackwardTrigger='<c-z>'  " ultisnips - jump prev. with CtrlZ
let g:UltiSnipsEditSplit='vertical'         " ultisnips - split when editting
set laststatus=2                            " airline - always show status bar
let g:airline_powerline_fonts=1             " airline - enable special symbols
let g:airline_theme='murmur'                " airline - set theme
let g:airline#extensions#tabline#enabled=1  " airline - enable tabline extension
nmap <F8> :TagbarToggle<CR>                 " tagbar - toggle tagbar shortcut
let g:ycm_add_preview_to_completeopt=0      " ycm - don't preview in split window
let g:ycm_confirm_extra_conf=0              " ycm - avoid confirmation of extra conf
set completeopt-=preview                    " ycm - no preview

" General configurations
filetype plugin indent on                   " enable filetype detection
set undodir=~/.tmp/undo                     " undo directory
set backupdir=~/.tmp                        " change backups
set dir=~/.tmp                              " temporal files directory
set hidden                                  " hide instead of closing buffers

" Visual configurations
syntax on                                   " enable syntax highlighting
set t_Co=256                                " set color support
colorscheme heroku                          " setup colorscheme
set number                                  " show line numbers
set nowrap                                  " don't wrap lines
set showmatch                               " show matching parentheses

" General keybindings configuration
let mapleader=","                           " useful in non-US schemes
nmap <silent> <leader>ev :e $MYVIMRC<CR>    " quickly edit .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>   " quickly reload .vimrc
set pastetoggle=<F2>                        " For pasting large text blocks
nmap <silent> ,/ :nohlsearch<CR>            " clear search buffer at / press
map - ddp                                   " Move line down
map _ ddkP                                   " Move line up

" Motion configurations
map <C-h> <C-w>h                            " simple window left
map <C-j> <C-w>j                            " simple window down
map <C-k> <C-w>k                            " simple window up
map <C-l> <C-w>l                            " simple window right
map <leader><leader>n :bn<CR>               " switch to next buffer
map <leader><leader>p :bp<CR>               " switch to previous buffer

" Editing configuration
set expandtab                               " use spaces for indenting
set shiftwidth=2                            " for manual indentation
set softtabstop=2                           " for automatic indentation
set autoindent                              " simplest automatic indentation
set shiftround                              " use multiple of shiftwidth when indenting

" External tools configurations
au BufEnter *.scala setl formatprg=~/bin/scalariform.jar\ --stdin\ --stdout

" Filetype specific configurations
au FileType python setl sw=4 sts=4 et
au FileType fortran setl sw=4 sts=4 et
au FileType perl setl sw=4 sts=4 et
au FileType go setl noet ts=8 sw=8 sts=8

" Extra tagbar filetypes
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
  \ ]
\ }
