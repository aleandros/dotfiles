""""""" Plugin Installations """""""

"-- General Plugins --"
call plug#begin('~/.vim/plugged')                     " call vim-plug
Plug 'tpope/vim-fugitive'                             " git integration
Plug 'tpope/vim-commentary'                           " toggle comments
Plug 'tpope/vim-unimpaired'                           " quick switch between elements
Plug 'airblade/vim-gitgutter'                         " show git changes inline
Plug 'bling/vim-airline'                              " status bar
Plug 'tpope/vim-surround'                             " surround keybindings
Plug 'ntpeters/vim-better-whitespace'                 " show trailing whitespace
Plug 'ciaranm/detectindent'                           " autodetect indent
Plug 'scrooloose/syntastic'                           " check syntaxis for different languages
Plug 'Yggdroot/indentLine'                            " show line indents
Plug 'Shougo/vimproc.vim', {'do': 'make'}             " plugin for async operations
Plug 'Shougo/unite.vim'                               " handle multiple search targets
Plug 'Shougo/unite-outline'                           " navigate the outline of certain filetypes
Plug 'neilagabriel/vim-geeknote'                      " integrate geeknote into vim
Plug 'mattn/emmet-vim'                                " awsome html editing
Plug 'nanotech/jellybeans.vim'                        " awesome colorscheme

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
"-- Airline --"
let g:airline_powerline_fonts=1             " airline - enable special symbols
let g:airline_theme='jellybeans'            " airline - set theme

"-- Unite specific configurations --"
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap [unite]f :Unite -no-split -start-insert file_rec/async<cr>
nnoremap [unite]o :Unite -no-split -profile-name=ignorecase -auto-preview outline<cr>
nnoremap [unite]g :Unite -no-split grep:.<cr>
nnoremap [unite]d :Unite -no-split grep:.:-s:\(TODO\|FIXME\)<cr>

"-- Other plugins --"
let g:syntastic_python_pylint_args = "--disable=import-error" " syntastic - disable import error with pylint
let g:better_whitespace_filetypes_blacklist=['unite']
noremap <F8> :Geeknote<cr>
let g:GeeknoteFormat="markdown"

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

"-- Visual configurations --"
syntax on                                   " enable syntax highlighting
set t_Co=256                                " set color support
set number                                  " show line numbers
set showmatch                               " show matching parentheses
colorscheme jellybeans                      " set colorscheme
set incsearch                               " incremental search (preview position)
set scrolloff=1                             " try to show one line above/bellow cursor
set laststatus=2                            " always show status bar
set listchars=tab:▸\ ,eol:¬                 " Use the same symbols as TextMate for tabstops and EOLs

"-- General keybindings configuration --"
" Change key for moving up in command history
cnoremap <C-p> <Up>
" Change key for moving down in command history
cnoremap <C-n> <Down>
" Expand %% to current buffer's path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Save files as super user
command! SS write !sudo tee % > /dev/null
" Enable Spanish spell-checker
command! SCES setlocal spell spelllang=es_mx
" Enable English spell-checker
command! SCEN setlocal spell spelllang=en_us
" Disable spell-checker
command! DSC setlocal nospell
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

"-- Motion configurations --"
map <C-h> <C-w>h                            " simple window left
map <C-j> <C-w>j                            " simple window down
map <C-k> <C-w>k                            " simple window up
map <C-l> <C-w>l                            " simple window right

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
au FileType go setl noet ts=8 sw=8 sts=8

