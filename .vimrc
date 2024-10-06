set nocompatible    "vim not compatible with vi, hence advantageous
filetype off

set rtp+=~/.vim/bundle/Vundle.vim   "set runtime path to include Vundle and initialise

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'                               "Plugin manager
Plugin 'tmhedberg/SimpylFold'                               "Code folding
Plugin 'vim-scripts/indentpython.vim'                       "autoindent for python
Plugin 'Valloric/YouCompleteMe'                             "autocomplete for python
Plugin 'vim-syntastic/syntastic'                            "syntax checking and highlighting
Plugin 'nvie/vim-flake8'                                    "PEP 8 checking
Plugin 'altercation/vim-colors-solarized'                   "solarized
Plugin 'jnurmine/Zenburn'                                   "zenburn
Plugin 'nanotech/jellybeans.vim'                            "jellybeans theme
Plugin 'dracula/vim', {'name': 'dracula'}                   "dracula theme
Plugin 'morhetz/gruvbox'                                    "gruvbox theme
Plugin 'scrooloose/nerdtree'                                "file tree
Plugin 'jistr/vim-nerdtree-tabs'                            "tabs in nerdtree
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-surround'                                 "all about surroundings
Plugin 'lervag/vimtex'                                      "edit latex in vim
Plugin 'dense-analysis/ale'                                 "asynchronous linting engine
Plugin 'SirVer/ultisnips'                                   "snippet tool engine
Plugin 'honza/vim-snippets'                                 "snippets for ultisnips
Plugin 'ackyshake/VimCompletesMe'
Plugin 'preservim/nerdcommenter'                            "NerdCommenter
Plugin 'severin-lemaignan/vim-minimap'                      "Minimap
Plugin 'godlygeek/tabular'                                  "Align blocks of text


call vundle#end()

filetype plugin indent on

set ruler	"displays ruler at bottom right corner of the window

"set line numbers
set number
"set relativenumber     "This sets the cursor line to zero and numbers lines
"above and below it relative to it

set wrap

set background=dark
autocmd vimenter * ++nested colorscheme gruvbox
"colorscheme jellybeans

"highlight searching
set incsearch
set showmatch
set hlsearch
set ignorecase
set smartcase

let python_highlight_all=1
syntax on	"syntax highlighting

set tabstop=4	"tab gives a space of 4 units
set autoindent
set expandtab	"replace tabs with white spaces
set softtabstop=4	"remove multiple white spaces with single backspace
set cursorline	"underlines current cursor location

set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf8

"Proper PEP 8 indentation for Python
au BufNewFile,BufRead *.py,*.rb
    \ setlocal tabstop=4 |
    \ setlocal softtabstop=4 |
    \ setlocal shiftwidth=4 |
    \ setlocal textwidth=79 |
    \ setlocal expandtab |
    \ setlocal autoindent |
    \ setlocal fileformat=unix |

"Indentation for other file types
au BufNewFile,BufRead *.js,*.html,*.css, *.c, *.cpp
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2 |

"Flag extra whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"YouCompleteMe customisations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"vimtex configuration
let g:latex_view_general_viewer = 'okular'
let g:latex_view_method = 'okular'
let g:tex_flavor = 'latex'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2

"Ultisnips configuration
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<C-q>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"VimCompletesMe configuration
augroup VimCompletesMeTex
  autocmd!
  autocmd FileType tex
      \ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END

"NerdCommenter settings

"Create default mappings
let g:NERDCreateDefaultMappings = 1

"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"Use compact syntax for multi-line comments
let g:NERDCompactSexyComs = 1

"Align line-wise comment delimiters flush left instead of following code
"indentation
let g:NERDDefaultAlign = 'left'

"Check whether selected lines are commented or not
let g:NERDToggleCheckAllLines = 1

"Adding xelatex to list of compiling options
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \ '-xelatex',
        \ '-file-line-error',
        \ '-synctex=1',
        \ '-interaction=nonstopmode',
        \ ],
        \}

