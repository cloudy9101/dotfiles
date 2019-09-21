let mapleader=","
set timeout timeoutlen=1500

" jj to esc
inoremap jj <esc>

" quick move other panel
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" move to git hunk
nmap ;j <Plug>GitGutterNextHunk
nmap ;k <Plug>GitGutterPrevHunk

" switch tab
nnoremap <TAB><TAB> :tabnext<CR>

" ctrlp with fzf
" C-T C-X C-V open file or buffer in new tab, split, vertical split
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-m> :BTags<CR>
nnoremap <C-e> :Windows<CR>

" CtrlSF with fzf and ag
noremap <C-F> :Ag<space>

" F2 to toggle paste mode
set pastetoggle=<F2>

nnoremap <Leader>d :ALEGoToDefinitionInSplit<CR>
nnoremap <Leader>r :ALEFindReferences<CR>
nnoremap <Leader>e :ALEDetail<CR>
