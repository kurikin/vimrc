set encoding=utf-8
scriptencoding=utf-8
set clipboard+=unnamed
set mouse=a

if &compatible
  set nocompatible
endif

" vimspector の設定
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'MattesGroeger/vim-bookmarks'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'pangloss/vim-javascript'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'OmniSharp/omnisharp-vim'
Plug 'mattn/vim-sonictemplate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'terryma/vim-expand-region'

call plug#end()

let g:tex_flavor='latex'
" VimTex Settings
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [
      \    '-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',
      \],
      \}
" VimTex Settings End
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
nnoremap <silent> ts :tabe<CR> 
nnoremap <silent> tc :tabclose<CR> 
nnoremap <silent> tp :bprev<CR>
nnoremap <silent> tn :bnext<CR>
nnoremap <C-w>s <C-w>v
nnoremap j gj
nnoremap k gk
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる

" For MarkdownPreview
:command Mp PrevimOpen
let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'

colorscheme gruvbox

set background=dark
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" プレビューを無効化
"set completeopt=menuone

" 見た目系
" 行番号を表示
set number
" 行番号を相対的に表示
set relativenumber
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ステータスラインを常に表示
set laststatus=2

let g:javascript_plugin_jsdoc = 1
highlight link Delimiter TexSection
highlight link texMathZoneAmsA Identifier
highlight link texMathSymbol Identifier
highlight BookmarkSign ctermfg=45
let g:bookmark_sign = '>>'

" Python-Vim-Highlight-Settings
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" 改行時に前の行のインデントを継続する
set autoindent
" cindent を有効
set cindent

" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 補完の色を変更
hi PmenuSel ctermbg=4

" set clipboard+=unnamed
nmap <Esc><Esc> :nohlsearch<CR><Esc>

let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_warning = '%{strftime("%H:%M")}'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_stdio_quickload = 1
let g:bookmark_sign = '>>'

" Markdown parser settings
let g:preview_markdown_parser = 'glow'

" if hidden is not set, TextEdit might fail.
set hidden
" always show signcolumns
set signcolumn=yes

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Ctrl+nでファイルツリーを表示/非表示する (Fern.vim)
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

packadd termdebug 

hi Normal ctermbg=NONE
hi CursorLineNr ctermbg=NONE
hi CursorLine ctermbg=NONE
hi SignColumn ctermbg=NONE

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'angr'
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0

" --- Coc.nvim settings ---
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Coc.nvim mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gk <Plug>(coc-float-jump)
nmap <silent> <C-\> <Plug>(coc-rename)

" vim-fmt でのインデントをスペース4つ分に変更
au FileType go setlocal sw=4 ts=4 sts=4 noet

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" Add missing imports on save when editing go files
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

" <C-k> でスニペットを展開
inoremap <silent><expr> <C-k>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<C-k>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<C-k>'

