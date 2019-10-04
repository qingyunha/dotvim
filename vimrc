" vimrc load order
" :help initialization
" :version
"
" - system vimrc.  $VIM/vimrc --> /etc/vimrc  /usr/share/vim/vimrc
" - default vimrc if no user vimrc been found and skip_defaults_vim != 1
"           $VIMRUNTIME/defaults.vim --> /usr/share/vim/vim81/defaults.vim
" - user vimrc  $HOME/.vimrc $HOME/.vim/vimrc
"

set number

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set mouse=          " diable mouse
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make

syntax on
filetype plugin indent on

" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | au! | augroup END"
augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END


" reading "vimrc" from current directory safely
set exrc
set secure
