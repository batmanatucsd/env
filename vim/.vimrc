" Last modified: November 7, 2013
" Sources: http://vim.wikia.com/
"
" **************************************
" * VARIABLES
" **************************************
" Comment out the ones you don't like by putting a " before the line
set nu				" line numbering on
set autoindent			" turns autoindent on
set noerrorbells		" turns off annoying bell sounds for errors
"set visualbell			" screen flashes instead of error bell 
set ignorecase			" search without regards to case
set backspace=2			" backspace over everything
"set confirm			" Shows dialog when exiting without saving
set nowrap			" turns off word wrapping
set fileformats=unix,dos,mac	" open files from mac/dos
set exrc			" open local config files
set nojoinspaces		" don't add white space when I don't tell you to
set showmatch			" show match when inserting {}, [], or ()
set incsearch			" incremental 
set noswapfile			" no intermediate files used when saving
set ruler			" always show position in file
set foldmethod=marker
set hlsearch			" highlight searches
set laststatus=2  " always have status line
set cursorline    " shows the line that the cursor is on
set wildignore=*.o,*.out

"syntax coloring
au BufRead,BufNewFile *.ino set filetype=c

" **************************************
" * OVER 80 CHARS!
" **************************************
" When going over 80 chars, will start highlighting red
"let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"Show 80 Column line 
"if exists('+colorcolumn')
"	set colorcolumn=80
"else
"	au BufWinEnter * let w:m2=matchadd('ErrorMsg','\%>80v.\+',-1) 
"endif

"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/
"highlight ColorColumn ctermbg=22

"let &colorcolumn=join(range(81,999),",")
set colorcolumn=80

" **************************************
" * TABBING
" **************************************
" Check out shortcut section for auto-retabbing shortcut

" expandtab: Expand tabs in the following file extensions to spaces so that 
"            they are spaces instead of tabs
" tabstop: When tab is pressed, inserts 2 spaces instead
" shiftwidth: (with auto-indentation) when indent happens, inserts 2 spaces
"             instead
au BufRead,BufNewFile *.{js,c,h,cpp,hpp,java,ml,py} set expandtab
au BufRead,BufNewFile *.{js,c,h,cpp,hpp,java,ml,py} set tabstop=2
au BufRead,BufNewFile *.{js,c,h,cpp,hpp,java,ml,py} set shiftwidth=2

set tabstop=2
set shiftwidth=2
"set softtabstop=2

"set expandtab
"set tabstop=2
"set shiftwidth=2

" For assembly files, will do special tabbing.  Make them 8 chars wide.
" The following is for assembly file indentation
"au BufRead,BufNewFile *.s set noexpandtab
"au BufRead,BufNewFile *.s set tabstop=8
"au BufRead,BufNewFile *.s set shiftwidth=8


" **************************************
" * AESTHETICS
" **************************************

" There are lots of colorschemes you can use! My personal favorite is 
" desert. You can see all the colors by opening a file and doing
" :colorscheme <CTRL> + <D> and then picking an option.

" :colorscheme birdsofparadise
syntax enable 
set background=dark
"colorscheme northsky

"let g:solarized_termcolors = 256
"colorscheme solarized

"let g:hybrid_use_Xresources = 1
colorscheme hybrid


" if no colorschemes installed, can use the following.
" light: makes font change as if background was light
" dark: makes font change as if background was dark
"
" set bg=light


" syntax off: will turn off syntax highlighting/coloring
"         on: will turn on syntax highlighting/coloring
syntax on

" <Ctrl-l> redraws the screen and removes any search highlighting.
"nnoremap <silent> <C-l> :nohl<CR><C-l>


" **************************************
" * SCREEN 
" **************************************
if match($TERM, "screen")!=-1
  set term=screen-256color
endif


" **************************************
" * Makefile 
" **************************************
map cn <esc>:cn<cr>
map cp <esc>:cp<cr>

" **************************************
" * QUICK SHORTCUTS
" **************************************

" You can add shortcuts of your own similarly.


":inoremap ( ()<Esc>:let leavechar=")"<CR>i
"inoremap { {}<Left>
"inoremap <C-I> <Esc>


" hit F10 while not in insert mode to do a quick write and quit
map <F10> <Esc>:w<CR>
" hit F11 while not in insert mode to quickly retab everything
map <F11> <Esc>gg=G<ESC>:retab<CR>

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <leader>[ <C-w><
map <leader>] <C-w>>
map <leader>- <C-w>-
map <leader>= <C-w>+
map <leader>0 <C-w>=

"inoremap ( ()<Esc>i 
inoremap { {}<Esc>i

" window
nmap <leader>swh :topleft  vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk :topleft  new<CR>
nmap <leader>swj :botright new<CR>

" buffer
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" Bundle Mappings
" NerdTree
map <C-n> :NERDTreeToggle<CR>

" **************************************
" * Vundle Set up
" **************************************
set nocompatible		" get rid of strict vi compatibility
filetype off        " required

"set the runtime path to include Vundle and initalize
set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
call vundle#begin()

" Bundle
"Bundle 'gmarik/vundle'	
"Bundle 'scrooloose/nerdtree.git'
"Bundle 'Buffergator'
"Bundle 'altercation/vim-colors-solarized'

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'
Plugin 'w0ng/vim-hybrid'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
" filetype plugin on



