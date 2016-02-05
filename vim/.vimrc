:cd /Users/bindiry/workspace
source ~/.dotfiles/vim/bundles.vim
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
syntax on
colorscheme onedark 
set guifont=M+\ 2m:h14         " 设置字体和大小
"set lines=40 columns=200       " 设置默认窗口大小
set clipboard+=unnamed         " use system clipboard
"xnoremap p pgvy                " 持续粘贴
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
set hlsearch                   " 高亮搜索结果
"set iskeyword+=-              " 匹配使用-连接的关键词
"set splitright                " 所有文件都从右侧纵向分割打开
set nobackup                   " 设置不生成备份文件
set cursorline
set cursorcolumn
"set colorcolumn=120
"hi ColorColumn ctermbg=238
" 设置高亮列背景色，并设置快捷键开启和关闭
"hi CursorColumn ctermbg=black
"nnoremap <Leader>col :set cursorcolumn!<CR>
" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %
" remap U to <C-r> for easier redo
nnoremap U <C-r>
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

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
" let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
" 如果打开的文件只剩nerdtree，则直接退出，避免多次:q
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" delimitMate
let delimitMate_nesting_quotes = ['"','`']
au FileType python let b:delimitMate_nesting_quotes = ['"']
au FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:}"

" 查找项目目录中的TODO列表
noremap <Leader>trb :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>

" ctrlp
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  "\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
"\}
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|output|_site|public)|(\.(log|swp|ico|git|svn|png|jpg|zip|gif|ttf|svg|woff|eot))$'
nmap <leader>p :CtrlP<CR>
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>

" gitgutter
let g:gitgutter_map_keys = 0

" 使用TAB切换buffers
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" emmet
"let g:user_emmet_expandabbr_key = '<C-e>'

" MatchTagAlways
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'erb' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}

" ctags
au BufWritePost *.rb,*.ru silent! !ctags -R --languages=ruby &
" vim-i18n
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>

" Dash
nmap <leader>dr :silent !open dash://ruby:<cword><cr>
nmap <leader>da :silent !open dash://rails:<cword><cr>

" indentline
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#555555'

" youdao
vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap <leader>yd :Yde<CR>
