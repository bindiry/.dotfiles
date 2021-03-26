" neovim config
"
" cp this file to ~/.config/nvim/init.vim

" install vim-plug
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" enter into neovim and run `:PlugInstall`

" install eslint
" yarn add -D eslint
" yarn add -D prettier eslint-plugin-prettier eslint-config-prettier
" yarn eslint -- --init

" install rubocop
" gem install rubocop

" other
" mkdir -p ~/.config/nvim/swap
" mkdir -p ~/.config/nvim/undo

let os = substitute(system('uname'), "\n", "", "")

call plug#begin('~/.vim/plugged')

Plug 'Shougo/defx.nvim',  { 'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-git'
Plug 'joshdick/onedark.vim'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'tomtom/tcomment_vim'
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby'] }
Plug 'kana/vim-textobj-user', { 'for': ['ruby'] }
Plug 'othree/eregex.vim'
Plug 'othree/html5.vim'
Plug 'xolox/vim-misc'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ap/vim-css-color'
Plug 'bfredl/nvim-miniyank'
Plug 'dzeban/vim-log-syntax'
Plug 'stephpy/vim-yaml'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/renamer.vim'
" Plug 'editorconfig/editorconfig-vim'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set exrc " loads project spedific .nvimrc

"-----------------------
"""""""""""""""""""""""""
" KEYBINDINGS
"""""""""""""""""""""""""
let mapleader=","
inoremap jj <ESC>
inoremap <C-t> <NOP>
map <Leader>r "hy:%S/<C-r>h//gc<left><left><left>
map <Leader>f *
map <Leader>rr :!ruby %<CR>
map <Leader>qa :wqa<CR>
map <Leader>bp :bp<CR>
map <Leader>bd :bd<CR>
map <Leader>[ :bprevious<CR>
map <Leader>] :bnext<CR>
map <Leader>y "+y<CR>
map <Leader>D "_dd<CR>
map <Leader>d "_d<CR>
map <Leader>// :TComment<CR>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
nnoremap <Leader>abd :w <bar> %bd <bar> e# <bar> bd# <CR>
nnoremap <leader>. :Tags <CR>
nnoremap <Leader>fu :BTags<Cr>
nnoremap <C-e> :Buffers<CR>
" fix method jumping
nnoremap <buffer><silent> <C-]> :tag <C-R><C-W><CR>

" Useful maps
" closes the all terminal buffers
nnoremap <Leader>tc :call neoterm#close_all()<cr>
" clear terminal
nnoremap <Leader>tl :call neoterm#clear()<cr>

" clear highlight
map <Leader><Leader>h :set hlsearch!<CR>

" Automatically remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" regenerate CTAGS - https://github.com/universal-ctags/ctags
map <Leader>ct :silent !ctags -R --exclude="*min.js"<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

" EasyMotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" lazygit
nnoremap <silent> <leader>lg :LazyGit<CR>

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>ea <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ea <Plug>(EasyAlign)
" FZF
map <Leader>p :FZF<CR>
" nnoremap <C-f> :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --hidden --ignore .git --ignore .idea'
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

"""""""""""""""""""""""""
" Basic features
"""""""""""""""""""""""""
" Misc
set secure
set lazyredraw
set splitbelow
set splitright
set diffopt+=vertical
set shell=/bin/zsh
scriptencoding utf-8
set encoding=utf-8
set termencoding=utf-8
set clipboard=unnamedplus
filetype plugin indent on " Do filetype detection and load custom file plugins and indent files
set laststatus=2          " When you go into insert mode,
                          " the status line color changes.
                          " When you leave insert mode,
                          " the status line color changes back.

" Display options
syntax on
set pastetoggle=<F12>
set nocursorline
set number
set list!                       " Display unprintable characters
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
autocmd filetype html,xml,go set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
colorscheme onedark
set t_ut= " fixes transparent BG on tmux
set ttimeoutlen=100
set diffopt+=vertical

" Always edit file, even when swap file is found
set shortmess+=A
set hidden                         " Don't abandon buffers moved to the background
set wildmenu                       " Enhanced completion hints in command line
set backspace=eol,start,indent     " Allow backspacing over indent, eol, & start
set complete=.,w,b,u,U,t,i,d       " Do lots of scanning on tab completion
set completeopt-=preview           " Do not show preview window, just the menu
set directory=~/.config/nvim/swap  " Directory to use for the swap file
set diffopt=filler,iwhite          " In diff mode, ignore whitespace changes and align unchanged lines
set nowrap
set visualbell
" set mouse=a
" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
" autocmd FileChangedShellPost *
" \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Relative line numbers
set norelativenumber

" Indentation and tabbing
set autoindent smartindent
set smarttab                    " Make <tab> and <backspace> smarter
set tabstop=2
set expandtab
set shiftround
set shiftwidth=2
" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :100 : up to 100 lines of command-line history will be remembered
"   n... : where to save the viminfo files
" set viminfo=%100,'100,/100,h,\"500,:100,n~/.config/nvim/viminfo

" Undo
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo
if has("persistent_undo")
  set undodir=~/.config/nvim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch


" to_html settings
let html_number_lines = 1
let html_ignore_folding = 1
let html_use_css = 1
"let html_no_pre = 0
let use_xhtml = 1
let xml_use_xhtml = 1
" tmux
set termguicolors
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" indent guides
let g:indent_guides_guide_size = 1
" indent guides shortcut
map <silent><F7>  <leader>ig
"""""""""""""""""""""""""
" Plugin's
"""""""""""""""""""""""""
" emmet
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,eruby,erb EmmetInstall
" let g:user_emmet_leader_key='<C-T>'

