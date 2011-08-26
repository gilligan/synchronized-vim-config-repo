
" -------------------------------------------------------------------
" 
" global settings
" 
" -------------------------------------------------------------------
"

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

syntax on
filetype plugin on
filetype indent on

autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /

let g:SuperTabDefaultCompletionTypeDiscovery = ["&completefunc:<c-x><c-u>","&omnifunc:<c-x><c-o>",]
let g:SuperTabNoCompleteAfter = ['\s']
let g:SuperTabLongestHighlight = 1

if has("macunix")
    if has("gui")
        set autochdir
    endif
endif

if has("linux")
    set autochdir
endif

set tags=./tags;
set nu!
set cmdheight=2
set wmh=0
set nocp
set path+=.,/usr/share/qt4/include/**
set inc=^\\s*\\%(#\\s*include\\\\|\\.INCLUDE\\)\\s\\+
set expandtab
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
set laststatus=2
set background=light
set incsearch
set nohlsearch
set grepprg=grep\ -nH\ $*
set backspace=indent,eol,start
set sw=4
set sm
set cindent
set autoindent
set viminfo=%,!,'50,\"100,:100,n~/.viminfo
set showcmd
set incsearch
set hlsearch
set nohidden
set noerrorbells
set visualbell
set t_vb=

set guioptions-=r
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L

set nobackup
set noswapfile

" -------------------------------------------------------------------
"
" plugin settings
"
" -------------------------------------------------------------------

let OmniCpp_ShowPrototypeInAbbr=1
let TList_Process_File_Always=1
let TList_Display_Prototype=1

" slimv settings
"
let g:slimv_keybindings=1
let g:paredit_mode=0
let g:slimv_impl='sbcl'
let g:lisp_rainbow=1


" -------------------------------------------------------------------
" 
" abbrevations 
" 
" -------------------------------------------------------------------

iab Ydate	<C-R>=strftime("%y%m%d")<CR>
iab Ydated	<C-R>=strftime("%Y-%m-%d")<CR>
iab Ydatel	<C-R>=strftime("%a %b %d %T %Z %Y")<CR>
iab Ydatetime	<C-R>=strftime("%y%m%d %T")<CR>
iab Ytime	<C-R>=strftime("%H:%M")<CR>

" -------------------------------------------------------------------
" 
" mappings 
" 
" -------------------------------------------------------------------

" use jj to escape
inoremap jj <Esc>

" maximize window
map ,M <C-W>_   

" go to start/end of line
imap <C-E> <C-O>$
imap <C-A> <C-O>0

" use arrow keys for window navigation
map <C-Up>   <C-W>k<C-W>_ 
map <C-Down> <C-W>j<C-W>_
map <C-Left> <C-W>h<C-W>_
map <C-Right> <C-W>l<C-W>_

" shortcut for formatting paragraph
map	<C-J>	gqap
imap	<C-J>	<C-O>gqap
vmap	<C-J>	gq

" quick save
map <C-s> execute :w<CR>

" shortcut to yank current line in normal mode
nmap yl y1$

"indent whole buffer
map <C-i> mA1=G'A

" close current buffer
map ,b :bd<CR>

" paste clipboard contents
map ,p "*p

" open file explorer in current buffer
map ,e :Exp<CR>

" open file explorer in split window
map ,es :Sexp<CR>

" open specified file in path
map ,of :find<space>  

" jump to previous/next vimgrep match
map ,gp :cnext<CR>
map ,gn :cnext<CR>

" latex mappings:
map ,vt :silent !evince %:r.pdf<CR>
map ,ct :!pdflatex %<CR>

" snes help mappings:
nmap  ,fr :execute 'help ' . expand('<cword>')<CR>
nmap  ,q  :bd<CR>

" parenthize word with " "
map	,,	    maa0<ESC>mbbma$a x<ESC>`awgebi"<ESC>ea"<ESC>$xx`blx`a

" add doxygen comment template
map ,dx :Dox<CR>

" indentation of { } block
nmap \id =%


" open Explorer on <F2>
imap <F2> <ESC>:Exp<CR>
nmap <F2> :Exp<CR>

" write buffer and compile
imap <F3> <ESC>:sp\|make<CR>
nmap <F3> :sp\|make<CR>

" split new window
imap <F4> <ESC>:new<CR>i
nmap <F4> :new<CR>

" enable/disable US spelling
map <F5> :setlocal spell! spelllang=en_us,de<cr>

" create tag file
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iafS --extra=+q .<CR>

"command to close a buffer but keep the window/split as it was
com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
map ,kb :Kwbd<CR>

map ,r :!ruby1.9 %<CR>

"call make
"map <C-m> :!make<CR>

"alter the errorformat slightly so the error
"highlightning plugin can differentiate between 
"warnings and errors
let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat 

"source ~/.vim/misc-functions.vim
"source ~/.vim/snes.vim
