"
" Nick DeCoursin
"
" Some credit to:
" 	- http://amix.dk/vim/vimrc.html
" 	- http://nvie.com/posts/how-i-boosted-my-vim/
"

" set nocompatible must be (like) first because it changes other options as a side effect.
set nocompatible

" Put Plugins in a subdirectory under ~/.vim/bundle, and they will be added to the 'runtimepath'. 
execute pathogen#infect()

"""" TESTING
"let g:tern_map_keys=1
" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap
"""" _END TESTING

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions+=T
	set guioptions+=e
	set t_Co=256 " 256 colors
	set guitablabel=%M\ %t
endif

" Only run if Vim supports atleast 256 colors
if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

filetype plugin on
filetype indent on

"" Default colorscheme
" colorscheme mustang
colorscheme 256-jungle
" Colorscheme for clear text
"colorscheme candycode

" NICK do I want this?
autocmd FileType text setlocal textwidth=78

"""""""""""""""""""""""" set stuff

set guicursor=n-v-c:block-Cursor
set display+=lastline "Prevents @ symbols from appearing in long lines
set hlsearch " highlight all search pattern matches
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=700	" keep 700 lines of command line history	
set incsearch " Makes search act like search in modern browsers	
set smartcase " When searching try to be smart about cases 
set so=3 " How many lines remain at the top/bottom when scrolling up/down
set ignorecase " Ignore case when searching
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set encoding=utf8
set path=$PWD/**
set viminfo^=% "Remember info about open buffers on close
set laststatus=2 "Always show the status line
set tabstop=4 " How many columns a tab counts for
set shiftwidth=4 " How many columns to move when use << and >> operations
set clipboard=unnamedplus "LINUX
set hidden "Hides buffers instead of closing them "Must have
set showcmd	"Display incomplete commands
set noswapfile
set nobackup
" That means that on first <Tab> it will complete to the longest common string and will invoke wildmenu (an horizontal and unobstructive little menu). On next <Tab> it will complete the first altenative and the will start to cycle through the rest. You can go back and forth with <Tab> and <S-Tab> respectively.
set wildmenu
set wildmode=longest:full,full

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Set backups directions
"set backupdir=~/.vim/backup
"set directory=~/.vim/tmp

"" haven't tryied copyindent yet
" set copyindent    " copy the previous indentation on autoindenting

" (deprecated
"set ruler" Always show current position " already being used, right?

"""""""""""""""""""""""" Map leader
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" Opens a new tab with the default directory
map <leader>tn :tabnew<cr>
" Closes the tab
map <leader>cl :close<cr>
" Opens next buffer
map <leader>bn :bnext<cr>
" leader q to open recently used commands 
map <leader>q q:
" While in vim, open my .vimrc in the next tab
map <leader>my :tabedit $MYVIMRC<cr>
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Open the :shell
map <leader>sh :sh<cr>
" a.vim. Switch between header file and c/c++ file
map <leader>a :A<cr>
" put/print the full path name of the current file
"http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
map <leader>p :put =expand('%:p')<cr>
" scp to school computer current file
map <leader>scp :!scp <c-r>=expand("%:p")<cr> deco0072@remote06.cselabs.umn.edu:~/
" reformat the entire file; the '=' fixes the indentation
map <leader>ff gg=G
" Git difftool current file with HEAD^
map <leader>gd :!git difftool HEAD^ <c-r>=expand("%:p")<cr>
" diff this
" Windows
"map <leader>dt :!START /B gvimdiff % 
" Linux
map <leader>dt :!gvimdiff % <c-r>=expand("%:p:h")<cr>/
" node snip
map <leader>ne :r ~/Scripts/express_server<cr>
"go to file in new tab
nmap gf <C-w>gf
" tabfind only useful when finding one file of the given name
" it searchs the subdirectories for the first file with the given name
map <leader>f :tabfind

"""""""""" Map no leader

" Mapping for compiling and running a C program file
" This is set in ftplugin now at <F4>
" map <F8> :!gcc % && ./a.out <CR>

" The Vim distribution comes with a set of plugins for different filetypes that
" The scripts in $VIMRUNTIME/macros are global ones, the filetype
" plugins are in $VIMRUNTIME/ftplugin.

" Cycle between tabs
map <F9>  :tabp<CR>
map <F10> :tabn<CR>
map <F12> :Sex<CR>
map <S-F12> :Vex<CR>

" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Set x delete to not use the default register
noremap x "_x
" Paste into visual mode without updating the default register
vnoremap p "_dP

" Allow saving of files as sudo when I forgot to start vim using sudo.
" LINUX only
cmap w!! w !sudo tee > /dev/null %<CR>

" (deprecated) instead: vnoremap p
" Set stamping. With this you replace the current word with the last yanked or deleted text. Put the deletion in the black hole register.
" tpope/vim-surround uses S
" Note. This replaces S which is the equivalent of cc.
"noremap S "_diwP
"vnoremap S "_dP

""""""""""" autocommands

" Return to last edit position when opening files (You want this!)
"" BufReadPost is the event to watch for.
"" The '*' is the pattern in which to filter the event.
"" if...endif is the command to run.
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif

" (deprecated)
" This causes errors and is really annoying
" This only works on Linux
" Suppose to automatically reload .vimrc files when edited
"augroup myvimrc
"    au!
"    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
"augroup END

"-------------- Syntastic Stuff
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
let g:syntastic_javascript_checkers = ['eslint']
" C++ syntax check the latest version stuff like C++11
let g:syntastic_cpp_compiler_options = 'std=c++0x'
	
"-------------------------------- Default

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" IDK what this does.
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" (deprecated)
" Only do this part when compiled with support for autocommands.
"if has("autocmd")
"  " Put these in an autocmd group, so that we can delete them easily.
"  augroup vimrcEx
"  au!
"  " For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78
"  augroup END
"else
"  set autoindent		" always set autoindenting on
"endif " has("autocmd")

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

  " scolloff makes the diff funny.  turn it off
  set scrolloff=0
  
  " Big work monitor size
  set columns=195
  set lines=70

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
  " IDK what this does
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

  "set mousehide                " Turn off mouse when typing
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
