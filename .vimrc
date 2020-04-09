
source $VIMRUNTIME/mswin.vim
behave mswin

syntax on
set expandtab
set shiftwidth=4
set tabstop=4
set cindent
set hlsearch
" Disable autoindent when pasting text
set paste

inoremap <S-Tab> <C-V><Tab>

if has ('gui_running')
    set guifont=Monospace\ 12
endif

set backspace=2
" == Split config ==
set winheight=30
"set winminheight=1
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" == Tags == 
" search tags file from current dir up to the root dir
set tags=./tags;/
" Ctrl-] - go to definition
" Ctrl-T - jump bach from the definition
" Ctrl-W-Ctrl-] - open the definition in a horisontal split
" Ctrl-\ - open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None
autocmd! bufwritepost .vimrc source %

set nocompatible
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
" == Fugitive ==
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

set showmatch
set laststatus=2
set title
set confirm
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set background=dark
set number
set smartindent
set autoindent
set noswapfile
set dir=~/.vim/swap/
set nobackup
set backupdir=~/.vim/backup/
set mouse=a

set wildmenu
set wcm=<TAB>
set wildmode=list:longest,full

set exrc
set secure

map <F2> :!ls<CR>:e

syntax on

vnoremap <C-c> "*y

set mouse=a

map Q :qa<CR>

nnoremap <silent> . :tabn<CR>
nnoremap <silent> , :tabp<CR>

map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

:set ignorecase
:set smartcase
:set number

:nnoremap <F5> :buffers<CR>:buffer<Space>

set clipboard=unnamedplus

colorscheme ron

set noswapfile


" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

set wildmenu
set wcm=<TAB>
set wildmode=list:longest,full

set exrc
set secure

syntax on

vnoremap <C-c> "*y

nmap <F4> <Esc>:buffers<CR>
vmap <F4> <Esc>:buffers<CR>
imap <F4> <Esc><Esc>:buffers<CR>

map <S-End> :v :$<CR>
nmap <C-S-TAB> :tabprevious<CR>
imap <C-S-TAB> <Esc>:tabprevious<CR>i


map <C-S-TAB> :tabprevious<CR>
nmap <C-S-TAB> :tabprevious<CR>
imap <C-S-TAB> <Esc>:tabprevious<CR>i
map <C-TAB> :tabnext<CR>
nmap <C-TAB> :tabnext<CR>
imap <C-TAB> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>a

"nmap <C-d> :bp|bd #

nnoremap <F3> :set hlsearch!<CR>
"nmap <C-w> :tabclose<CR>
"imap <C-w> <Esc>:tabclose<CR>

" Move tabs with alt + left|right
nnoremap <silent> <C-S-PageUp> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <C-S-PageDown> :execute 'silent! tabmove ' . tabpagenr()<CR>

"nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
map Q :qa<CR>

" Turn off vi compatibility
set nocompatible

"set smartindent
"set autoindent

" load indent file for the current filetype
filetype indent on

function! s:ExecuteInShell(command)
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright new ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

command! T tabnew

set guifont=Monospace
