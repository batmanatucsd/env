"=============================================================================

" Last modified: Nov 11, 2015
" Author: James A. Lee
"
" Sections:
" 	=> Settings
" 	=> Tabs
" 	=> Aesthetic
" 	=> Mapping
" 	=> Plugin_Settings
" 	=> Plugins
"
"=============================================================================

" => Settings "{{{
" *****************************************************************************
" *****************************  SETTINGS  ************************************
" *****************************************************************************
"
" -----------------------------------------------------------------------------
" * VARIABLES
" -----------------------------------------------------------------------------
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
"set foldmethod=manual
set hlsearch			" highlight searches
set laststatus=2  " always have status line
set cursorline    " shows the line that the cursor is on
set wildignore=*.o,*.out
set smartcase
set tags=.tags " set ctags file
set t_Co=256 " set terminal color
set t_ut=

" Set up GDB
if(has("gdb"))
	set previewheight=12
	set splitbelow
	set splitright
	run macros/gdb_mappings.vim
	set gdbprg=/usr/local/bin/gdb
endif
"set gdbvariables="gdb-variables"
" set the path
"let $PATH = '/usr/local/bin:'.$PATH

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic
" filetype specific completion

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
"set wrap "Wrap lines

" No annoying sound on errors
set noerrorbells
set novisualbell
set noeb vb t_vb=
set tm=500

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" syntax coloring
au BufRead,BufNewFile *.ino set filetype=c " for arduino
au FileType javascipt call JavaScriptFold()

"set omnifunc=syntaxcomplete#Complete

"set statusline+=%warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Saving and Loading fold views when closing and opening vim
" useful when doing fold in manual mode
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

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
let &colorcolumn="80,".join(range(500,999),",")
"}}}

" => Tabs "{{{
" *****************************************************************************
" *****************************  TABBING  *************************************
" *****************************************************************************
" Check out shortcut section for auto-retabbing shortcut

" expandtab: Expand tabs in the following file extensions to spaces so that
"            they are spaces instead of tabs
" tabstop: When tab is pressed, inserts 2 spaces instead
" shiftwidth: (with auto-indentation) when indent happens, inserts 2 spaces
"             instead
au BufRead,BufNewFile *.{js,c,h,cpp,hpp,java,ml,py,html} set expandtab
au BufRead,BufNewFile *.{js,c,h,cpp,hpp,java,ml,py,html} set tabstop=4
au BufRead,BufNewFile *.{js,c,h,cpp,hpp,java,ml,py,html} set shiftwidth=4

set tabstop=4
set shiftwidth=4
"set softtabstop=2

"set expandtab
"set tabstop=2
"set shiftwidth=2

" For assembly files, will do special tabbing.  Make them 8 chars wide.
" The following is for assembly file indentation
"au BufRead,BufNewFile *.s set noexpandtab
"au BufRead,BufNewFile *.s set tabstop=8
"au BufRead,BufNewFile *.s set shiftwidth=8"}}}

" => Aesthetic "{{{
" *****************************************************************************
" *****************************  AESTHETIC  ***********************************
" *****************************************************************************

" -----------------------------------------------------------------------------
" * COLORSCHEME
" -----------------------------------------------------------------------------
" There are lots of colorschemes you can use! My personal favorite is
" desert. You can see all the colors by opening a file and doing
" :colorscheme <CTRL> + <D> and then picking an option.

" :colorscheme birdsofparadise
syntax enable
"colorscheme northsky

"let g:solarized_termcolors = 256
"colorscheme solarized

"let g:hybrid_use_Xresources = 1
try
"colorscheme hybrid
set background=dark
colorscheme molokai
colorscheme Tomorrow-Night-Eighties
catch
echo "no molokai"
endtry

" if no colorschemes installed, can use the following.
" light: makes font change as if background was light
" dark: makes font change as if background was dark
" set bg=light

" syntax off: will turn off syntax highlighting/coloring
"         on: will turn on syntax highlighting/coloring
syntax on

" colors
hi Search          ctermfg=15 ctermbg=9
hi Visual          ctermbg=236
hi Normal          ctermfg=7
hi Comment         ctermfg=8
hi ColorColumn     ctermbg=235
hi LineNr          ctermfg=white ctermbg=237
hi CursorLineNr    ctermfg=9


"hi Function        ctermfg=31
hi Function        ctermfg=81

" incdlue
hi PreProc         ctermfg=1
" ifdef
hi PreCondit       ctermfg=83               cterm=bold

hi Typedef         ctermfg=9
hi Type            ctermfg=9                cterm=none
" define
hi Macro           ctermfg=31
hi SpecialKey      ctermfg=81
"hi SpecialKey      ctermfg=81
"hi Macro           ctermfg=71

hi Directory       ctermfg=83               cterm=bold

hi FoldColumn      ctermfg=67  ctermbg=233
hi Folded          ctermfg=67  ctermbg=233

" -----------------------------------------------------------------------------
" * SCREEN
" -----------------------------------------------------------------------------
if match($TERM, "screen")!=-1
  "set term=screen-256color
	set term=xterm
endif
"}}}

" => Plugin_Settings "{{{
" *****************************************************************************
" ************************* Plugin_Settings ***********************************
" *****************************************************************************

" -----------------------------------------------------------------------------
" // syntastic settings
" -----------------------------------------------------------------------------
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_loc_list_height = 3
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"if($STM32 == 1)
  "let g:syntastic_c_checkers = ['make']
"endif

" examples
"if(stridx(expand("%:p:h"), "/Users/batman/Projects/Micromouse/Code/src/") == 0 || stridx(expand("%:p:h"), "~/Projects/Micromouse/Code/src/") == 0)
"  let b:syntastic_checkers = ['make']
"endif
"let g:syntastic_c_config_file = '.syntastic_c_config'
"let g:syntastic_c_include_dirs = ['~/uMouse/Code/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/']
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_c_no_default_include_dirs = 1
"let g:syntastic_c_check_header = 1
"let g:syntastic_c_auto_refresh_includes = 0

" -----------------------------------------------------------------------------
" // neocomplcache settings
" -----------------------------------------------------------------------------
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3

" -----------------------------------------------------------------------------
" // youcompleteme settings
" -----------------------------------------------------------------------------
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]
"let g:ycm_global_ycm_extr_conf = "~/.ycm_extra_conf.py"
"let g:ycm_register_as_syntastic_checker = 0


" -----------------------------------------------------------------------------
" // airline settings
" -----------------------------------------------------------------------------
"let g:airline#extension#batline#enabled = 1

" -----------------------------------------------------------------------------
" // nerdtree settings
" -----------------------------------------------------------------------------
let nerdtreedirarrows=0

" // indentline settings
let g:indentLine_color_term = 239
"let g:indentLine_char = '|'

" // EasyMotion Settings
let g:EasyMotion_smartcase = 1

" -----------------------------------------------------------------------------
" // neocomplete settings
" -----------------------------------------------------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" -----------------------------------------------------------------------------
" // ultisnips settings
" -----------------------------------------------------------------------------
let g:ultisnipsexpandtrigger="<tab>"
let g:ultisnipseditsplit="vertical"
" -----------------------------------------------------------------------------
" // utisnip settings
" -----------------------------------------------------------------------------
"let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsListSnippets="<C-e>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

" => Mapping "{{{
" *****************************************************************************
" ******************************  MAPPING  ************************************
" *****************************************************************************

" -----------------------------------------------------------------------------
" * Makefile
" -----------------------------------------------------------------------------
" quicklist // for error checking
nnoremap cn :cn<CR>
nnoremap cp :cp<CR>

" save and make
nnoremap <leader>w :w<CR>
nnoremap <leader>q :wq<CR>

" gdb
nnoremap <leader>g :call gdb("")<Left><Left>

" fold
nnoremap <SPACE> za

" -> Function Keys "{{{
" -----------------------------------------------------------------------------
"  Function Keys
" -----------------------------------------------------------------------------
let hlstate=0
let locationlist=1

" <F1>
nnoremap <silent> <F1> :NumbersToggle<CR> :set nu<CR>
" <F2>
nnoremap <F2> :wa<CR>:make<SPACE>
" <F3>
nnoremap <silent> <F3> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
"<F5>
"nnoremap <silent> <F5> :if (locationlist%2 == 0) \| lclose <cr> lclose \| else \| lopen3 \| endif \| let locationlist=locationlist+1<cr>
" <F7>
" used for gdb macros
" <F8>
nnoremap <silent> <F8> :bel 30vsp gdb-variables<CR>

" hit F10 while not in insert mode to do a quick write and quit
"map <F10> <Esc>:w<CR>
" hit F11 while not in insert mode to quickly retab everything
"map <F11> <Esc>gg=G<ESC>:retab<CR>
"}}}
" -> Nagivation "{{{
" -----------------------------------------------------------------------------
"  Navigation
" -----------------------------------------------------------------------------
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l
"}}}
" -> Insert Mode "{{{
" -----------------------------------------------------------------------------
"  Insert Mode
" -----------------------------------------------------------------------------
" Pairs
imap { {<Cr><Cr>}<Up><Tab>
imap [ []<Left>
imap ( ()<Left>
imap [] []
imap {} {}<Left>
imap () ()

" Navigation
imap <C-l> <Right>
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-x> <C-o>x

" -> Windows
nmap <leader>swh :topleft  vnew<CR>
nmap <leader>swl :botright vnew<CR>
nmap <leader>swk :topleft  new<CR>
nmap <leader>swj :botright new<CR>

" windo size
map <leader>[ <C-w><
map <leader>] <C-w>>
map <leader>- <C-w>-
map <leader>= <C-w>+
map <leader>0 <C-w>=
"}}}
" -> Tabs "{{{
" -----------------------------------------------------------------------------
"  Tabs
" -----------------------------------------------------------------------------
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/
map <leader>te :tabe<Space>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>tm :tabmove
map <leader>tq :tabclose<CR>

" -> Buffers
" opening new buffers
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>

" toggle between last buffer
nmap <Leader>l :b#<CR>

" close current buffer
nmap <leader>x :q<CR>

" delete current buffer
nmap <leader>d :bd<CR>
"}}}
" -> Plugin Mappings "{{{
" -----------------------------------------------------------------------------
"  Plugin Mappings
" -----------------------------------------------------------------------------
" //  NerdTree
map <C-n> :NERDTreeToggle<CR>
map <leader>nb <C-n>B
map <leader>nf :NERDTreeFind<CR>

" // ctags
nnoremap <leader>c :!ctags -R -f ./.tags .<CR>

" // CtrlP
nnoremap <leader>, :CtrlPTag<cr>

" // Tagbar
nnoremap <silent> <leader>f :TagbarToggle<cr>

" // EasyMotion Settings
"nmap s <Plug>(easymotion-s)
"omap t <Plug>(easymotion-bd-tl)
"map / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map n <Plug>(easymotion-next)
"map N <Plug>(easymotion-prev)
map <Leader><Leader><Space> <Plug>(easymotion-sn)
map <Leader><Leader><Space> <Plug>(easymotion-tn)

" // Numbers
nmap <C-c> <C-c><F3>

" // neocomplete
" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#mappings()
"inoremap <expr><C-l> <Right>
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return (pumvisible()) ? "\<C-y>" : "" ) . "\<CR>"
		"" For no inserting <CR> key.
		""   "return pumvisible() ? "\<C-y>" : "\<CR>"
  "endfunction

"   " <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-z> neocomplete#smart_close_popup().""

"   " Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<Space>" : "\<Space>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"}}}
"}}}

" => Functions "{{{
" *****************************************************************************
" ****************************  Functions  ************************************
" *****************************************************************************
function! Example()
endfunction
"}}}

" => Plugins "{{{
" *****************************************************************************
" *****************************  PLUGINS  *************************************
" *****************************************************************************

" -----------------------------------------------------------------------------
" * Vundle Set up
" -----------------------------------------------------------------------------
set nocompatible		" get rid of strict vi compatibility
filetype off        " required

"set the runtime path to include Vundle and initalize
set rtp+=~/.vim/bundle/Vundle.vim/
"call vundle#rc()
call vundle#begin()

" -----------------------------------------------------------------------------
" * Plugins
" -----------------------------------------------------------------------------
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin 'Buffergator'

Plugin 'ctrlp.vim'

Plugin 'Tagbar'
Plugin 'The-NERD-Commenter'
Plugin 'fugitive.vim'
Plugin 'surround.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-unimpaired'
Plugin 'bling/vim-airline'
Plugin 'myusuf3/numbers.vim'
Plugin 'Yggdroot/indentLine'

Plugin 'justinmk/vim-syntax-extra'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Shougo/neocomplete.vim'

"Plugin 'Syntastic'
"Plugin 'Valloric/YouCompleteMe.git'
"Plugin 'Shougo/neocomplcache'

" Colorschemes
Plugin 'w0ng/vim-hybrid'
Plugin 'molokai'
Plugin 'chriskempson/vim-tomorrow-theme'

" Syntax color
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'Solarized'
" edkolev/tmuxline.vim

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"}}}

