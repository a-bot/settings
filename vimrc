set t_Co=256
syntax on
set number
filetype plugin indent on
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set ruler
set incsearch
set expandtab
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
set enc=utf-8  " Default encoding
set smarttab
set softtabstop=4
set backspace=indent,eol,start
set ignorecase
set smartcase
set hlsearch
set matchtime=2
set splitright
set splitbelow
set noerrorbells      " Error bells are annoying
set report=0          " Always report the number of lines changed
set display=lastline  " Show as much of the last line as possible

set title  " Set descriptive window/terminal title
set titlestring=%f%(\ [%M]%)
"               |      |
"               "               |      +-- Modification status
"               "               +--------- Filename
set list        " Show certain nonprinting characters
set listchars=  " Defines how hidden chars are shown when in 'list' mode.

set lcs+=tab:▷⋅      " Right triangle and middle dot for tab chars
set lcs+=extends:›   " Right single angle for chars right of the screen
set lcs+=precedes:‹  " Left single angle for chars left of the screen
set lcs+=nbsp:·      " Middle dot for non-breaking spaces
set lcs+=trail:·     " Middle dot for trailing spaces

set sbr=↪\   " Right hook arrow for wrapped chars
set shortmess=aTItoO
set showcmd       " Display the command in the last line
set showmode      " Display the current mode in the last line
set laststatus=2  " Always show status line
"set statusline=%<%f\ %=\:\b%n\[%{strlen(&ft)?&ft:'none'}/%{&encoding}/%{&fileformat}]%m%r%w\ %l,%c%V\ %P
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
map <silent> <F2> <Esc>:NERDTreeToggle<CR>
map <silent> <F6> <Esc>:TlistToggle<CR>
let python_highlight_all=1
map <silent> <F5> :NERDTreeFind<CR>
lang pl_PL.UTF-8
set pastetoggle=<F3>
set noerrorbells
set visualbell
set t_vb=
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"highlight flicker cterm=bold ctermfg=white
"au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
set nocompatible
set scrolloff=3
set sidescrolloff=3
map <S-Left> <ESC>:tabp<cr>
map <S-Right> <ESC>:tabn<cr>
colo inkpot
autocmd BufWritePre * :%s/\s\+$//e
"autocmd FileType python set ft=python.django " For SnipMate
"autocmd FileType html set ft=html.django_template " For SnipMate
