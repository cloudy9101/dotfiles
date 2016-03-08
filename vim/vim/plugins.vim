set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Put the plugins here
Plugin 'dyng/ctrlsf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'ddollar/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
" Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'rizzatti/dash.vim'
" Plugin 'Shougo/neocomplete'
Plugin 'iamcco/markdown-preview.vim'

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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag instead of grep
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --vimgrep --hidden --ignore ' .
  \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
endif

" Unite
let g:unite_source_history_yank_enable = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'git5/.*/review/',
      \ 'google/obj/',
      \ 'tmp/',
      \ '.sass-cache',
      \ 'node_modules/',
      \ 'bower_components/',
      \ 'dist/',
      \ '.git5_specs/',
      \ '.pyc',
      \ '_build/',
      \ ], '\|'))

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" let g:jsx_ext_required=0 " Allow JSX in normal JS files

"let g:syntastic_javascript_checkers = ["eslint"]
"let g:syntastic_ruby_checkers = ["rubocop"]

" Airline
set laststatus=2
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2

" Neocomplete
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$|node_modules',
  \ }
let g:ctrlp_use_caching = 1

" markdown preview
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
