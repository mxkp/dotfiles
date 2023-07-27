" Install vim-plug if not found
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'
call plug#end()

let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_contrast_dark = 'light'
" let g:gruvbox_italic=1

colorscheme gruvbox

set background=dark    " Setting dark mode
" set termguicolors

"set noautoindent

syntax on
filetype plugin indent on

" Searching
set hlsearch                                " Highlight searches
set incsearch                               " Highlight search results instantly
set ignorecase                              " Ignore case
set smartcase                               " Override 'ignorecase' option if the search contains upper case characters.

" Indentation
set shiftwidth=2                            " Number of spaces to use in each autoindent step
set tabstop=2                               " Two tab spaces
set softtabstop=2                           " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                               " Spaces instead of tabs for better cross-editor compatibility
set autoindent                              " Keep the indent when creating a new line
set smarttab                                " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
" set cindent                                 " Recommended seting for automatic C-style indentation
" set autoindent                              " Automatic indentation in non-C files

let g:is_posix = 1                          " Better highlighting of shell files
"filetype plugin indent on                   " Enable automatic filetype detection, filetype-specific plugins/indentation

" Misc
set nowrap                                  " I don't always wrap lines...
set linebreak                               " ...but when I do, I wrap whole words.
set t_Co=256                                " Support for xterm with 256 colors
" set number                                  " Show line numbers
set ruler                                   " Show ruler
set noswapfile                              " Don't create annoying *.swp files

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab

set backspace=indent,eol,start
