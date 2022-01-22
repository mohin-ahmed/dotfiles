"-----Initializations {{{----------
set nocompatible	"Break compatibility with vi
set hidden		"Buffers can exist in background
" Just a comment
" Either set backups off, or put it all in a temporary directory
set noswapfile
set nobackup
set nowritebackup	"disable backup file when writing in case of crash

if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[5 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[2 q"
endif
" upon hitting escape to change modes,send successive move-left 
" and move-right commands to immediately redraw the cursor
inoremap <special> <Esc> <Esc>hl

" don't blink the cursor
set guicursor+=i:blinkwait0

" turn of bell sound or visual bell
set belloff=all
set novisualbell "Disable the bell on error

" Enable fzf: fuzzy file finder integration with Vim. Point to it in the 
" runtime path
set rtp+=~/.fzf

set encoding=utf-8
set fileencoding=utf-8
"-----}}}----------------------------

"-----Keyboard mappings {{{----------

nnoremap j gj		"Move by screen lines, not by real lines
nnoremap k gk
" Also in visual mode
vnoremap j gj
vnoremap k gk

"nnoremap ; : 	"Press ; to issue commands in normal mode (no more shift holding)
"nnoremap \ ;	"Remap original leader key to semicolon (repeats t/T/f/F)

""Toggle paste mode (to paste properly indented text)
"nnoremap <F2> :set invpaste paste?<CR>
"set pastetoggle=<F2>

let mapleader = ","	"map leader key to comma

" Pressing ldr-<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR> 

noremap <C-S> :update<CR> 	"Use CTRL-S for saving, also in Insert mode
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Disable Q key and stay away from Ex mode
nnoremap Q <nop>

" Next few lines enables tmux style Prefix-hjkl navigation in
" vim buffers. Note the quirk about using "@" instead of Space to get this
" to work in WSL2. May need something else in other systems
"
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-@>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-@>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-@>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-@>l :TmuxNavigateRight<cr>
nnoremap <silent> <c-@>\ :TmuxNavigatePrevious<cr>

"-----}}}----------------------------

"-----Autocommands, foldings, etc {{{----
set foldmethod=marker       "fold based on indent
set foldnestmax=10          "deepest fold is 10 levels
set nofoldenable            "dont fold by default
set foldlevel=1             "this is just what i use
set foldcolumn=2            "column on left showing
"-----}}} --------------------

"-----Look and feel parameters {{{---

colorscheme wombat
" Set the cursor row and column highlight
set cursorline "Show thin horizontal line where cursor is
set cursorcolumn "Show thin vertical line where cursor is

set showmode "Show which mode you're in
set number "Line number the file
set hlsearch "Highlight searches
set incsearch "Do incremental search
set smartcase "If caps, then watch case, but ...
set ignorecase "If all lowercase then ignore case
set showmatch "Show mathching brackets

" set ruler
set wildmenu "In command mode hitting tab shows all completions

set mouse=a "?? Make mouse available
set showcmd "Show (partial) command in status line
set backspace=2 "Make backspace work like other apps
set shiftwidth=2
" set tabstop=2
"set shiftround "Round > and < to multiples of shiftwidth
"set scrolloff=5 "Always show some text context at top and bottom
"" Set textwidth=78 "not needed since Vim default is 80 characters
"" Set wrap "Wrap lines visually, based on window width
"" Note that setting the list option below breaks linbreak wrap feature
"set linebreak "Line breaks at words
"set formatoptions=l "Enable soft word wrap
set list "Normally, don't show show non-text characters, but..
set listchars=tab:._ "if manually enabled, then underline tabs 
syntax on
filetype on "Colored highlights and proper indenting based on filetype
filetype indent on
filetype plugin on
filetype plugin indent on
set autoindent
set copyindent "Copy previous indent
set smartindent
"Set the status line options. Make it show more information.
set laststatus=2
" Statusline shows modified, read-only, help, etc, truncate from left
set statusline=%<%F%m%r%h%w\ %=[%v,%l/%L]\ %p%%\ [%{&ff},\ %Y]
"-----}}}----------------------------
