filetype off
set nocompatible

"" BEGIN VUNDLE
filetype plugin indent on
" set the runtime path to include Vundle and Initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" plugins need to go here. Stop at vundle#end()
" REQUIRED
Plugin 'VundleVim/Vundle.vim'  " Vundle (REQUIRED)
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'tmhedberg/SimpylFold' " simply fold plugin
Plugin 'vim-scripts/indentpython.vim' " python indentation fix
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'klen/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Bundle 'Valloric/YouCompleteMe' " Jedi autocomplete
call vundle#end()

"" END VUNDLE
set t_Co=256

set fo=tcq
"set nomodeline

" required for powerline
set laststatus=2

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore .pyc files in NERDTree

" set default comment color to cyan instead of darkblue
" which is not very legible on a black background
highlight comment ctermfg=cyan

set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

au BufNewFile,BufRead *.py:
      \ set tabstop=4
      \ set expandtab
      \ set softtabstop=4 
      \ set shiftwidth=4
      \ set textwidth=79 
      \ set expandtab
      \ set fileformat=unix

set encoding=utf-8 " utf-8 support

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g   :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF


"highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
"match LiteralTabs /\s\+$/
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" use the molokai colorscheme
" pulled from https://github.com/tomasr/molokai
"colorscheme molokai 
colorscheme onedark

" highlight the current line
set cursorline

" set splits
set splitbelow
set splitright

" move to splits with keyboard
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" folding
set foldmethod=indent
set foldlevel=99

" open nerdtree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_virtualenv = 1
let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_cwindow = 1
let g:pymode_lint_signs = 1

