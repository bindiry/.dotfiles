let g:python_host_prog='/usr/bin/python'
call plug#begin('~/.vim/plugged')

" files manager
Plug 'scrooloose/nerdtree'
" status bar
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
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
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
" color schemes
Plug 'geoffharcourt/one-dark.vim'
" syntax highlighting
"Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
"Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-markdown'
"Plug 'slim-template/vim-slim'
" front-end
Plug 'mattn/emmet-vim'

" ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

" Elixir
"Plug 'elixir-lang/vim-elixir'
"Plug 'tpope/vim-projectionist'
"Plug 'avdgaag/vim-phoenix'
"Plug 'lucidstack/hex.vim'
"Plug 'slashmili/alchemist.vim'

" auto handle blank code
Plug 'bitc/vim-bad-whitespace'

call plug#end()
