"all pathogen#infect()
"call pathogen#helptags()
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'neovimhaskell/haskell-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf'
Plug 'andys8/vim-elm-syntax'
Plug 'purescript-contrib/purescript-vim'
Plug 'morhetz/gruvbox'

"Plug 'gmarik/Vundle.vim'
" General-purpose vim plugins
"Plug 'tpope/vim-fugitive'
" Plug 'L9'
"Plug 'shim'
Plug 'kien/ctrlp.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sensible'
" Haskell plugins
" Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/ghcmod-vim'
" Plug 'scrooloose/syntastic'
Plug 'eagletmt/neco-ghc'
"Plug 'dag/vim2hs'
Plug 'Shougo/vimproc.vim'
Plug 'vim-ruby/vim-ruby'
"Plug 'tpope/vim-rails'
Plug 'vim-scripts/Better-CSS-Syntax-for-Vim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'skalnik/vim-vroom'
"Plug 'skammer/vim-css-color'
Plug 'tpope/vim-endwise'
"Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
Plug 'git://git.wincent.com/command-t.git'
Plug 'git://github.com/Raimondi/delimitMate.git'
Plug 'git://github.com/docunext/closetag.vim.git'
"Plug 'pbrisbin/vim-syntax-shakespeare'
" Plug 'git://github.com/scrooloose/nerdcommenter.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'jeetsukumaran/vim-buffergator'
"Plug 'bitc/lushtags'
"Plug 'mkasa/lushtags'
"Plug 'tomtom/tcomment_vim'
" git repos on your local machine (i.e. when working on your own plugin)
" Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plug 'user/L9', {'name': 'newL9'}
Plug 'qpkorr/vim-bufkill'
Plug 'aiya000/vim-ghcid-quickfix'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'easymotion/vim-easymotion'
Plug 'alx741/vim-stylishask'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}

call plug#end()

" All of your Plugins must be added before the following line
" call vundle#end()            " required

" Colorscheme
set background=dark
colorscheme gruvbox
" colorscheme desert
syntax on
filetype plugin indent on

" coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
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

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use K to show documentation in preview window
nnoremap <silent> <leader>cd :call <SID>show_documentation()<CR>

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
nmap <silent> <leader>cf :call CocAction('format')<cr>

" Remap for do codeAction of current line
nmap <leader>ca <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cq <Plug>(coc-fix-current)

" Restart coc
nmap <leader>cr :CocRestart<cr>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Using CocList
nmap <leader>ff :CocList list<cr>
nmap <leader>fb :CocList buffers<cr>
nmap <leader>fg :CocList grep<cr>
nmap <leader>fw :CocList words<cr>

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" vim-commentary
map <leader>gc <Plug>Commentary

" fzf
nmap <leader>f :FZF <cr>

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" command-t keys mapping
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>

" closeTag keys mapping 
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

"tagbar config
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"set tags=./tags;/

set wildmenu
set wildmode=list:longest

let g:haddock_browser = "/usr/bin/firefox"
let g:haddock_dir = "/usr/share/doc/ghc/html"
let g:haddock_docdir = "/usr/share/doc/ghc/html"
let g:ghc = "/usr/bin/ghc"

"map <silent> <Leader>e :Errors<CR>
"map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" tab navigation like firefox
nnoremap <C-S-n> :tabprevious<CR>
nnoremap <C-n>   :tabnext<CR>
nnoremap <C-t>   :tabnew<CR>
inoremap <C-S-n> <Esc>:tabprevious<CR>i
inoremap <C-n>   <Esc>:tabnext<CR>i
inoremap <C-t>   <Esc>:tabnew<CR>

" ========== GENERAL VIM SETTINGS ==========
" Enable search highlighting
set hlsearch
" Enable line numbers
set number
" Use F11 to toggle between paste and nopaste
"set pastetoggle=

" vim-sensible enables smarttab. Here, we configure the rest:
" Set the display size of t characters
set tabstop=4
" When hitting , insert combination of t and spaces for this width.
" This combination is deleted as if it were 1 t when using backspace.
" set softtabstop=2
" Set code-shifting width. Since smarttab is enabled, this is also the tab
" insert size for the beginning of a line.
set shiftwidth=2
" When inserting tab characters, use spaces instead
set expandtab
set smartindent
" Instead of failing command, present dialog if unsaved changes
set confirm

" Enable mouse in all modes
set mouse=a

" Map jk and kj to  to exit insert mode. We need to use F11 to toggle to
" paste mode before pasting any string with jk or kj, then switch back. When
" inserting jk or kj manually, we will need to type the keys slowly so that
" the key mapping times out. Using jk or kj to escape is easier than many
" other alternatives.
" ino jk 
" ino kj 

" Set a vertical line for long line width. This will give us a visual
" indicator for cases in which line length is approaching 80 chars
"set colorcolumn=80
" Set the command section height to 2 lines.  Useful if notices (like syntastic) are shown on command lines
set cmdheight=2


map <F5> :GhciFile<CR>
"nnoremap <F5> :GhciFile<CR>

"replace selected text
vnoremap <C-r> "hy:,$s/<C-r>h//gc<left><left><left>"
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
set nowrap

" airline config
let g:airline_powerline_fonts = 1
set laststatus=2

" syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" map <silent> <Leader>e :Errors<CR>
" map <Leader>s :SyntasticToggleMode<CR>

"GHC-mod config
"autocmd BufWritePost *.hs GhcModCheckAndLintAsync

"pointfree config
"autocmd BufEnter *.hs set formatprg=pointfree

" move among buffers with CTRL
map <C-J> :bnext<CR>
map <C-K> :bprev<CR>

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }

"GREP mappings
" searches for the text in the word under the cursor (like g*) in any of the files in the current directory
:nnoremap gr :grep <cword> *<CR>

" searches for the text in the word under the cursor (like g*) in any of the files in the same directory as the current file.
:nnoremap Gr :grep <cword> %:p:h/*<CR>

" searches for the whole word under the cursor (like *) in any of the files in the current directory. 
:nnoremap gR :grep '\b<cword>\b' *<CR>

" searches for the whole word under the cursor (like *) in any of the files in the same directory as the current file
:nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

"Easymotion configuration
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" search for selection in visual mode
vnoremap // y/<C-R>"<CR>

set guifont=DejaVu\ Sans:s12

nnoremap <Leader>u mz"zylo<C-r>=printf('U+%04X', char2nr(@z))<CR><ESC>`z 

filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0

set formatprg=stylish-haskell
"au BufReadPost,BufNewFile *.hs GhcidQuickfixStart
