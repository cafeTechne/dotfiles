set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator' " Navigate between tmux and vim panes with a single set of hotkeys
Plugin 'tpope/vim-fugitive' "git stuff
Plugin 'vim-ruby/vim-ruby'
Plugin 'avakhov/vim-yaml'
Plugin 'xolox/vim-misc' " Dependency for vim-notes
Plugin 'xolox/vim-notes' " Note taking
" All of your Plugins must be added before the following line
call vundle#end()            " required
set nocompatible
syntax on
filetype plugin indent on    " required
colorscheme molokai
set guifont=Monaco:h20
set number
autocmd FileType ruby compiler ruby
au BufNewFile,BufRead *.lic set filetype=ruby
set shiftwidth=2
set tabstop=2
set expandtab
"au BufNewFile,BufRead *.py
 "   \ set tabstop=4
  "  \ set softtabstop=4
   " \ set shiftwidth=4
   " \ set textwidth=79
   " \ set expandtab
   " \ set autoindent
   " \ set fileformat=unix
