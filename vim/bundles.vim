set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.dotfiles/vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" 输入法插件
"Bundle 'CodeFalling/fcitx-vim-osx'
" 快速在指定字符两边添加指定包围字符
"Bundle 'tpope/vim-surround'
" 符号自动补全
Bundle 'Raimondi/delimitMate'
" 代码对齐参考线
"Bundle 'Yggdroot/indentLine'
" 代码搜索
Bundle 'mileszs/ack.vim'
" HTML代码自动生成
Bundle 'mattn/emmet-vim'
" 高亮html标签
"Bundle 'Valloric/MatchTagAlways'
" 支持多语言的注释
Bundle 'scrooloose/nerdcommenter'
" 树形目录
Bundle 'scrooloose/nerdtree'
" 文件快速检索
Bundle 'kien/ctrlp.vim'
" Git支持
Bundle 'tpope/vim-fugitive'
" 在文件内容左侧显示git状态
Bundle 'airblade/vim-gitgutter'
" 代码两端对齐
"Bundle 'godlygeek/tabular'
" 状态栏显示
Bundle 'vim-airline'
" 代码补全
"Bundle 'vim-scripts/AutoComplPop'
Bundle 'Valloric/YouCompleteMe'
" Color Schemes
"Bundle 'chriskempson/vim-tomorrow-theme'
"Bundle 'fisadev/fisa-vim-colorscheme'
"Bundle 'fatih/molokai'
Bundle 'mhumeSF/one-dark.vim'
" 语法支持
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/jquery.vim'
Bundle 'tpope/vim-markdown'
Bundle 'slim-template/vim-slim'
" Ruby支持
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'KurtPreston/vim-autoformat-rails'
Bundle 'stefanoverna/vim-i18n'

filetype plugin indent on     " required!

