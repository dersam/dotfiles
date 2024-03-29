" .vimrc at https://github.com/danemacmillan/dotfiles
"
" Sections:
" 1. Vundle installer for plugins.
" 2. Standard vimrc configurations.
"
" Notes:
" <leader> is equal to \
"


"
" 1. Begin Vim Vundle configs
"

set nocompatible              " be iMproved, required
filetype on                   " required for compatibility with Mac OS X, See https://github.com/gmarik/Vundle.vim/issues/167#issuecomment-51679609
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')
	Plugin 'gmarik/Vundle.vim'
	Plugin 'Solarized'
	Plugin 'editorconfig/editorconfig-vim'
	Plugin 'tpope/vim-surround'
	Plugin 'tpope/vim-commentary'
	Plugin 'tpope/vim-sleuth'
	Plugin 'kien/ctrlp.vim'
	Plugin 'closetag.vim'
	Plugin 'Tagbar'
	Plugin 'delimitMate.vim'
	Plugin 'elzr/vim-json'
	Plugin 'bling/vim-airline'
	Plugin 'nathanaelkane/vim-indent-guides'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'bling/vim-bufferline'
	Plugin 'ap/vim-css-color'
	Plugin 'SuperTab'
	Plugin 'mbbill/undotree'
	Plugin 'xolox/vim-misc'
	if (has('ctags'))
		Plugin 'taglist.vim'
		Plugin 'xolox/vim-easytags'
	endif
	if (has('lua') && (v:version > 703 || v:version == 703 && has('patch885')))
		Plugin 'Shougo/neocomplete.vim'
	endif
	"Plugin 'scrooloose/nerdtree'
	"Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Map Vundle commands
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
nnoremap <leader>pl :PluginList<CR>
nnoremap <leader>pi :PluginInstall!<CR>
nnoremap <leader>ps :PluginSearch!<Space>
nnoremap <leader>pc :PluginClean!<CR>

"
" 2. Begin standard vimrc configs.
"

" Use the Solarized Dark theme
" Installed using Vundler (see above)
" .vimrc typically throws an error about this the first time Vundler is
" run, so suppress the message so the plugins install without interruption.
"silent! set background=dark
silent! set background=dark
silent! colorscheme solarized

" Tagbar
let g:tagbar_usearrows = 1
nnoremap <F8> :TagbarToggle<CR>

" Taglist
let Tlist_Use_Right_Window = 1
nnoremap <F9> :TlistToggle<CR>

" NERDTREE
"let g:NERDTreeShowHidden=1
"nnoremap <leader>n :NERDTreeToggle<CR>

" Customize Airline
"https://github.com/bling/vim-airline/wiki/FAQ
let g:airline_powerline_fonts = 1
let g:airline_theme= 'dark'
" Displaying nice buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" CtrlP
" https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
let g:ctrlp_map = '<space>'
let g:ctrlp_cmd = 'CtrlP'
 " r will use nearest .git, which doesn't play well with symlinks
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
"https://coderwall.com/p/hk_bwg/how-to-speed-up-ctrlp
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public$|tmp$',
	\ 'file': '\.so$\|\.dat$|\.DS_Store$'
	\ }
if executable('ag')
	" https://www.mankier.com/1/ag
	let g:ctrlp_user_command = 'ag --ignore-case --nogroup --hidden --follow
		\ -U -p ~/.agignore
		\ -l -m 10000
		\ --ignore .git
		\ --ignore .svn
		\ --ignore .hg
		\ --ignore .DS_Store
		\ --ignore "**/*.pyc"
		\ %s -g ""'
endif

" Syntastic
if exists('g:syntastic_check_on_open')
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_php_checkers = ['phpcs']
endif

" Indent guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 0
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234

" Neocomplete
" disable autocomplpop.
let g:acp_enableatstartup = 0
" use neocomplete.
let g:neocomplete#enable_at_startup = 1
" use smartcase.
let g:neocomplete#enable_smart_case = 1
" set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Better whitespace
let g:strip_whitespace_on_save = 1
nnoremap <leader>s :StripWhitespace<CR>

" Undo tree
let g:undotree_WindowLayout = 1
nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
	set undodir='~/.vim/undo/'
	set undofile
endif

" Map buffer cycling
set pastetoggle=<F2>
nnoremap <S-Tab> :bprevious<CR>
" Hit spacebar, followed by first characters of buffer filename, enter.
" This is not really necessary, considering CtrlP is mapped to ',' which
" includes buffers in its searches.
" Just use CtrlP, which is more elegant and already available.
"nnoremap <space> :b<space>
nnoremap , :CtrlPBuffer<CR>

" Pasting between different systems when line numbers are visible means that
" they will be included in the paste. This will strip them. Only strip
" whitespace before (from 0 to 2) and after number (0 to 1). Anything more
" greedy can result in undesired replacements.
"
" In addition, copying from other systems may also copy the list characters
" (lcs) settings defined in vim. For this .vimrc file, those characters match
" the ones defined later. This mapping will run both search and replaces.
nnoremap <F3> :%s/^\s\{0,2\}\d\+\s\?//e <Bar> %s/➝*·*¬*_*»*▸*$//e<CR>

" Toggle line number visibility for copying from other systems with mouse.
nnoremap <F4> :set invnumber <Bar> :set list!<CR>

" Reload vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Remap D to behave exactly the same, except also move the next line up. This
" is done by preceding the dd cut mapping with a blackhole register:
" http://vimhelp.appspot.com/change.txt.html#registers
nnoremap <S-d> "_dd

" Set default file format
set ff=unix
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

set wrap
set linebreak

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Disable per-directory .vimrc files and disable unsafe commands in them
set noexrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Show “invisible” characters
" triangle-headed rightwards arrow: http://unicode-table.com/en/279D/
set lcs=tab:➝\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Set title string to just be filename
set titlestring=%t
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
"
set linespace=0

" Set and show column at 80 characters
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Save a file as root
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Treat extensionless files as bash scripts.
au BufRead,BufNewFile * setfiletype sh

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" When invoking dotfiles through vagrant provisioning script, Vundler throws a
" pair of warnings:
" Vim: Warning: Output is not to a terminal
" Vim: Warning: Input is not from a terminal
" https://stackoverflow.com/questions/16517568/vim-exec-command-in-command-line-and-vim-warning-input-is-not-from-a-terminal
"au StdinReadPost * set buftype=nofile
