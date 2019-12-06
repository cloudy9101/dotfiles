set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-scripts/wombat256.vim'

" Put the plugins here
Plug 'mattn/emmet-vim' " Emmet snippet for html
Plug 'ddollar/nerdcommenter' " Smart code comment
Plug 'tpope/vim-fugitive' " Gblame etc
Plug 'airblade/vim-gitgutter' " Show file changes with git ~ + -
Plug 'tpope/vim-endwise' " Smart auto end
Plug 'jiangmiao/auto-pairs' " Smart ()[]{}...
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } " Fzf a fuzzy finder
Plug 'junegunn/fzf.vim' " Integrate fzf with vim
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" programming lang support
Plug 'elixir-lang/vim-elixir'
Plug 'kchmck/vim-coffee-script'
Plug 'slim-template/vim-slim'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Initialize plugin system
call plug#end()

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
      \ 'colorscheme': 'palenight',
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
