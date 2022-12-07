
call plug#begin("~/.config/nvim/plugged")


"Plug 'SirVer/ultisnips'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }"
Plug 'Chiel92/vim-autoformat'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
"Plug 'PhilRunninger/nerdtree-visual-selection'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'dense-analysis/ale'
Plug 'easymotion/vim-easymotion'
Plug 'honza/vim-snippets'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
"Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'
Plug 'puremourning/vimspector'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tomasiser/vim-code-dark'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'simrat39/symbols-outline.nvim'

call plug#end()

" Sets only once the value of g:env to the running environment
" from romainl
" https://gist.github.com/romainl/4df4cde3498fada91032858d7af213c2
function! Config_setEnv() abort
    if exists('g:Env')
        return
    endif
    if has('win64') || has('win32') || has('win16')
        let g:Env = 'WINDOWS'
    else
       let g:Env = toupper(substitute(system('uname'), '\n', '', ''))
    endif
endfunction

call Config_setEnv()

"------------------------
"-----system setting-----
"------------------------


if (g:Env =~# 'LINUX')
    "let g:python3_host_prog = '/usr/bin/python'
"    let g:NERDTreeGitStatusWithFlags = 1
endif

set encoding=utf8
set number relativenumber
set noswapfile
"set number
set cursorline
"set rulerformat=%l,%v
"set ruler
set tabstop=4
set shiftwidth=4
set hlsearch
set cindent
set backspace=indent,eol,start  " more powerful backspacing
set laststatus=2
set wrap
set incsearch
set mouse=a

set hidden
set expandtab
set autoindent
set smartindent
set history=5000
set clipboard=unnamedplus
"set foldmethod=syntax
set nocompatible
set ai
set autoread
set nocindent
set ft=nasm
"set foldmethod=indent
filetype plugin indent on


"let g:UltiSnipsSnippetsDir = "~\AppData\Local\nvim\plugged\vim-snippets"
"let g:UltiSnipsSnippetDirectories=["mysnippets"]
"let g:UltiSnipsSnippetDirectories=["mysnippets","UltiSnips"]

"let g:UltiSnipsExpandTrigger="<C-tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" 使用 <C-l> 觸發程式碼片段擴展
imap <Tab> <Plug>(coc-snippets-expand)
" 使用 <C-j> 用於程式碼片段的可視佔位符的選擇文本
"vmap <C-j> <Plug>(coc-snippets-select)

" 使用 <C-j> 跳轉到下一個佔位符，coc.nvim 預設值
let g:coc_snippet_next = '<Tab>'
" 使用 <C-k> 要跳轉到上一個佔位符，coc.nvim 預設值
let g:coc_snippet_prev = '<S-Tab>'

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

"nmap <C-b> :NERDTreeToggle<CR>
nmap <C-b> :NERDTreeToggle<CR>
"nmap <C-b> :Vex
"let g:netrw_liststyle = 3
"点击I键，可以显示或隐藏Netrw顶端的横幅（Banner）。例如以下命令，将隐藏横幅：
"let g:netrw_banner = 0
"使用以下命令，可以设置文件浏览器的宽度，为窗口的25%：
let g:netrw_winsize = 25

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree

syntax enable
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

"vmap ++ <plug>NERDCommenterToggle
"nmap ++ <plug>NERDCommenterToggle

"inoremap jk <ESC>
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <DELETE>
inoremap <C-y> <CR>
inoremap <C-e> <ESC>
inoremap <C-u> <Esc>ui

nmap <C-s> <Esc>:w<CR>
nmap <C-s>a <Esc>:wa<CR>
nmap <C-s>% <Esc>:w<CR>:so %<CR>
inoremap <C-s> <Esc>:w<CR>i
inoremap <C-s>a <Esc>:wa<CR>i
inoremap <C-s>% <Esc>:w<CR>:so %<CR>

"nmap <S-ENTER> ki<CR><ESC>j
nmap i<ENTER> i<CR><ESC>
nmap I<ENTER> I<CR><ESC>
nmap A<ENTER> A<CR><ESC>
nmap <ENTER> a<CR><ESC>
nmap d<ENTER> j^i<Backspace><ESC>
nmap di<ENTER> k^i<Backspace><ESC>
"map <C-;> <Esc>::

"inoremap U <C-r>
nnoremap U <C-r>
imap <C-BS> <C-W>

"imap  <Esc>\cia
"nmap  \ci
let g:NERDCompactSexyComs = 1                     "支持多行注释。

nmap da <Esc>ggdG
nmap ya <Esc>ggyG
nmap va <Esc>gg0vG$

nmap <C-w>qa <Esc>:qa<CR>
nmap <C-w>qa1 <Esc>:qa!<CR>


colorscheme gruvbox
hi Normal ctermfg=252 ctermbg=none

"finish

"
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <Ctrl-F> to format documents with prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
noremap <C-F> :Prettier<CR>
"inoremap <C-F> :Prettier<CR>

"display col line
" RulerStr() comes from http://www.vanhemert.co.uk/vim/vimacros/ruler2.vim
"function! RulerStr()
"let columns = &columns
"let inc = 0
"let str = ""
"while (inc < columns)
"let inc10 = inc / 10 + 1
"let buffer = "."
"if (inc10 > 9)
"let buffer = ""
"endif
"let str .= "....+..." . buffer . inc10
"let inc += 10
"endwhile
"let str = strpart(str, 0, columns)
"return str
"endfunction

"let s:saved_stl = {}
"function! s:ToggleRuler()
"let buf = bufnr('%')
"if has_key(s:saved_stl, buf)
"let &l:stl = s:saved_stl[buf]
"unlet s:saved_stl[buf]
"else
"let s:saved_stl[buf] = &l:stl
"setlocal stl=%{RulerStr()}
"endif
"endfunction
"nnoremap <F1> :call <sid>ToggleRuler()<cr>

"------rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
            \   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
                \       '*': {},
                \       'tex': {
                    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
                    \       },
                    \       'lisp': {
                        \           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
                        \       },
                        \       'vim': {
                            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
                            \       },
                            \       'html': {
                                \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
                                \       },
                                \       'css': 0,
                                \   }
                                \}



