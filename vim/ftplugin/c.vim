" I should add this if statement
"if exists("did_load_filetypes")
"  finish
"endif
" I should add this augroup thingy but too lazy
" augroup filetypedetect
map <F8> :!gcc % -lm && ./a.out

" If you want to display the line numbers in the source file
:se nu
" I should add this augroup thingy but too lazy
" augroup END

" To switch to the corresponding source file, and
nmap ,s :find %:t:r.c<CR>
nmap ,S :sf %:t:r.c<CR>
" To switch to the corresponding header file.
nmap ,h :find %:t:r.h<CR>
nmap ,H :sf %:t:r.h<CR>

" I ran gcc -v -E -
" to discover all the include paths on this box.
set path=/usr/lib/gcc/x86_64-linux-gnu/4.8/include
set path=/usr/local/include
set path=/usr/lib/gcc/x86_64-linux-gnu/4.8/include-fixed
set path=/usr/include/x86_64-linux-gnu
set path=/usr/include
