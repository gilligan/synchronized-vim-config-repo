
" -------------------------------------------------------------------
" 
" global settings
" 
" -------------------------------------------------------------------
"

call pathogen#infect()

syntax on
filetype plugin on
filetype indent on

"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
autocmd BufReadPost * 
            \ if line("'\"") > 0 && line("'\"") <= line("$") | 
            \   exe "normal g`\"" | 
            \ endif 


" -------------------------------------
" super tab plugin settings
" -------------------------------------
set completeopt=menu,preview,longest
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabNoCompleteAfter = ['\s']
let g:SuperTabLongestEnhanced = 1

set autochdir

    if has("gui")
        "set guifont=Inconsolata:h14
        set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 10
        let g:Powerline_symbols = 'fancy'
    endif

"if has("linux")
"set autochdir
"endif

set ambiwidth=double
set scrolloff=3
set gdefault
set ignorecase
set smartcase
set ruler
set cursorline
set tags=./tags;
set nu
set cmdheight=2
set wmh=0
set nocp
set path+=.,/usr/share/qt4/include/**
set inc=^\\s*\\%(#\\s*include\\\\|\\.INCLUDE\\)\\s\\+
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
set t_vb=

set guioptions-=r
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L

set nobackup
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" -------------------------------------------------------------------
"
" plugin settings
"
" -------------------------------------------------------------------

" clojure settings
"
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let vimclojure#NailgunClient = "/usr/local/bin/ng"
let vimclojure#WantNailgun = 1

" syntastic settings
"
let g:syntastic_javascript_checker="jshint"

" SingleCompile settings
"

nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

let OmniCpp_ShowPrototypeInAbbr=1
let TList_Process_File_Always=1
let TList_Display_Prototype=1
let Tlist_Show_One_File=1

" slimv settings
"
let g:slimv_keybindings=1
let g:paredit_mode=0
let g:slimv_impl='sbcl'
let g:slimv_ctags='/usr/local/bin/ctags'
let g:lisp_rainbow=1

" powerline settings
"let g:cfi_disable=1

" ctrlp setings
"
let g:ctrlp_working_path_mode = 2
let g:ctrlp_root_markers = ['Development/','.project', '.root_dir']
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.project$\|\.metadata$\|\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$|\.dylib$',
  \ }

" -------------------------------------------------------------------
" 
" abbrevations 
" 
" -------------------------------------------------------------------

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

"call MakeSpacelessIabbrev('"a', 'ä')
"call MakeSpacelessIabbrev('"A', 'Ä')
"call MakeSpacelessIabbrev('"o', 'ö')
"call MakeSpacelessIabbrev('"O', 'Ö')
"call MakeSpacelessIabbrev('"u', 'ü')
"call MakeSpacelessIabbrev('"U', 'Ü')
"call MakeSpacelessIabbrev('"s', 'ß')

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

"if has("gui_macvim")
"macmenu &File.New\ Tab key=<nop>
"map <D-t> :CommandT<CR>
"endif

imap <c-g> <esc>:tag 

nmap <leader>gt :call TimeLapse()<cr>  

nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>rt :CommandTFlush<cr>
nnoremap <leader><space> :noh<cr>

" use \r to run ruby code
nmap \r :rubyf %:p<CR>    
let g:rct_completion_use_fri = 1

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
"map <C-s> execute :w<CR>

" shortcut to yank current line in normal mode
nmap yl y1$

"indent whole buffer
map <C-i> mA1=G'A

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

imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s

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
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iafS --extra=+qf .<CR>

"command to close a buffer but keep the window/split as it was
com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn
map ,kb :Kwbd<CR>

map ,r :rubyf %<CR>

" move up one line
" and insert new indented line
" below with Command-k
imap <D-k> <ESC>ko 

" insert empty line and
" return to normal mode
map <C-b> <ESC>o<ESC>

set winminheight=0
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
"call make
"map <C-m> :!make<CR>

" move line down
noremap \j :m+<CR>
" move line down
noremap \k :m-2<CR>

" list lines containing
" word under cursor
map ,l [I:let nr = input("select: ")<Bar>exe "normal " . nr ."[\t"<CR>

"alter the errorformat slightly so the error
"highlightning plugin can differentiate between 
"warnings and errors
let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat 

"autocmd FileType ruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby let g:rubycomplete_buffer_loading=1
"autocmd FileType ruby let g:rubycomplete_classes_in_global=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

if has("python")
    command! -nargs=+ Calc :py print <args>
    py from math import *
endif

if has("autocmd")
    autocmd Filetype java call SuperTabSetDefaultCompletionType("<c-x><c-u>")
endif

" automatically source vimrc after writing to it
au BufWritePost .vimrc so ~/.vimrc

" use ; to enter command mode
nnoremap ; :

" resize splits when window is resized
au VimResized * exe "normal! \<c-w>="

augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

"if has("autocmd")
"    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
"endif


"source ~/.vim/misc-functions.vim
"source ~/.vim/snes.vim