"---like vscode
let g:NERDTreeIgnore = ['^node_modules$']

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
"nnoremap <C-w> :w<CR>
"nnoremap <C-Q> :q<CR>
"nnoremap <C-Q> :wq<CR>

" shift+arrow selection
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi

"au BufWrite * :Autoformat
noremap <C-f> :w<CR>:Autoformat<CR>
inoremap <C-f> <Esc>:w<CR>:Autoformat<CR>a

"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimiters = { 'do': { 'left': '-'} }

set cindent
"colorscheme codedark
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" coc config
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-json',
            \ 'coc-python',
            \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_nfo()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>i


let g:ale_completion_enabled = 0
let g:ale_linters = {'python': ['flake8', 'pylint'], 'javascript': ['eslint']}


" navegação entre os buffers
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <F4> :bp \|bd #<cr>

"Easymotion comfiger
let g:EasyMotion_do_mapping = 0
map <leader>f <Plug>(easymotion-bd-f)
map <leader>s <Plug>(easymotion-s2)
map <Leader>L <Plug>(easymotion-bd-jk)
map <Leader>w <Plug>(easymotion-bd-w)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

" 設置切換tab的快捷鍵 <\> + <i> 切換到第i個 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 設置切換tab的快捷鍵 <\> + <-> 切換到前一個 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 設置切換tab的快捷鍵 <\> + <+> 切換到后一個 tab
nmap <leader>= <Plug>AirlineSelectNextTab
" 設置切換tab的快捷鍵 <\> + <q> 退出當前的 tab
nmap <leader>q :bp<cr>:bd #<cr>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_symbols.linenr = "☰" " current line
"let g:airline_symbols.maxlinenr = " ln" "maxline
"let g:airline_symbols.branch = " BR"
"let g:airline_symbols.readonly = "R-"
"let g:airline_symbols.dirty = "DT"
"let g:airline_symbols.crypt = "CR"  

"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='base16_twilight'

let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}


let g:vimspector_enable_mappings = 'VISUAL_STUDIO'





"""""""""""""""""""""""""""""
" Later use in another file "
"""""""""""""""""""""""""""""

" I can call this function before every environment specific block with the
" early return branch.
"if (g:Env =~# 'WINDOWS')
    " Enable Windows specific settings/plugins
"else if (g:Env =~# 'LINUX')
    " Enable Linux specific settings/plugins
"else if (g:Env =~# 'DARWIN')
    " Enable MacOS specific settings/plugins
"else
    " Other cases I can't think of like MINGW
"endif
