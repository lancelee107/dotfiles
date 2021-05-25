source ~/.vim/vimrc

"call plug#begin('~/.local/share/nvim/plugged')
"" Tools
"	Plug 'vimwiki/vimwiki'
"		set nocompatible
"		filetype plugin on
"		syntax on
"		let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      		  \ 'syntax': 'markdown', 'ext': '.md'}]
"	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"		nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
"	Plug 'francoiscabrol/ranger.vim'
"        autocmd BufWritePost *.py call Flake8()
"    Plug 'jremmen/vim-ripgrep'
"        let g:rg_command = 'rg --vimgrep -S'
"        let g:rg_highlight = 'true'
"" Syntax
"	Plug 'tpope/vim-surround'
"	Plug 'tpope/vim-commentary'
"	Plug 'tpope/vim-repeat'
"	Plug 'nvie/vim-flake8'
"    Plug 'sheerun/vim-polyglot'
"" Themes
"    Plug 'NLKNguyen/papercolor-theme'
"    Plug 'morhetz/gruvbox' 

"call plug#end()

"" General Settings
"filetype plugin indent on
"syntax on
"set backspace=indent,eol,start
"set hidden
"set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent 

"set encoding=UTF-8
"set autoread wildmode=longest,list,full
"set hls is ic
"set splitbelow splitright 
"set nu rnu
"set clipboard^=unnamed  "combine vim and normal clipboards
"let python_highlight_all = 1

""Status-line
"set statusline=
"set statusline+=%#IncSearch#
"set statusline+=\ %y
"set statusline+=\ %r
"set statusline+=%#CursorLineNr#
"set statusline+=\ %F
"set statusline+=%= "Right side settings
"set statusline+=%#Search#
"set statusline+=\ %l/%L
"set statusline+=\ [%c]

"" Key-bindings
"let mapleader=" " 
"map <leader>, :vsplit ~/.config/nvim/init.vim<CR>
"map <C-s> :source ~/.config/nvim/init.vim<CR>
"" remap quit and save 
"noremap <leader>q :q<cr>
"nnoremap <leader>w :w<cr>
"" fzf
"" Open files in horizontal split
"nnoremap <silent> <Leader>f :call fzf#run({
"\   'down': '40%',
"\   'sink': 'botright split' })<CR>

"" ranger
"map <leader>r :Ranger<CR>

"" Tabbing and navigation
"map <leader>t :tabedit<CR>

"" pdb
"nnoremap <leader>p oimport pdb; pdb.set_trace()  # noqa<Esc>

"" clone paragraph below
"noremap cp yap<S-}>p

"" Color Settings
"colorscheme PaperColor
"set background=dark
"set cursorline
"hi! Normal ctermbg=NONE guibg=NONE 
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
"highlight LineNr ctermfg=NONE ctermbg=NONE
"highlight CursorLine ctermfg=NONE ctermbg=Black cterm=bold gui=bold

"map <F1> :colorscheme PaperColor<CR>
"map <F2> :colorscheme brogrammer<CR>
"map <F3> :colorscheme srcery<CR>
"map <F4> :colorscheme gruvbox<CR>

"" Sick Vertical Ruler
":set colorcolumn=80
"highlight ColorColumn ctermbg=red

"" disable creation of backup
"set nobackup nowritebackup noswapfile

