syntax enable
set background=dark
colorscheme solarized

" set font size
set guifont=Monaco:h14

" Use spaces instead of tabs
set expandtab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" show line number
set relativenumber
set invnumber

" search ignore case
set ignorecase

" filetype detect
filetype plugin on

" Source plugins with vundle
if filereadable(expand("~/dotfiles/vim/plugins.vim"))
  source ~/dotfiles/vim/plugins.vim
endif

" Source key map
source ~/dotfiles/vim/map.vim

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

" corrent cursor shape
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
