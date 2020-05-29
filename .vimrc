" ====== Setting for Vundle ====== {
set nocompatible                " be iMproved
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/taglist.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'airblade/vim-gitgutter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'OmniCppComplete'
Plugin 'junegunn/fzf'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'Align'
Plugin 'AutoComplPop'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'scrooloose/nerdtree'

call vundle#end()               " required

syntax on
filetype plugin indent on
" }

" ====== Setting for VIM ====== {
set noautochdir
set autoindent
set autoread
set backspace=indent,eol,start
set nobackup
set noswapfile
set completeopt=longest,menu,preview
set confirm
set csverb
set fencs=ucs-bom,utf-8,gb18030,gbk,big5
set foldmethod=syntax
set foldlevel=100 
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linebreak
set nu
set ruler 
set showmatch
set showcmd
set smartcase
set smartindent
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set tabstop=8
set shiftwidth=8
set noexpandtab
set vb
set nowrap
set wrapscan
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
set wildignore+=*.o,*.obj,*.exe,*.dll,*.a,*.bin
set wildignore+=*.jpg,*.bmp,*.gif " binary images  
set wildignore+=*.docx,*.xlsx,*.pdf
set tags=tags;~
set relativenumber
"colorscheme darkblue
"colorscheme space-vim-dark
color space-vim-dark
set termguicolors
hi LineNr ctermbg=NONE guibg=NONE

"set cursorline
" }

" ====== Setting for Plugins ====== {
" taglist [
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Inc_Winwidth = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Left_Window = 1
let Tlist_Auto_Open = 1
nmap <leader>tl :TlistToggle<CR> 
" ]

" cscope [
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cst
nmap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>fa :cs add cscope.out<CR>
" ]

" ctrlp [
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = "max:100"
let g:ctrlp_by_filename = 1
" ]

" Quickfix [
map <silent> <F5> :cw 10<CR>
map <silent> <F6> :cp<CR>
map <silent> <F7> :cn<CR>
map <silent> <F8> :ccl<CR>
" ]

" Indent Guide [
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=blue
hi IndentGuidesEven ctermbg=green
" ]

" indentLine [
let g:indentLine_showFirstIndentLevel = 1
:set list lcs=tab:\|\ "for tab
" ]

" FZF [
function! s:fzf_neighbouring_files()
    let current_file =expand("%")
    let cwd = fnamemodify(current_file, ':p:h')
    let command = 'ag -g "" -f ' . cwd . ' --depth 0'

    call fzf#run({
                \ 'source': command,
                \ 'sink':   'e',
                \ 'options': '-m -x +s',
                \ 'window':  'enew' })
endfunction
command! FZFNeigh call s:fzf_neighbouring_files()
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>l :FZFNeigh<CR>
" ]

"rainbow [
"let g:rainbow_active = 1
"au FileType c,cpp,py,python call rainbow#load()
"]

"nerdtree [
map <F8> :NERDTreeToggle<CR>
"]

" }

" ====== Functions ====== {
function Addcscope()
    if filereadable('./cscope.out')
        exec 'cs add cscope.out'
    endif
endfunction

function Addctags()
    if filereadable('./tags')
        exec 'set tags+=./tags'
    endif
endfunction

" }

" ====== Autoload ====== {
autocmd VimEnter * call Addcscope()
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" }

" ====== Mapping ====== {
" custom comma motion mapping
nmap di, f,dT,
nmap ci, f,cT,
nmap da, f,ld2F,i,<ESC>l "delete argument 
nmap ca, f,ld2F,i,<ESC>a "delete arg and insert

" I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

"window select 
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" quick pairs
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
inoremap <leader>( ()<ESC>i
inoremap <leader>[ []<ESC>i

" build ctags
map <F9> :!cscope -Rbq<CR><CR>
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> :set tags+=./tags<CR>
" }

if filereadable('./CMakeLists.txt')
    set noexpandtab
endif
