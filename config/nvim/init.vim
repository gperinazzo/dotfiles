call plug#begin('~/.local/share/nvim/plugged')
	Plug 'https://github.com/tpope/vim-sleuth.git'
	Plug 'https://github.com/fatih/vim-go.git', { 'do': ':GoUpdateBinaries' }
	Plug 'rust-lang/rust.vim'

	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'w0rp/ale'
	Plug 'rust-lang/rust.vim'
call plug#end()

let g:python_host_prog  = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

set number relativenumber
set nu rnu

" Colorscheme
set termguicolors
let g:molokai_original = 1
colorscheme molokai

" Ale
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'rust': ['rustfmt'],
\}

let g:ale_linters = {
\ 'rust': ['rls', 'cargo'],
\}
