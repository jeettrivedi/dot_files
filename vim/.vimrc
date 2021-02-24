" README
" 1. Use single double-quotes for information
" 2. Use double double-quotes for commented code

" OS Dependencies
" !. The silver searcher https://github.com/ggreer/the_silver_searcher
" 2. fzf - fuzzy file searcher - https://github.com/junegunn/fzf


" Automate Pluginstall
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.fzf'))
  echon "Installing fzf... \n"
  silent !git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  silent !yes | ~/.fzf/install
endif

set rtp+=~/.fzf

if !executable('ag')
  echom "Install silversearcher, without which some functions may not work"
  echom "For Debian/Ubuntu use: apt install silversearcher-ag"
  echom "For Arch use: pacman -S the_silver_searcher"
  echom "For CentOS use: yum install the_silver_searcher"
endif


" PLUGINS (install by vimplug)
call plug#begin('~/.vim/plugged')
" Directory tree view
Plug 'scrooloose/nerdtree'
" Status bar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Async Linting Engine
Plug 'w0rp/ale'
" Python autocompletion framework
Plug 'davidhalter/jedi-vim'
" Language packs
Plug 'sheerun/vim-polyglot'
" Parentheses"
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Searching file names
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
" Guess file indentation
Plug 'tpope/vim-sleuth'
" Commenting
Plug 'tpope/vim-commentary'
" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Quick search across all files
Plug 'mileszs/ack.vim'
" Orgmode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
"" CSS syntax
Plug 'hail2u/vim-css3-syntax'
"" Live markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

""Stuff I don't currently use, but maybe will
""Plug 'mattn/emmet-vim'
""Plug 'pangloss/vim-javascript'
""Plug 'majutsushi/tagbar'
""Plug 'valloric/youcompleteme'
call plug#end()


" Add line numbering
set number

" THEME
" Enable syntax highlighting
syntax enable
" Enable 256 colors
set t_Co=256
" Allow transparency
hi Normal guibg=NONE ctermbg=NONE
" UTF-8 encoding
set encoding=utf-8


" VISUAL QUES
" Show the macthing pair of parentheses for [], {} and ()
set showmatch
" Set list chars
set list

" No message when the current file was changed outside of Vim
set autoread


" AIRLINE MODS
let g:airline_theme = 'wombat'


" SEARCH MODS
" Ignore case while searching
set ignorecase
" Except when search query contains a CAPS
set smartcase

" GIT GUTTER MODS
" Allow git gutter to show 9999 symbols
let g:gitgutter_max_signs=9999


" ALS MODS
let g:airline#extensions#ale#enabled = 1
let g:ale_css_stylelint_options  = ''
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'less': ['stylelint'],
\   'css': ['stylelint'],
\   'sass': ['stylelint']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'less': ['stylelint'],
\   'css': ['stylelint'],
\   'sass': ['stylelint']
\}


" SILVER SEARCHER
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "" let g:ctrlp_show_hidden = 1
  "" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  "" let g:ctrlp_use_caching = 0
  let g:ackprg = 'ag --vimgrep --smart-case'

  " make mileszs/ack.vim use ag instead of ack
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif


" NERDTREE MODS
" To toggle NerdTree using Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" NERDTress File highlighting
""cd ~/.local/share/fonts && curl -fLo "Noto Mono Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Noto/Mono/complete/Noto%20Mono%20Nerd%20Font%20Complete.ttf"

" Conditional to execute if not CentOS
let operating_system = join(split(system("sed -n 's/^NAME=\"\\([^\"]\\+\\)\".*$/\\1/p' /etc/os-release")))
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
" Colorcode files in nerdtree according to filetype
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" KEY BINDINGS
" To move lines up and down like in sublime
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv


" FZF MODS
" Search hidden files as well
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
map <C-p> :FZF<CR>

" Make backspace OP
set backspace=indent,eol,start

" Indent
set wrap
set linebreak
set autoindent
set breakindent

let g:polyglot_disabled = ['csv']
set clipboard+=unnamedplus
let g:jedi#popup_on_dot = 0

set tabstop=4
set shiftwidth=4
set expandtab
