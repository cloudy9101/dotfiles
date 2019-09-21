set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'colors/onedark.vim'

" Put the plugins here
Plugin 'mattn/emmet-vim' " Emmet snippet for html
Plugin 'ddollar/nerdcommenter' " Smart code comment
Plugin 'tpope/vim-fugitive' " Gblame etc
Plugin 'airblade/vim-gitgutter' " Show file changes with git ~ + -
Plugin 'tpope/vim-endwise' " Smart auto end
Plugin 'jiangmiao/auto-pairs' " Smart ()[]{}...
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fzf a fuzzy finder
Plugin 'junegunn/fzf.vim' " Integrate fzf with vim
Plugin 'itchyny/lightline.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'w0rp/ale'
Plugin 'neoclide/coc.nvim', {'do': './install.sh nightly'}

" programming lang support
Plugin 'elixir-lang/vim-elixir'
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim.git'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-rails'

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

" Config for plugins below

""" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css,slim,erb,javascript EmmetInstall
let g:user_emmet_leader_key=','

""" NerdCommenter
let g:NERDSpaceDelims = 0
let g:NERDDefaultAlign = 'left'

""" Lightline
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

""" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""" ale
let g:ale_linters = {
\   'ruby': ['solargraph', 'rubocop'],
\   'javascript': ['eslint'],
\}

""" Coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
