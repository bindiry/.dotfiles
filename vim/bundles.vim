let g:python_host_prog='/usr/bin/python'
call plug#begin('~/.vim/plugged')

" files manager
Plug 'scrooloose/nerdtree'
" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
" search
Plug 'rking/ag.vim'
" code comment
Plug 'scrooloose/nerdcommenter'
" git status
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" code completion
Plug 'Shougo/neocomplete.vim'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" for neovim
"Plug 'Shougo/deoplete.nvim'
Plug 'Raimondi/delimitMate'
"Plug 'tpope/vim-surround'
" color schemes
Plug 'geoffharcourt/one-dark.vim'
" syntax highlighting
"Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
"Plug 'nono/jquery.vim'
Plug 'tpope/vim-markdown'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
" front-end
Plug 'mattn/emmet-vim'
" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'KurtPreston/vim-autoformat-rails'
" auto handle blank code
Plug 'bitc/vim-bad-whitespace'
" auto switch input method
"Plug 'ybian/smartim'
" indent
"Plug 'nathanaelkane/vim-indent-guides'

call plug#end()