" ultisnips
" let g:UltiSnipsExpandTrigger="<C-D>"

" auto-pairs
let g:AutoPairsFlyMode = 0

" ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \   'markdown': ['prettier'],
      \   'yaml': ['prettier'],
      \   'css': ['prettier'],
      \   'scss': ['prettier'],
      \   'erb': ['erb'],
      \}

" defx
map <Leader>m :Defx<CR>
map <Leader>n :Defx -search=`expand('%:p')` `getcwd()`<CR>
call defx#custom#option('_', {
        \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'direction': 'leftabove',
            \ 'show_ignored_files': 0,
            \ 'buffer_name': '',
            \ 'toggle': 1,
            \ 'resume': 1,
            \ 'columns': "git:mark:indent:filename",
            \ 'ignored_files':
            \     'node_modules,.mypy_cache,.pytest_cache,.git,.idea,.hg,.svn,.stversions'
            \   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
            \ })

call defx#custom#column('filename', {
            \ 'directory_icon': '▸',
            \ 'opened_icon': '▾',
            \ 'root_icon': ' ',
            \ 'min_width': 5,
            \ 'max_width': 40,
            \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort

    nnoremap <silent><buffer><expr> '       defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> X       defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy      defx#do_action('copy')
    nnoremap <silent><buffer><expr> q       defx#do_action('quit')
    nnoremap <silent><buffer><expr> m       defx#do_action('move')
    nnoremap <silent><buffer><expr> p       defx#do_action('paste')
    nnoremap <silent><buffer><expr> h       defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> l       defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> o       defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> <Cr>    defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> <2-LeftMouse> defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> sv      defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> sh      defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> st      defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> S       defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> P       defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
    nnoremap <silent><buffer><expr> dd      defx#do_action('remove_trash')
    nnoremap <silent><buffer><expr> r       defx#do_action('rename')
    nnoremap <silent><buffer><expr> .       defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
    nnoremap <silent><buffer><expr> !       defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-r>   defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>   defx#do_action('print')
    nnoremap <silent><buffer><expr> \       defx#do_action('cd', getcwd())
endfunction

" in this function we should vim-choosewin if possible
function! DefxSmartL(_)
    if defx#is_directory()
        call defx#call_action('open_tree')
        normal! j
    else
        let filepath = defx#get_candidate()['action__path']
        if tabpagewinnr(tabpagenr(), '$') >= 3    " if there are more than 2 normal windows
            if exists(':ChooseWin') == 2
                ChooseWin
            else
                if has('nvim')
                    let input = input({
                                \ 'prompt'      : 'ChooseWin No.: ',
                                \ 'cancelreturn': 0,
                                \ })
                    if input == 0 | return | endif
                else
                    let input = input('ChooseWin No.: ')
                endif
                if input == winnr() | return | endif
                exec input . 'wincmd w'
            endif
            exec 'e' filepath
        else
            exec 'wincmd w'
            exec 'e' filepath
        endif
    endif
endfunction

" defx git
let g:defx_git#indicators = {
    \ 'Modified'  : 'M',
    \ 'Staged'    : 'm',
    \ 'Untracked' : '?',
    \ 'Renamed'   : '≫',
    \ 'Unmerged'  : 'u',
    \ 'Ignored'   : 'i',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '⁇'
    \ }

hi Defx_git_Untracked ctermfg=12 guifg=#81a2be
hi Defx_git_Ignored   ctermfg=8  guifg=#404660
hi Defx_git_Unknown   ctermfg=3  guifg=#f0c674
hi Defx_git_Renamed   ctermfg=3  guifg=#de935f
hi Defx_git_Modified  ctermfg=9  guifg=#cc6666
hi Defx_git_Unmerged  ctermfg=14 guifg=#8abeb7
hi Defx_git_Deleted   ctermfg=13 guifg=#b294bb
hi Defx_git_Staged    ctermfg=10 guifg=#b5bd68

" Ack.vim
cnoreabbrev ag Ack -Q
cnoreabbrev aG Ack -Q
cnoreabbrev Ag Ack -Q
cnoreabbrev AG Ack -Q
cnoreabbrev F Ack -Q
cnoreabbrev f Ack -Q
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('typescript', 'min_pattern_length', 2)
call deoplete#custom#source('_', 'max_candidates', 3)
call deoplete#custom#source('buffer', 'rank', 501)
call deoplete#custom#source('buffer', 'max_candidates', 2)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
autocmd FileType ruby,javascript inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" Neoterm
let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_run_tests_bg = 1
let g:neoterm_raise_when_tests_fail = 1
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = 10

let g:neoterm_rspec_lib_cmd = 'bundle exec rspec'

" JS libs
let g:used_javascript_libs = 'jquery,handlebars,underscore,backbone'

" ignored files
set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/.git/*
set wildignore+=*/.idea/*
set wildignore+=*/node_modules/*
set wildignore+=*/spec/vcr/*
set wildignore+=*/public/*
set wildignore+=*/coverage/*
set wildignore+=*.png,*.jpg,*.otf,*.woff,*.jpeg,*.orig

" Markdown
let g:vim_markdown_folding_disabled=1

" EasyMotion
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" ruby
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=?
autocmd FileType ruby,eruby,yaml,haml setlocal iskeyword+=!
autocmd FileType ruby compiler ruby

" omnifuncs
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=120

"""""""""""""""""""""""""
" Custom functions
"""""""""""""""""""""""""

"This allows for change paste motion cp{motion}
nmap <silent> cp :set opfunc=ChangePaste<CR>g@
function! ChangePaste(type, ...)
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif |

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

