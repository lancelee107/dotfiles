call plug#begin('~/.local/share/nvim/plugged')
" Tools
	Plug 'vimwiki/vimwiki'
		set nocompatible
		filetype plugin on
		syntax on
		let g:vimwiki_list = [{'path': '~/vimwiki/',
                      		  \ 'syntax': 'markdown', 'ext': '.md'}]
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
" Syntax
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-repeat'
	Plug 'nvie/vim-flake8'
	Plug 'francoiscabrol/ranger.vim'
        autocmd BufWritePost *.py call Flake8()
" Themes
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'morhetz/gruvbox' 

call plug#end()

" General Settings
set encoding=UTF-8
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
set hls is ic
set splitbelow splitright 
set nu rnu
set clipboard^=unnamed  "combine vim and normal clipboards
let python_highlight_all = 1

"Status-line
set statusline=
set statusline+=%#IncSearch#
set statusline+=\ %y
set statusline+=\ %r
set statusline+=%#CursorLineNr#
set statusline+=\ %F
set statusline+=%= "Right side settings
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ [%c]

" Key-bindings
let mapleader=" " 
map <leader>, :vsplit ~/.config/nvim/init.vim<CR>
map <C-s> :source ~/.config/nvim/init.vim<CR>
" resize panes
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
" easier pane navigation
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
" alternate pane navigation
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
" remap quit and save 
noremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
" ranger
map <leader>r :Ranger<CR>
" fzf
map <leader>f :FZF<CR>
" clone paragraph below
noremap cp yap<S-}>p

" Color Settings
colorscheme PaperColor
set background=dark

map <F1> :colorscheme PaperColor<CR>
map <F2> :colorscheme brogrammer<CR>
map <F3> :colorscheme srcery<CR>
map <F4> :colorscheme gruvbox<CR>

" Sick Vertical Ruler
:set colorcolumn=80
highlight ColorColumn ctermbg=red

" disable creation of backup
set nobackup nowritebackup

