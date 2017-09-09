"all pathogen#infect()
"call pathogen#helptags()
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" General-purpose vim plugins
"Plugin 'tpope/vim-fugitive'
Plugin 'L9'
"Plugin 'shim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
" Haskell plugins
" Plugin 'lukerandall/haskellmode-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'scrooloose/syntastic'
Plugin 'eagletmt/neco-ghc'
"Plugin 'dag/vim2hs'
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/Better-CSS-Syntax-for-Vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'skalnik/vim-vroom'
"Plugin 'skammer/vim-css-color'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'git://github.com/Raimondi/delimitMate.git'
Plugin 'git://github.com/docunext/closetag.vim.git'
"Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'git://github.com/scrooloose/nerdcommenter.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeetsukumaran/vim-buffergator'
"Plugin 'bitc/lushtags'
"Plugin 'mkasa/lushtags'
"Plugin 'tomtom/tcomment_vim'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

set wildmenu
set wildmode=list:longest

let g:haddock_browser = "/usr/bin/firefox"
let g:haddock_dir = "/usr/share/doc/ghc/html"
let g:haddock_docdir = "/usr/share/doc/ghc/html"
let g:ghc = "/usr/bin/ghc"

map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_auto_loc_list=1

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

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
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"
nnoremap <F2> :<C-U>setlocal lcs=tab:>-,trail:-,eol:$ list! list? <CR>
set nowrap

" airline config
let g:airline_powerline_fonts = 1
set laststatus=2

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

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
