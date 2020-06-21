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
"set hidden "Don't delete unused buffers?
set wildmenu
set ignorecase "Use case insesitive search, except when using capital letters
set smartcase
set autoindent "If there is no flietype-specific indenting, imitate above line
set laststatus=2 "Always display status line
set confirm "Instead failing because file is not save, ask if you want to save first
"set expandtab
set softtabstop=4 "disabled tabstop=4
"set cmdheight=2 "set command windows to 2 lines
filetype on
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
"set tabstop=4
"set guitablabel=%N/\ %t\ %M
set guitablabel=%N-\%t\%M
set so=5 "Set cursor offset
set incsearch
set foldmethod=manual
set showcmd
"Set custom tab name
"Usage: :let t:mytablabel = 'my_tab_name'
function! GuiTabLabel()
  return exists('t:mytablabel') ? t:mytablabel : ''
endfunction
set guitablabel=%{GuiTabLabel()}
set go+=e
set guifont=Consolas:h9
autocmd GUIEnter * simalt ~x "Start gvim in fullscreen mode
"Disable blinking autocmd version
"set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
    autocmd BufNewFile * set cuc
    autocmd BufNewFile * set cul
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
cd C:\Users\Manko\Documents\GameMakerStudio2\Kingdom Lost
nnoremap <Space> @
nnoremap <C-J> <C-W><C-J>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <S-T> :tabclose<CR>
"comment open/comment close
map <C-o> i/*<ESC>
map <C-c> a*/<ESC>
map <C-s> :setlocal spell!<cr>
nmap <silent> <leader>sv :so $MYVIMRC<CR>:Syndo filetype detect<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>ve :e C:\Program Files (x86)\Vim\Vimfiles\
nmap <silent> <leader>eg :e C:\Program Files (x86)\Vim\Vimfiles\syntax\gml.vim<CR>
nmap <silent> <leader>ey :e C:\Program Files (x86)\Vim\Vimfiles\syntax\yarn.vim<CR>
nmap <silent> <leader>oo :only<CR>
nmap gx gf<CR>:vs<CR>:e #<CR>
"nmap <F5> :w<ENTER>:!1.py<ENTER>
nmap <F2> :Syndo filetype detect<CR>
nmap <F3> :let t:mytablabel = ''<Left>
nnoremap <Left> :bprevious<CR>
nnoremap <Right> :bnext<CR>
"GAMEMAKER MACROS
nmap <silent> <leader>co oshow_debug_message(": " + object_get_name());<ESC>2F"pf(pF"kddf"l
nmap <silent> <leader>cs oshow_debug_message(": " + sprite_get_name());<ESC>2F"pf(pF"kddf"l
nmap <silent> <leader>cr oshow_debug_message(": " + room_get_name());<ESC>2F"pf(pF"kddf"l
nmap <silent> <leader>cc oshow_debug_message(": " + script_get_name());<ESC>2F"pf(pF"kddf"l
nmap <silent> <leader>cb oshow_debug_message(": " + rb());<ESC>2F"pf(pF"kddf"l
nmap <silent> <leader>cd o_ty = "<ESC>pa :"<ESC>f"a + string(<ESC>pa);<CR>draw_text_transformed(_tx, _ty, _tt, .25, .25, 0);<ESC>
nmap <silent> <leader>cz oshow_debug_message(": " + string());<ESC>2F"pf(pF"kdd
"nmap <C-z> oshow_debug_message(": \" + string());<ESC>2F"pf(pF"kdd
"nmap <silent> <leader>cz ^vf_hstimed<ESC>f(a_sd, 0, <ESC>
nmap <silent> <leader>cw f"lvf"h~
nmap <silent> <leader>sd oshow_debug_message("");<ESC>2hi
nmap <silent> <leader>cx oshow_debug_message(""+string());<ESC>F"i
nmap <silent> <leader>dd oshow_debug_message("--------------------------------------------------------------------------------------------------------");<ESC>2F"l
nmap <silent> <leader>ww o<ESC>i//---------------------------------------------------------------------------------------------------------//<ESC>^ll
nmap <silent> <leader>ca oshow_debug_message("CALLSTACK:");<CR>var _a = debug_get_callstack<CR>for(var i = 0; i < array_length_1d(_a); i++)<CR>show_debug_message(_a[i]);<ESC>
nmap <F1>       :mksession! 1<CR>
nmap <silent> <leader>s1 :source 1<CR>
nmap <silent> <leader>s2 :source 2<CR>
nmap <silent> <leader>s3 :source 3<CR>
nmap <silent> <leader>s4 :source 4<CR>
nmap <silent> <leader>vw :vs<CR>*<C-W>l
nmap <silent> <leader>sw :sp<CR>*
nmap <silent> <leader>fi ofor(var i = 0; i < ; i++)<ESC>F;i
nmap <silent> <leader>aa ivar _a = debug_get_callstack();<CR>for(var i = 0; i < array_length_1d(_a); i++)<CR>show_debug_message("_a: " + string(i) + "-" + string(_a[i]));<ESC>
nmap <silent> <leader>ii ggOvar _increment = variable_instance_exists(self, "allow_increment") && allow_increment;<ESC>GGoif _increment<CR>s++;<ESC>
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

map mm :nohl<ENTER>
"unmap <S-W>
unmap <C-X>
augroup remember_fold
    autocmd!
    autocmd BufWinLeave * silent! mkview
    autocmd BufWinEnter * silent! loadview
augroup end
"Auto bracket completion
inoremap "" ""<left>
inoremap "; "";<left><left>
inoremap ": "":<left><left>

inoremap '' ''<left>
inoremap '; '';<left><left>
inoremap ': '':<left><left>

inoremap (( ()<left>
inoremap (; ();<left><left>

inoremap [[ []<left>
inoremap [; [];<left><left>

inoremap { <CR>{<CR>}<ESC>O

inoremap <S-SPACE> <TAB>= ;<left>

"Cursor line/column highlight toggle
nmap <silent> <TAB>ch    :Windo set cuc<CR>:Windo set cul<CR>
nmap <silent> <TAB>cc    :Windo set nocuc<CR>:Windo set nocul<CR>
