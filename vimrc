set nocompatible          " We're running Vim, not Vi!
set guitablabel=%M%t
set nobackup

"let mapleader = ","
set sts=2
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set expandtab
set backspace=start,indent
autocmd FileType make     set noexpandtab
autocmd FileType python   set noexpandtab
set number
set hlsearch
syntax on
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
let g:fuzzy_ignore = "*.log *.jpg"
let g:fuzzy_ceiling = 2000
let g:fuzzy_matching_limit = 70

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" binds \ T to taglist (sorta like textmate apple-shift-t)
map <leader>T :TlistToggle<CR>
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_OnSelect=1
let Tlist_Compact_Format=1

set grepprg=ack

map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>
nmap <leader>w <C-w><C-w>_
imap <C-l> <space>=><space>

set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.DS_Store
set swapfile! "" Don't produce swap files
set nowritebackup
set path=$PWD/public/**,$PWD/**
filetype plugin indent on " Enable filetype-specific indenting and plugins
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
set guioptions-=m
set fuoptions=maxvert,maxhorz
set statusline=%<%f\ %h%m%r%=%-20.(line=%l,col=%c%V,totlin=%L%)\%h%m%r%=%-40(,%n%Y%)\%P
set laststatus=2
map <C-q> :mksession! ~/.vim/.session <cr>
map <C-w> :tabclose<CR>
map <C-//> map ,# :s/^/#/<CR>
map <S-//> :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR><Esc>:nohlsearch<CR>
map <c-j> <c-w>j map <c-k> <c-w>k map <c-l> <c-w>l map <c-h> <c-w>h
imap <M-Up> :tabn<CR>
imap <M-Down> :tabp<CR>
source $VIMRUNTIME/mswin.vim
"so ~/.vim/plugin/supertab.vim
imap <c-s> <esc><c-s>
set guioptions-=T
if has("gui_running")
    set transparency=7
    colorscheme ir_black
    set lines=80
    set columns=100
    syntax on                 " Enable syntax highlighting
    set guifont="Inconsolata 12"
    set antialias
else
"    set term=ansi
    syntax on
endif

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
let g:proj_flags="imstg"
nmap <silent> <leader>P :Project<CR>
noremap <buffer><silent> <M-r> :w<CR>:echo "Running tests..."<CR>:let spec_response = system("spec -l ".line(".")." ".expand("%"))<CR>:echo spec_response<CR>
" Cheat!
command! -complete=file -nargs=+ Cheat call Cheat(<q-args>)
function! Cheat(command)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  execute 'silent $read !cheat '.escape(a:command,'%#')
  setlocal nomodifiable
  1
endfunction

set guifont="Inconsolata 12"
