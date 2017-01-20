syntax enable
" solarized is nice
set background=dark
colorscheme solarized

"gitgutter to show changes
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" space as leader
let mapleader = "\<Space>"

set backspace=indent,eol,start
set expandtab
set tabstop=4
set shiftwidth=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd BufRead,BufNewFile *.tt setfiletype ruby
set smartindent
set hlsearch
set number
set cursorline
set relativenumber
set splitright
set splitbelow
set ignorecase
set smartcase
set mouse=a

"leader g to ag
let g:ackprg = 'ag --vimgrep'
let g:grep_operator = 'Ack'
nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt

"space to clear highlighting
:noremap <silent> <Space> :nohlsearch<BAR>:echo<cr>

"nice indentLine
let g:indentLine_char = '┆'

"syntastic recommended
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"show all syntastic messages
" let g:syntastic_quiet_messages = {}
"use these checkers
let g:syntastic_ruby_checkers = [ "mri", "rubocop", "flog" ]
let g:syntastic_rust_checkers = [ "rustc" ]

"ycm - don't ask about loading extra config files under ~
" let g:ycm_extra_conf_globlist = ['~/*']

"for vim-dispatch try rake and then make
" let b:dispatch = 'cargo test'
let b:dispatch = 'rake test'

"vim-test bindings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"

"point to homebrew python
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python2'

"ctrlp bindings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'calebsmith/vim-lambdify'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-dispatch'
Plugin 'bling/vim-airline'
Plugin 'elzr/vim-json'
Plugin 'jiangmiao/auto-pairs'
Plugin 'inside/vim-grep-operator'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'janko-m/vim-test'
" Plugin 'valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'rdnetto/YCM-Generator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
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

"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set hidden
let g:racer_cmd = "/Users/dannyhua/.cargo/bin/racer"

"Rust
let g:rustfmt_autosave = 1

" neovim dev
" autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
