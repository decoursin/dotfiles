" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set guicursor=n-v-c:block-Cursor

" Now any plugins you wish to install can be extracted to a subdirectory under ~/.vim/bundle, and they will be added to the 'runtimepath'. 
execute pathogen#infect()
" NICK do this: https://github.com/nelstrom/vim-visual-star-search

"https://github.com/junegunn/vim-plug/
"call plug#begin('~/.vim/plugged')
"
"" list plugins here..
"" Make sure you use single quotes
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/vim-easy-align'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using git URL
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"call plug#end()

"TESTING
"let g:tern_map_keys=1

" Prevents @ symbols from appearing in long lines
set display+=lastline
"-------------------------------- New additions
" Most of these new additions came from here: http://amix.dk/vim/vimrc.html
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" How many lines remain at the top/bottom when scrolling up/down
set so=3
" Fast saving
nmap <leader>w :w!<cr>

" Ignore case when searching
set ignorecase

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions+=T
	set guioptions+=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Opens a new tab with the default directory
"map <leader>tn :tabnew<cr>
map <leader>tn :tabnew<cr>
" Closes the tab
map <leader>cl :close<cr>
" Opens next buffer
map <leader>bn :bnext<cr>
" leader q to open recently used commands 
map <leader>q q:
" leader q to open recently used commands 
map <leader>my :tabedit $MYVIMRC<cr>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Switch CWD to the directory of the open buffer
map <leader>sh :sh<cr>
" Run php on the current file.
"map <leader>p :!php %<cr>
" a.vim. Switch between header file and c/c++ file
map <leader>a :A<cr>

" scp to school computer current file
map <leader>scp :!scp <c-r>=expand("%:p")<cr> deco0072@remote06.cselabs.umn.edu:~/

" Git
" Git difftool current file
map <leader>gd :!git difftool HEAD^ <c-r>=expand("%:p")<cr>

" diff this
" Windows
"map <leader>dt :!START /B gvimdiff % 
" Linux
map <leader>dt :!gvimdiff % <c-r>=expand("%:p:h")<cr>/

