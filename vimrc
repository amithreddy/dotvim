" These calls to pathogen must be at the top of vimrc file
set nocp
execute pathogen#infect('~/.vim/bundle/{}')
syntax on
filetype plugin indent on
" don't know what sessionoptions does
set sessionoptions-=options

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters

" The following jump Vim to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" MSC
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set mouse=a		" Enable mouse usage (all modes)
set showmode		" show insert,visiual mode 

" Search settings 
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned

" Backspace deletes over line breaks. Like most other apps
set backspace=2 

" Have vim recognize JSON as a filetype
autocmd BufNewFile,BufRead *.json set filetype=json

" Default tabkey behaviour
set autoindent
set smartindent
set smarttab

" Tab Space for different filetypes
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Toggle between relative and absolute line numbers
function! NumberToggle()
  if(&number == 1)
    set relativenumber
  else
    set number
  endif
endfunc
call NumberToggle()

nnoremap <C-n> :call NumberToggle()<cr>
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" save all open buffers when focus is lost
au FocusLost * :wa

" Highlight line number in grey
highlight LineNr ctermfg=grey

" remap esc to jj in insert mode
inoremap nn <ESC>

" remap ; to ;
nnoremap ; :

" Map <F4> to write to disk
:imap <F4> <ESC>:w <CR>
:map <F4> <ESC>:w <CR>

" Map <F5> to Run the file with python
:map <F5> :! python %<CR>

" Syntastic Config
let g:syntastic_JSON_checkers= ['jsonlint']
let g:syntastic_scss_checkrs= ['sass']
