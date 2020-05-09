syntax enable
colorscheme solarized
let dark = system('defaults read -g AppleInterfaceStyle |grep -q Dark')
if v:shell_error == 0
    set background=dark
else
    set background=light
endif

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
set tabstop=2
set shiftwidth=2
autocmd BufRead,BufNewFile *.tt setfiletype ruby
set smartindent
set hlsearch
set number
set cursorline
set splitright
set splitbelow
set ignorecase
set smartcase
set mouse=a
set clipboard=unnamed

"lol search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"space to clear highlighting
noremap <silent> <Space> :nohlsearch<BAR>:echo<cr>

"fast escape
inoremap fj <Esc>
vnoremap fj <Esc>

"nice indentLine
let g:indentLine_char = '┆'

autocmd Filetype rust let b:dispatch = 'cargo build'
autocmd BufRead,BufNewFile *.tf setfiletype terraform
autocmd Filetype terraform let b:dispatch = 'terraform validate -no-color'
nmap <silent> <leader>m :Dispatch<CR>

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
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"ale
let g:ale_rust_rls_executable = '/Users/danny/.cargo/bin/rust-analyzer'
let g:ale_linters = {
\   'go': ['golint'],
\   'proto': ['prototool-lint'],
\   'rust': ['rls', 'cargo'],
\}

let g:ale_fixers = {
\   '*':['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}
let g:ale_rust_cargo_use_clippy = 1
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-l> <Plug>(ale_go_to_definition_in_vsplit)
nmap <silent> <C-i> <Plug>(ale_go_to_definition)
nmap <silent> <C-h> <Plug>(ale_find_references)
nmap <silent> <C-y> <Plug>(ale_hover)
nmap <silent> <C-n> <Plug>(ale_detail)

" <leader>f will format and fix your current file.
" Change to PrototoolFormat to only format and not fix.
nnoremap <silent> <leader>f :call PrototoolFormatFix()<CR>

"fmt terraform on save
let g:terraform_fmt_on_save=1

set nocompatible              " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'calebsmith/vim-lambdify'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'elzr/vim-json'
Plug 'inside/vim-grep-operator'
Plug 'mileszs/ack.vim'
Plug 'Yggdroot/indentLine'
Plug 'janko-m/vim-test'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
Plug 'hashivim/vim-terraform'
Plug 'prettier/vim-prettier'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled=1


"prettier
let g:prettier#autoformat_config_present = 1

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

autocmd CompleteDone * silent! pclose!
