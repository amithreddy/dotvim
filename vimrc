" These calls to pathogen must be at the top of vimrc file
set nocp
execute pathogen#infect('~/.vim/bundle/{}')
syntax on
filetype plugin indent on
set sessionoptions-=options

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" The following jump Vim to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Have vim recognize JSON as a filetype
autocmd BufNewFile,BufRead *.json set filetype=json

" Tab Space for different filetypes
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
set autoindent

"show line numbers
set number

"highlight line number in grey
:highlight LineNr ctermfg=grey

"Map F4 to write to disk
:imap <F4> <ESC>:w <CR>
:map <F4> <ESC>:w <CR>

"Run the file with python
:map <F5> :! python %<CR>

" Syntastic
let g:syntastic_JSON_checkers= ['jsonlint']
