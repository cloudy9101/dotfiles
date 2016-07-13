set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Put the plugins here
Plugin 'mattn/emmet-vim' " Emmet snippet for html
Plugin 'Shougo/deoplete.nvim', { 'do': function('DoRemote') } " Auto Complete
Plugin 'ddollar/nerdcommenter' " Smart code comment
Plugin 'tpope/vim-fugitive' " Gstatus... git cli in vim
Plugin 'bling/vim-airline' " Powerful status bar
Plugin 'airblade/vim-gitgutter' " Show file changes with git ~ + -
Plugin 'Shougo/vimproc.vim' " Run cli in vim
Plugin 'tpope/vim-endwise' " Smart auto end
Plugin 'jiangmiao/auto-pairs' " Smart ()[]{}...
Plugin 'rizzatti/dash.vim' " Open dash
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fzf a fuzzy finder
Plugin 'junegunn/fzf.vim' " Integrate fzf with vim

" snippets
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" syntastic
Plugin 'scrooloose/syntastic'

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

""" Deocomplete
let g:deoplete#enable_at_startup = 1

""" NerdCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

""" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
  let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%f'])
  let g:airline_section_c = airline#section#create(['filetype'])
  let g:airline_section_x = airline#section#create(['%P'])
  let g:airline_section_y = airline#section#create(['%B'])
  let g:airline_section_z = airline#section#create_right(['%l', '%c', '%L'])
endfunction
autocmd VimEnter * call AirlineInit()

""" Neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_or_jump)

""" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
""""""" Syntastic checkers
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_ruby_checkers = ["rubocop"]
