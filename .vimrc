" .vimrc
" Author: Christopher Lopes <christopher.lopes@gmail.com>


" Preamble ---------------------------------------------------------------- {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle' 

" Theme
Bundle 'altercation/vim-colors-solarized'

Bundle 'https://github.com/Valloric/YouCompleteMe.git'
Bundle 'SirVer/ultisnips'
"Bundle 'tpope/vim-ragtag'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'

" Improved JavaScript indentation
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/indenthtml.vim'

" :Ack [options] {pattern} [{directory}]
Bundle 'https://github.com/mileszs/ack.vim.git'
" :TagbarToggle
"Bundle 'majutsushi/tagbar'
"Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/mru.vim'

" Lightweight Toolbox for LaTex
"Bundle 'LaTex-Box-Team/LaTex-Box'

"merge/diff tool
Bundle 'sjl/splice.vim' 

" Clojure
"Bundle 'vim-scripts/VimClojure'
"Bundle 'vim-scripts/paredit.vim'
"Bundle 'jpalardy/vim-slime'

filetype plugin indent on

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

"set nonumber				" line numbers off
"set relativenumber
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
" ISSUE! When using this after vim starts up we're left in insert mode
"nnoremap <esc> :noh<return><esc>

""""""" viminfo to turn off saving global marks across sessions
set viminfo='100,f0

""""""" do not use swap or backup files
set nobackup
set nowritebackup
set noswapfile


""""""" show chars for tab and end of line
" causing issues !!!!
"set list
"set listchars=tab:▸\ ,eol:¬


""""""" copy working directory of current buffer
" :nmap ,p :let @p=substitute(expand("%:p:h"), "/", "\\", "g")<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%


" }}}

" Plugin mappings {{{

" Ctrlp
let g:ctrlp_custom_ignore = {
			\ 'dir': '\v[\/]node_modules$',
			\}

" YouCompleteMe
"let g:ycm_key_list_previous_completion=['<Up>']
"let g:ycm_key_list_select_completion=['<Down>','<Enter>']


" Ultinsnips
let g:UltiSnipsExpandTrigger="<C-t>"
"let g:UltiSnipsListSnippets="<C-Enter>"

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

" vim-script html indentation
let g:html_ident_inctags = "html,body,head,tbody"
let g:html_ident_script1 = "inc"
let g:html_ident_style1 = "inc"

" Theme
let s:background_color=readfile($HOME."/.bin/color-mode/current-color-mode","",1)
syntax enable
let &background=s:background_color[0]
colorscheme solarized

" TwitVim
"let twitvim_browser_cmd = 'firefox'
"let twitvim_api_root = "https://api.twitter.com/1"

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

" Custom functions {{{

" function! NumberToggle()
" 	if(&relativenumber == 1)
" 		set number
" 	else
" 		set relativenumber
" 	endif
" endfunc
" nnoremap <C-n> :call NumberToggle()<cr>
" augroup filetype_vim
" 	autocmd FocusLost * :set number
" 	autocmd FocusGained * :set relativenumber
" 	autocmd InsertEnter * :set nonumber
" 	autocmd InsertLeave * :set relativenumber
" augroup END

" }}}
