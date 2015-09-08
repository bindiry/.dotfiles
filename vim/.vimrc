source ~/.dotfiles/vim/bundles.vim
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
syntax on
colorscheme onedark 
set cursorline
set clipboard+=unnamed         " use system clipboard
set incsearch
set smartcase
set nocompatible               " discard vi
set history=1000
set number
set nofoldenable
set confirm
set backspace=indent,eol,start " More powerful backspacing
set t_Co=256                   " Explicitly tell vim that the terminal has 256 colors
set nowrap                     " dont wrap lines
set scrolloff=3                " 3 lines above/below cursor when scrolling
set showmatch                  " show matching bracket (briefly jump)
set matchtime=2
set showcmd                    " show typed command in status bar
set title                      " show file in titlebar
set laststatus=2               " use 2 lines for the status bar
set statusline=%F:\ %l         " 在状态栏显示当前文件路径及所在行号
set matchpairs+=<:>            " specially for html
set autoindent
set smartindent                " indent when
set tabstop=2                  " tab width
set softtabstop=2              " backspace
set shiftwidth=2               " indent width
set expandtab                  " expand tab to space
let mapleader=','
set hidden                     " 解决文档未保存时不能使用TAB切换的问题
"set splitright                 " 所有文件都从右侧纵向分割打开
" 使用TAB切换buffers
map <s-tab> :bp<cr> 
map <tab> :bn<cr>
" 在注释行换行时，不自动添加注释字符
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

if has('mouse')
    set mouse-=a
endif

" 回到文件退出前光标所在的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Nerd Tree
" 启动vim时自动打开nerdtree
" autocmd VimEnter * NERDTree
" 打开vim时自动将光标定位在编辑窗口
" autocmd VimEnter * wincmd p
map <F3> :NERDTreeToggle<CR>
" let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
" 如果打开的文件只剩nerdtree，则直接退出，避免多次:q
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 查找项目目录中的TODO列表
noremap <Leader>trb :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp)|(\.(swp|ico|git|svn))$'

" emmet
"let g:user_emmet_expandabbr_key = '<C-e>'
