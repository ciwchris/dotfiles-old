" .vimrc
" Author: Christopher Lopes <christopher.lopes@gmail.com>
" Author: Steve Losh <steve@stevelosh.com>


" Preamble ---------------------------------------------------------------- {{{
set nocompatible
"call pathogen#infect()
filetype plugin indent on
filetype indent on
"
" }}}
" Vundle ---------------------------------------------------------------- {{{
" Required for Vundle to work
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"JavaScript syntax checkers
"Bundle 'scrooloose/syntastic'
"Bundle 'hallettj/jslint.vim'
Bundle 'pangloss/vim-javascript'
" Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'

" LaTex Plugins
Bundle 'LaTeX-Box-Team/LaTeX-Box'

" Misc Plugins
Bundle 'vim-scripts/mru.vim'
"Bundle 'godlygeek/tabular'
"Bundle 'mattn/gist-vim'
"Bundle 'tpope/vim-markdown'
"Bundle 'kien/ctrlp.vim'
"Bundle 'mbbill/undotree'

"merge/diff tool
Bundle 'sjl/splice.vim' 

" Clojure
"Bundle 'vim-scripts/VimClojure'
"Bundle 'vim-scripts/paredit.vim'
"Bundle 'jpalardy/vim-slime'

"
" }}}
" Basic options ----------------------------------------------------------- {{{

" Clear all autocmds so they won't get loaded twice. This needs to be up top!
autocmd!

" Set to auto read when a file is changed from the outside
" set autoread

" allow backspacing over everything in insert mode
" set backspace=indent,eol,start

set encoding=utf-8
set history=1000
set ruler			" show the cursor position all the time
set cmdheight=1 	"The commandbar height
set showcmd			" display incomplete commands
" perl/python regex (comment can't appear on line below)
nnoremap / /\v
vnoremap / /\v
set incsearch		" do incremental searching
set hlsearch
set tabstop=4

set wildmenu
set wildmode=list:longest,full	" tab complete to longest string
set visualbell
set ttyfast

set nonumber				" line numbers off
set cindent
set autoindent
set smartindent
set mouse=a				" use mouse in xterm to scroll
set scrolloff=5 		" 5 lines bevore and after the current line when scrolling
set ignorecase			" ignore case
set smartcase			" but don't ignore it, when search string contains uppercase letters
set hid 				" allow switching buffers, which have unsaved changes
set shiftwidth=4		" 4 characters for indenting
set showmatch			" showmatch: Show the matching bracket for the last ')'?

set nowrap				" don't wrap by default
set completeopt=menu,longest,preview
set confirm
syn on

colorscheme slate
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" set lines=57 columns=102


" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","


" set default font size (for plugin fontsize)
set guifont=Mono\ 10


" change to directory of current file automatically
autocmd BufEnter,BufRead,BufNewFile,BufFilePost *     execute ":lcd " . expand("%:p:h")
" turn on folding using markers
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Fast saving
nnoremap <leader>w :w!<cr>

" Fast unloading buffer
"nnoremap <leader>d :bd!<cr>

" Fast editing of the .vimrc
nnoremap <leader>ev :e! $MYVIMRC<cr>

" When vimrc is edited, reload it
augroup write_vimrc
    autocmd!
	autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""" Markdown to HTML  
nmap <leader>md :%!~/Scripts/Markdown.pl --html4tags <cr> 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convient Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <a-j> <down>
inoremap <a-k> <up>
nnoremap <space> <c-f>
" up and down for screen not file line
nnoremap j gj
nnoremap k gk

""""""" Remap omni-completion to CTRL+SPACE
"inoremap <c-space> <c-x><c-o>

""""""" Turn off toolbar
set guioptions-=T
" Use clipboard when maipulating text in visual mode
" set guioptions+=a
" set guioptions+=A

""""""" Remove serach highlighting with escape
:nnoremap <esc> :noh<return><esc>

""""""" viminfo to turn off saving global marks across sessions
set viminfo='100,f0

""""""" do not use swap or backup files
set nobackup
set nowritebackup
set noswapfile


""""""" show chars for tab and end of line
set list
set listchars=tab:▸\ ,eol:¬


""""""" copy working directory of current buffer
" :nmap ,p :let @p=substitute(expand("%:p:h"), "/", "\\", "g")<CR>


" Conque - so we can run vim inside of conque
let g:ConqueTerm_EscKey = '<C-d>'
let g:ConqueTerm_CWInsert = 0

""""""" clojure - slime with vim (not slimv)
" let g:slime_target = "tmux"
" Settings for the VimClojure plugin
"let vimclojure#FuzzyIndent=1
"let vimclojure#HighlightBuiltins=1
"let vimclojure#HighlightContrib=1
"let vimclojure#DynamicHighlighting=1
"let vimclojure#ParenRainbow=1
"let vimclojure#WantNailgun=1
"let vimclojure#NailgunClient = $HOME . "/.bin/ng"
"let g:paredit_mode = 1

" TwitVim
"let twitvim_browser_cmd = 'firefox'
"let twitvim_api_root = "https://api.twitter.com/1"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%


" }}}
" Highlight word {{{
highlight InterestingWord1 guibg=green guifg=white
highlight InterestingWord2 guibg=blue guifg=white
highlight InterestingWord3 guibg=pink guifg=black

nnoremap <silent> <leader>he :execute 'match ErrorMsg /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>
nnoremap <leader>hc :match none<cr>:2match none<cr>:3match none<cr>

" I often use one word form accidentially in place of another.
" This will highlight these occurences so I can review them
iabbrev there there<esc>b<leader>heea
iabbrev their their<esc>b<leader>heea
iabbrev attend attend<esc>b<leader>heea
iabbrev our our<esc>b<leader>heea
" }}}
"

