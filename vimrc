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
  if(&relativenumber == 1)
  set norelativenumber
  set number
  else
  set nonumber
  set relativenumber
  set number
  endif
endfunction
call NumberToggle()

nnoremap <C-n> :call NumberToggle()<Enter>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd CursorMoved * :set relativenumber

" persistent undo
set undodir=~/.vim/undodir
set undofile 
set undolevels=1000

" autoread and autosave 
set autoread
set autowrite
set autowriteall 
set updatetime=100
autocmd CursorHold,CursorHoldI <buffer> silent update "update during inactivity

" remap esc to jj in insert mode
inoremap ww <ESC>

" remap ; to ;
nnoremap ; :

" Map <F5> to Run the file with python
autocmd FileType python map <F5> :! python %<CR>

" Map za to space
autocmd FileType python noremap <Space> za


" Color Scheme
set t_Co=256
hi Normal ctermfg=007
hi Statement term=bold ctermfg=130
hi LineNr ctermfg=238 ctermbg=233

hi CursorLineNr ctermfg=238
hi CursorLine term=none cterm=none ctermbg=233 

hi Comment term=bold ctermfg=24
hi Folded term=standout ctermfg=242 ctermbg=None
hi String ctermfg=240 ctermbg=None
hi Define term=Underline ctermfg=008
hi link Function Define

" current line is underlined
set cursorline

" Syntastic Config
let g:syntastic_JSON_checkers= ['jsonlint']
let g:syntastic_scss_checkrs= ['sass']
