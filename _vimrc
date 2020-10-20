":se backup? backupdir? backupext?
"http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
" vim's vimrc_example and msvim already sets up backup and swap
" set swap(.swp),backup(~),undo(.udf) directory to vim installation
" Please make sure the directory exists otherwise current directory will be used
" Remember the undo history for file, doesn't work with file collisions
"Taken from http://vim.wikia.com/wiki/Example_vimrc
set directory=c:\tmp
set backupdir=c:\tmp
set undodir=c:\tmp
set nocompatible
set hidden "Don't delete unused buffers?
set wildmenu
set ignorecase "Use case insesitive search, except when using capital letters
set smartcase
set autoindent "If there is no flietype-specific indenting, imitate above line
set laststatus=2 "Always display status line
set confirm "Instead failing because file is not save, ask if you want to save first
set expandtab
set softtabstop=4 "disabled tabstop=4
"set tabstop=4
"set cmdheight=2 "set command windows to 2 lines
filetype on
filetype plugin on
syntax on
colorscheme psycho
set background=dark
set ruler
set hlsearch
set autoindent
set smartindent
set number
set shiftwidth=4
set cursorline
set cursorcolumn
"set guitablabel=%N/\ %t\ %M
set guitablabel=%N-\%t\%M
set notitle
set so=10 "Set cursor offset
set incsearch
set foldminlines=0
set foldmethod=indent
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
set foldclose=all
set foldopen=all
set foldnestmax=1
set showcmd
"Set custom tab name
"Usage: :let t:mytablabel = 'my_tab_name'
function! GuiTabLabel()
  return exists('t:mytablabel') ? t:mytablabel : ''
endfunction
set guitablabel=%{GuiTabLabel()}
set go+=e
set guifont=Consolas:h9
set winaltkeys=no
autocmd GUIEnter * simalt ~x "Start gvim in fullscreen mode
"Disable blinking autocmd version
"set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
    autocmd BufNew,BufNewFile,BufRead,BufWinEnter * set cuc
    autocmd BufNew,BufNewFile,BufRead,BufWinEnter * set cul
endif
"windows toolbar
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set t_Co=256 "256 color
endif
"New windo command
command! -nargs=+ -complete=command Windo
    \ let s:currentWindow = winnr() |
    \ execute "windo <args>" |
    \ execute s:currentWindow . "wincmd w"
command! -nargs=+ -complete=command Syndo
    \ let s:currentWindow = winnr() |
    \ execute "tabdo windo <args>" |
    \ execute s:currentWindow . "wincmd w"
"VIMGREP
"\ execute 'filetype plugin off' | " Doesn't really change search speed
command! -nargs=+ Vrep
    \ execute "silent vimgrep /<args>/ **/*.gml" | vert copen |
command! -nargs=+ Vrepjson
    \ execute "silent vimgrep /<args>/ **/*.json" | vert copen |
command! -nargs=+ Vrepyy
    \ execute "silent vimgrep /<args>/ **/*.yy" | vert copen |
