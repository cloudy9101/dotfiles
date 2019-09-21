syntax on
" color dracula
colorscheme onedark
" set background=dark

" set font size
set guifont=Monaco:h14

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" show line number
" set relativenumber
" set invnumber
set number

" search ignore case
set ignorecase

" filetype detect
filetype plugin on

" Source plugins with vundle
if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

" Source key map
if filereadable(expand("~/.vim/map.vim"))
  source ~/.vim/map.vim
endif

" Highlight ExtraWhitespace
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+\%#\@<!$/
:autocmd InsertLeave * redraw!

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" generate random number at end of current line function! s:Rand(max) y a
redir @b
ruby << EOF rmax = VIM::evaluate("a:max") rmax = nil if rmax == "" printf rand(rmax).to_s EOF redir END let @a = strpart(@a, 0, strlen(@a) - 1) let @b = strpart(@b, 1, strlen(@b) - 1) let @c = @a . @b .s/.*/=@c/g endfunction command! -nargs=? Rand :call Rand() nmap :Rand nmap :Rand 100 nmap :Rand 100000
