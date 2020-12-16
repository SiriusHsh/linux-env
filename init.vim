" __  ____   ____     _____ __  __ ____   ____ 
"|  \/  \ \ / /\ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  \ \ / / | || |\/| | |_) | |    
"| |  | | | |    \ V /  | || |  | |  _ | |___ 
"|_|  |_| |_|     \_/  |___|_|  |_|_| \_\\____|
"                                              
"
set encoding=UTF-8
let mapleader=" "
syntax on
"set mouse=a
set number
set relativenumber
set cursorline
set wrap
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set expandtab
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

noremap <LEADER><CR> :noh<CR>
noremap L 5l
noremap K 5k
noremap J 5j
noremap H 5h

noremap <silent> <C-e> $
noremap <silent> <C-a> 0
noremap s <nop>
nnoremap S :w<CR>
noremap Q :q<CR>
noremap R :source $MYVIMRC<CR>

noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap sj :set splitbelow<CR>:split<CR>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

noremap <LEADER>l :vertical resize+5<CR>
noremap <LEADER>h :vertical resize-5<CR>
noremap <LEADER>j :res+5<CR>
noremap <LEADER>k :res-5<CR>

noremap tu :tabe<CR>
noremap tl :+tabnext<CR>
noremap th :-tabnext<CR>

noremap sv <C-w>t<C-w>H
noremap sb <C-w>t<C-w>K


call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-github-dashboard'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'connorholyday/vim-snazzy'
Plug 'ajmwagar/vim-deus'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'mg979/vim-xtabline'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'gcmt/wildfire.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

"  =====================  Start of Plugin Settings  =====================  "
let g:syntastic_python_python_exec = '$HOME/anaconda/bin/python'
let g:python3_host_prog=$HOME."/anaconda/bin/python"
"  =====================  Design  =====================  "
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:SnazzyTransparent = 1
"colorscheme snazzy
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme deus
"  =====================  COC  =====================  "
let g:coc_global_extensions=[
            \'coc-json',
            \'coc-vimlsp',
            \'coc-python',
            \'coc-tsserver',
            \'coc-clangd', 
            \'coc-snippets',
            \'coc-yank',
            \'coc-pairs',
            \'coc-java']


set hidden
set updatetime=100
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" coc-snippets
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_snippet_next = '<tab>'


"  =====================  NERDTree =====================  "
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeHighlightCursorline = 0
nmap <F4> :TagbarToggle<CR>

"  =====================  gitgutter =====================  "
" =====  gitgutter  ======  "
let g:gitgutter_map_keys = 0

"  =====================  undotree  =====================  "
" =====  undotree  ======  "
nnoremap <F5> :UndotreeToggle<CR>

"  =====================  FZF  =====================  "
" =====  fzf  =====  "
"<Leader>f在当前目录搜索文件
nnoremap <silent> <Leader>f :Files<CR>
"<Leader>b切换Buffer中的文件
nnoremap <silent> <Leader>b :Buffers<CR>
"<Leader>p在当前所有加载的Buffer中搜索包含目标词的所有行，:BLines只在当前Buffer中搜索
nnoremap <silent> <Leader>p :Lines<CR>
"<Leader>h在Vim打开的历史文件中搜索，相当于是在MRU中搜索，:History：命令历史查找
nnoremap <silent> <Leader>H :History<CR>

"command! -bang -nargs=? -complete=dir Files
    "\ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
"调用Rg进行搜索，包含隐藏文件
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif



"figlet