nnoremap <leader>vv :execute "Vrep" expand("<cword>")<CR>
nnoremap <leader>gff :e scripts\<c-r><c-w>\<c-r><c-w>.gml<CR>
nnoremap <leader>gfv :vs scripts\<c-r><c-w>\<c-r><c-w>.gml<CR>
nnoremap <leader>gfs :sp scripts\<c-r><c-w>\<c-r><c-w>.gml<CR>
"scripts\/expand("<cword>")\/expand("<cword>").gml
cd C:\Users\Manko\Documents\GameMakerStudio2\Kingdom Lost
nnoremap <Space> @
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <silent> <C-T> :tabe<CR>
nnoremap <silent> <S-T> :tabclose<CR>
"comment open/comment close
map <C-o> i/*<ESC>
map <C-c> a*/<ESC>
map <C-s> :setlocal spell!<cr>
nmap <silent> <leader>sv :so $MYVIMRC<CR>:Syndo filetype detect<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>ve :e C:\Program Files (x86)\Vim\Vimfiles\
nmap <silent> <leader>eg :e C:\Program Files (x86)\Vim\Vimfiles\syntax\gml.vim<CR>
nmap <leader>ek :cd C:\Users\Manko\Appdata\Roaming\Kingdom_Lost<CR>:e 
nmap <silent> <leader>oo :only<CR>
nmap gx gf<CR>:vs<CR>:e #<CR>
"nmap <F5> :w<ENTER>:!1.py<ENTER>
nmap <F2> :Syndo filetype detect<CR>
nmap <F3> :let t:mytablabel = ''<Left>
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
"GAMEMAKER MACROS
nmap <silent> <leader>tt Bitrace_string("<ESC>A");<ESC>
nmap <silent> <leader>to Bitrace_object("<ESC>A");<ESC>
nmap <silent> <leader>ts Bitrace_sprite("<ESC>A");<ESC>
nmap <silent> <leader>tc Bitrace_script("<ESC>A");<ESC>
nmap <silent> <leader>ta Bitrace_audio("<ESC>A");<ESC>
nmap <silent> <leader>tb Bitrace_bool("<ESC>A");<ESC>
nmap <silent> <leader>t<S-t> yiwitrace("<ESC>A: "+string());<ESC>hhP
vmap <silent> <leader>tt     yitrace("<ESC>A: "+string());<ESC>hhP
nmap <silent> <leader>t<S-o> yiwitrace("<ESC>A: "+object_get_name());<ESC>hhP
vmap <silent> <leader>to     yitrace("<ESC>A: "+object_get_name());<ESC>hhP
nmap <silent> <leader>t<S-s> yiwitrace("<ESC>A: "+sprite_get_name());<ESC>hhP
vmap <silent> <leader>ts     yitrace("<ESC>A: "+sprite_get_name());<ESC>hhP
nmap <silent> <leader>t<S-c> yiwitrace("<ESC>A: "+script_get_name());<ESC>hhP
vmap <silent> <leader>tc     yitrace("<ESC>A: "+script_get_name());<ESC>hhP
nmap <silent> <leader>t<S-a> yiwitrace("<ESC>A: "+audio_get_name());<ESC>hhP
vmap <silent> <leader>ta     yitrace("<ESC>A: "+audio_get_name());<ESC>hhP
nmap <silent> <leader>t<S-b> yiwitrace("<ESC>A: "+rb());<ESC>hhP
vmap <silent> <leader>tb     yitrace("<ESC>A: "+rb());<ESC>hhP
nmap <silent> <leader>cd o_text = "<ESC>pa: " + string(<ESC>pa);<CR>draw_text_transformed(_tx, _ty, _tt, .25, .25, 0);<ESC>
nmap <silent> <leader>cv otrace_string("<ESC>pa");<ESC>kdd
nmap <silent> <leader>cz otrace(": " + string());<ESC>2F"pf(p<UP>dd<DOWN>f:
nmap <silent> <leader>sd otrace("");<ESC>2hi
nmap <silent> <leader>cx otrace(""+string());<ESC>F"i
nmap <silent> <leader>dd otrace("--------------------------------------------------------------------------------------------------------");<ESC>2F"l
nmap <silent> <leader>cs otrace("/--CALLSTACK--\\");<CR>for(var i = 0, _a = debug_get_callstack(); i < array_length_1d(_a); i++){otrace(_a[i]);<ESC>

nmap <silent> <leader>aa ivar _a = debug_get_callstack();<CR>for(var i = 0; i < array_length_1d(_a); i++)<CR>trace("_a: " + string(i) + "-" + string(_a[i]));<ESC>
nmap <silent> <leader>fi ofor(var i = 0; i < ; i++){2f;i
nmap <silent> <leader>fj ofor(var j = 0; j < ; j++){2f;i
nmap <silent> <leader>fk ofor(var k = 0; k < ; k++){2f;i
nmap <silent> <leader>fl ofor(var l = 0; l < ; l++){2f;i

nmap <silent> <leader>br otrace_pop("Breakpoint");<ESC>
"What's this?
nmap <C-z> otrace(": \" + string());<ESC>2F"pf(pF"kdd 

nmap <silent> <leader>cw f"lvf"h~
nmap <silent> <leader>ww o<ESC>i//---------------------------------------------------------------------------------------------------------//<ESC>^ll
nmap <F1>     :mksession! 1<CR>
nmap <silent> <leader>s1 :source 1<CR>
nmap <silent> <leader>s2 :source 2<CR>
nmap <silent> <leader>s3 :source 3<CR>
nmap <silent> <leader>s4 :source 4<CR>
nmap <silent> <leader>vw :vs<CR>*<C-W>l
nmap <silent> <leader>sw :sp<CR>*
"ESC MAPS
"GAMEMAKER FILE EDITING
nmap <ESC>eo :e  objects\
nmap <ESC>vo :vs objects\
nmap <ESC>so :sp objects\

nmap <ESC>es :e  scripts\
nmap <ESC>vs :vs scripts\
nmap <ESC>ss :sp scripts\

nmap <ESC>er :e  rooms\
nmap <ESC>vr :vs rooms\
nmap <ESC>sr :sp rooms\

nmap <ESC>ed :e  datafiles\
nmap <ESC>vd :vs datafiles\
nmap <ESC>sd :sp datafiles\

nmap <ESC>ea :e shaders\
nmap <ESC>va :vs shaders\
nmap <ESC>sa :sp shaders\

nmap <ESC>eu :e sounds\
nmap <ESC>vu :vs sounds\
nmap <ESC>su :sp sounds\

nmap <ESC>en :e notes\
nmap <ESC>vn :vs notes\
nmap <ESC>sn :sp notes\

nmap <ESC>to :tabe objects\
nmap <ESC>ts :tabe scripts\
nmap <ESC>tr :tabe rooms\
nmap <ESC>td :tabe datafiles\
nmap <ESC>ta :tabe shaders\
nmap <ESC>tn :tabe notes\

nmap <C-_>- <C-W>-

map mm :nohl<ENTER>
"unmap <S-W>
unmap <C-X>
map <S-k> <Nop>
augroup remember_fold
    autocmd!
"    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup end

inoremap {  <SPACE>{<CR>}<ESC><UP>
inoremap <C-SPACE> <TAB>= 
inoremap <S-SPACE> _
"inoremap <C-> <SPACE>{<CR>}i else {<CR>}<ESC> {
"TAB mappings
"Cursor line/column highlight toggle
nmap <silent> <TAB>ch    :Windo set cuc<CR>:Windo set cul<CR>
nmap <silent> <TAB>cc    :Windo set nocuc<CR>:Windo set nocul<CR>
nmap <silent> <TAB>cc    :Windo set nocuc<CR>:Windo set nocul<CR>
"Quick Indent/Unindent
nmap <TAB>ik kvj%j>
nmap <TAB>ij jvk%k>
nmap <TAB>uk kvj%j<
nmap <TAB>uj jvk%k<
nmap <TAB>kz V$%zf
nmap <TAB>jz V$%zf
map <M-j> zj
map <M-k> zk
map <M-h> [z
map <M-l> ]z
