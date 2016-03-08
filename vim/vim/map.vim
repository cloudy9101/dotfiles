" set <Leader> to ','
let mapleader=","
set timeout timeoutlen=1500

" toggle line number
nmap <C-N><C-N> :set invnumber<CR>

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

" map for ctrlP and ctrl shift f and ctrl b
" nnoremap <C-p> :<C-u>Unite -start-insert -prompt-direction=top file_rec/async<CR>
" nnoremap <C-b> :<C-u>Unite -start-insert -prompt-direction=top buffer<CR>
nnoremap <D-F> :<C-u>Unite -start-insert -prompt-direction=top grep:.<CR>

" switch tab
nnoremap <TAB><TAB> :tabnext<CR>

" dash search
nmap <silent><leader>d <Plug>DashSearch

" ctrlp
nnoremap <C-p> :Ctrlp<CR>
nnoremap <C-b> :CtrlPMixed<CR>

" markdown preview
nnoremap <leader>p :MarkdownPreview<CR>
nnoremap <leader>sp :MarkdownPreviewStop<CR>
