colorscheme koehler

set clipboard=unnamed
"source $VIMRUNTIME/mswin.vim
behave mswin

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

autocmd FileChangedShell * echohl WarningMsg | echo "File changed shell." | echohl None
autocmd! bufwritepost .vimrc source %

set hlsearch
set nocompatible
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set showcmd
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
"set backupdir=~/.vim/backup/
set mouse=a

set wildmenu
set wcm=<TAB>
set wildmode=list:longest,full

"syntax on

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
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)

command! T tabnew