"""""""""""""""""""""" Node
map <leader>ne :r ~/Scripts/express_server<cr>

nmap gf <C-w>gf
nmap gt <C-w>gf
map <leader>f :tabfind 

set path=$PWD/**
" Reloads the file (useful when editing .vimrc)
" This didn't work
"so %

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif
" Remember info about open buffers on close
set viminfo^=%

" Always show the status line
set laststatus=2

" Distraction-free writing in Vim.
" :Goyo

"-------------------------- Linux specific
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %<CR>

" Set backups directions
"set backup
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp

" This only works on Linux
" Suppose to automatically reload .vimrc files when edited
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set clipboard=unnamedplus
"--------------------------------------------------------- ND addition

" Always show current position
set ruler

" Set stamping. With this you replace the current word with the last yanked or deleted text. Put the deletion in the black hole register.
" Note. This replaces S which is the equivalent of cc.
noremap S "_diwP
vnoremap S "_dP

" Set x delete to not use the default register
noremap x "_x

" Paste into visual mode without updating the default register
vnoremap p "_dP

set tabstop=4
set shiftwidth=4

" I believe this lets you changes buffers without having to change
set hidden

colorscheme 256-jungle
" Colorscheme for clear text
"colorscheme candycode

" Mapping for compiling and running a C program file
" This is set in ftplugin now at <F4>
" map <F8> :!gcc % && ./a.out <CR>

" This maps the JSBeautify plugin function to F2. Beware
" this was causing problems for me when using within .html files.
" This command in no longer userful
" map <F2> :call JsBeautify()<cr>

" This maps the tidy function to F5. The tidy funciton is located
" in /usr/bin and it cleans html/javascript code.
" This is now set in ftplugin/html.vim js.vim
" map <F5> :%!tidy -q -i -f /var/www/blah.txt -config ~/.config/tidy/tidy.conf<CR>

" The Vim distribution comes with a set of plugins for different filetypes that
" The scripts in $VIMRUNTIME/macros are global ones, the filetype
" plugins are in $VIMRUNTIME/ftplugin.
filetype plugin on

" When searching try to be smart about cases 
set smartcase

" Cycle between tabs
map <F9>  :tabp<CR>
map <F10> :tabn<CR>
map <F12> :Sex<CR>
map <S-F12> :Vex<CR>

" That means that on first <Tab> it will complete to the longest common string and will invoke wildmenu (an horizontal and unobstructive little menu). On next <Tab> it will complete the first altenative and the will start to cycle through the rest. You can go back and forth with <Tab> and <S-Tab> respectively.
set wildmenu
set wildmode=longest:full,full

"----------- Syntastic Stuff
"
" For the Vim Syntastic Plugin
" Opens and closes the Error Window
" ***This is done by seeing whether number of windows shown has changed:
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction

map <F5> :call ToggleErrors()<CR>
map <F6> :SyntasticToggleMode<CR>

" Normally syntastic runs syntax checks whenever buffers are written to disk.
" If you want to skip these checks when you issue |:wq|, |:x|, and |:ZZ|, set this variable to 0. 
    let g:syntastic_check_on_wq = 0
    let g:syntastic_enable_highlighting = 1
	let g:syntastic_javascript_checkers = ['jsxhint']
	" C++ syntax check the latest version stuff like C++11
	let g:syntastic_cpp_compiler_options = 'std=c++0x'
	
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep 700 lines of command line history
set history=700		

" Makes search act like search in modern browsers
set incsearch		

"-------------------------------- Default

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"if has("vms")
" set nobackup		" do not keep a backup file, use versions instead
" else
"  set backup		" keep a backup file
"  endif
set showcmd		" display incomplete commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Specific vimdiff configurations
func DiffSetup()
  " Make a full screen top-level-window with all sub-window equal-size
  " winpos 0 25
  winpos 0 0
  " winpos 0 35


  " up down next diff
  nmap <F5> ]c
  nmap <F6> [c
  " Big work monitor size
  " set columns=195
  " set lines=70

  " scolloff makes the diff funny.  turn it off
  set scrolloff=0

  " Work monitor size
  " set columns=176
  " set lines=75

  " Home monitor size
  " set columns=172
  " set lines=62

  wincmd =
  " colorscheme default
  " colorscheme peaksea
  " set guibg=dark
  highlight DiffAdd    cterm=bold ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffDelete cterm=bold ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffChange cterm=bold ctermbg=17 gui=none guifg=bg guibg=Red
  highlight DiffText   cterm=bold ctermbg=88 gui=none guifg=bg guibg=Red
  highlight Normal guifg=lightsteelblue guibg=black

  " nmap only works in normal mode
  " moves to the next diff.
  nmap <leader>f ]c
  nmap <leader>b [c
  " I don't know what this does
  nmap s :set diffopt=filler,iwhite<CR>

  " set all diff windows to use the one true filetype, if we found one
"  if ok && ft != ''
"    let w = 1
"    while w <= wincount
"      if getwinvar(w, '&diff')
"        call setbufvar(winbufnr(w), '&filetype', ft)
"      endif
"      let w = w + 1
"    endwhile
"  endif
  syntax on

  set mousehide                " Turn off mouse when typing
  set guioptions+=T            " Add toolbar
  set guioptions+=c            " Use console dialogs when possible
  set guioptions-=r            " Remove right hand scrollbar
  set guioptions-=L            " Remove left-hand scrollbar (for v-split)
  set visualbell t_vb=         " Turn off flashing (needs to be in gvimrc too)

  " Change the color of the cursor in diff mode
  " http://stackoverflow.com/questions/6158860/change-color-of-cursor-in-vim
" highlight Cursor guibg=yellow
" au * hi Cursor guibg=yellow

" This guicursor stuff below needs to be set in .gvimrc.
" Configure the cursor: http://vim.wikia.com/wiki/Configuring_the_cursor
" highlight Cursor guifg=white guibg=black
" highlight iCursor guifg=white guibg=steelblue
" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0   " turn off cursor blinking
" set guicursor+=i:blinkwait10

endfun


" kjm - try vim with the DiffSetup() for now
 if &diff
   autocmd VimEnter * call DiffSetup()
 endif


" ND - I can probably delete this.
" set the size for win32
"
" if ! has("unix")
"    set lines=42
"    set columns=80
"    set guifont=Courier_New:h8
" else
   " set guifont=-schumacher-clean-medium-r-normal-*-*-120-*-*-c-*-iso646.1991-irv
   " set guifont=fixed
   " Work 
   " set guifont=-monotype-andale\ mono-medium-r-normal-*-*-80-*-*-m-*-iso8859-1
   " GTK-2 has a new font-name style
   " set guifont=Andale\ Mono\ 8
   " set guifont=Andale\ Mono\ 10
   " set guifont=Terminus\ 8
   " set guifont=Terminus\ 10
