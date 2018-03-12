set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ctrl-P
Plugin 'kien/ctrlp.vim'

" Better Numbers (Decided to use built in numbering)
" Plugin 'myusuf3/numbers.vim'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" Rainbow Parens Plugin
Plugin 'luochen1990/rainbow'

" NERDTree
Plugin 'scrooloose/nerdtree'

" NERDTree Tabs
Plugin 'jistr/vim-nerdtree-tabs'

" PyMode
Plugin 'python-mode/python-mode'

" Vim Surround
Plugin 'tpope/vim-surround'

" AutoClose Plugin
Plugin 'Townk/vim-autoclose'

" Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'

" NeoComplete (Depreciated)
Plugin 'Shougo/neocomplete.vim'

" NeoSnippet
Plugin 'Shougo/neosnippet.vim'

" PHP editing support PIV
" Plugin 'spf13/PIV'

" Tabularize (Seems Depereciated)
Plugin 'godlygeek/tabular'

" EasyMotion
Plugin 'easymotion/vim-easymotion'

" Tagbar
Plugin 'majutsushi/tagbar'

" Simpyl Fold
Plugin 'tmhedberg/SimpylFold'

" Indent Python
Plugin 'vim-scripts/indentpython.vim'

" You Complete Me Bundle
Bundle 'Valloric/YouCompleteMe'

" Syntastic
Plugin 'vim-syntastic/syntastic'

" PEP8 check
Plugin 'nvie/vim-flake8'

" Powerline (Hard to config so I'm using a lightweight alternative)
" Plugin 'powerline/powerline'

" Airline
Plugin 'vim-airline/vim-airline'

" Color Scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-distinguished'

" Fugitive Git
Plugin 'tpope/vim-fugitive'

" DevIcons
Plugin 'ryanoasis/vim-devicons'

call vundle#end()            " required
filetype plugin indent on    " required
" Brief Vundle Help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Set splits below and right
set splitbelow
set splitright

" Navigate between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Fold with space
nnoremap <space> za

" PEP8 Indention
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Alt for FS Development
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" UTF-8
set encoding=utf-8

" Py highlight
let python_highlight_all=1
syntax on

" Mouse Enable
set mouse=a

" YouComplete Tweak
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Color Scheme Logic
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" Toggle Light/Dark Modes with F5
call togglebg#map("<F5>")

" Remap esc to caps lock
map <CAPS> <C-[><CR>

" Change leader
let mapleader = ","

" Added autocmd to numbers.vim to start with relative number off and use
" hotkeys for plugin (maybe a better way to do this without plugin)
set nu
" set relativenumber
nnoremap <F3> :set invnumber<CR>
nnoremap <F4> :set invrnu<CR>

" Numbers Plugin Hotkeys
" nnoremap <F3> :NumbersToggle<CR>
" nnoremap <F4> :NumbersOnOff<CR>

" Syntastic Noob Defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Nerdtree Auto-open with no file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Nerdtree Hotkey set to ctrl-e
map <C-E> :NERDTreeToggle<CR>

" Nerdtree quit if only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Turn on Rainbow Parens Plugin
let g:rainbow_active = 1

" Tagbar Hotkey
nmap <F9> :TagbarToggle<CR>

" Set Foldmethod
set foldmethod=marker

" Highlight problematic whitespace
"set list
"set listchars=tab:›\ ,trail:◆,extends:#,nbsp:.
" Highlight whitespace in red in normal mode
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Python space errors
let python_space_errors = 1

" Backspace for dummies
set backspace=indent,eol,start

" No arrows in Normal Mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" NeoComplete and NeoSnippet Configs{{{
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" NeoSnippet Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif"}}}
