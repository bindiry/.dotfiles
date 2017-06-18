":cd /Users/bindiry/workspace
source ~/.dotfiles/vim/bundles.vim
syntax enable
filetype plugin indent on
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
colorscheme onedark
set guifont=M+\ 1m:h18         " 设置字体和大小
"set lines=40 columns=200      " 设置默认窗口大小
if has("gui_running")
  set guioptions-=L            " 隐藏左侧滚动条
  set guioptions-=r            " 隐藏右侧滚动条
  set guioptions-=T            " 去掉上方工具栏
  set guioptions+=c
endif
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
set scrolloff=5                " 3 lines above/below cursor when scrolling
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
let maplocalleader = "\\"
set hidden                     " 解决文档未保存时不能使用TAB切换的问题
set hlsearch                   " 高亮搜索结果
set modifiable                 " 可以在quickfix list中使用o键打开
"set iskeyword+=-              " 匹配使用-连接的关键词
"set splitright                " 所有文件都从右侧纵向分割打开
set nobackup                   " 设置不生成备份文件
"set cursorline
"set cursorcolumn
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
" 禁用Ex mode
map Q <Nop>
" 默认粘贴不替换寄存器里的内容
"xnoremap p "0p
set fillchars+=vert:\          " 隐藏分割线
" Map ESC
"imap jj <ESC>

" 在注释行换行时，不自动添加注释字符
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType slim setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd BufNewFile,BufRead *.md set wrap linebreak textwidth=0

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
let NERDTreeWinSize=45
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
" 如果打开的文件只剩nerdtree，则直接退出，避免多次:q
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" airline
"let g:airline_theme='simple'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#show_tab_nr = 1

" delimitMate
let delimitMate_nesting_quotes = ['"','`']
"let g:delimitMate_backspace = 2
au FileType python let b:delimitMate_nesting_quotes = ['"']
au FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:}"
au FileType slim,javascript let b:delimitMate_nesting_quotes = ['<']

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|tmp|output|_site|public|\.asset-cache)|(\.(log|swp|ico|git|svn|png|jpg|zip|gif|ttf|svg|woff|eot|DS_Store|keep|asset-cache))$'
let g:ctrlp_show_hidden = 1
nmap <leader>p :CtrlP<CR>
nmap <leader>bb :CtrlPBuffer<CR>
nmap <leader>bm :CtrlPMixed<CR>
nmap <leader>bs :CtrlPMRU<CR>

" 切换buffers
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>j :e#<CR>

" gitgutter
let g:gitgutter_map_keys = 0

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#max_list = 20
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"let g:neocomplete#enable_auto_select = 1
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" emmet
let g:user_emmet_expandabbr_key = '<C-e>'
let g:user_emmet_install_global = 1
autocmd FileType html,css,vue EmmetInstall

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

au BufWritePre * :EraseBadWhitespace

" 查找项目目录中的TODO列表
noremap <Leader>td :noautocmd vimgrep /TODO/j **/*.rb<CR>:cw<CR>

" puts the caller
nnoremap <leader>wtf oputs "#" * 90<c-m>puts caller<c-m>puts "#" * 90<esc>

" Skip to Model, View or Controller
map <Leader>rm :Rmodel
map <Leader>rv :Rview
map <Leader>rc :Rcontroller
" View routes or Gemfile in large split
map <leader>rr :topleft :split config/routes.rb<cr>
map <leader>rg :topleft 100 :split Gemfile<cr>

" ruby
"let g:vimrubocop_keymap = 0
"nmap <Leader>r :RuboCop<CR>
"let g:syntastic_ruby_rubocop_exec = '/Users/jonas/.rbenv/shims/ruby'
