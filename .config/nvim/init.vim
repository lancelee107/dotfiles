call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-multiple-cursors'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvie/vim-flake8'
" Call PlugInstall to install new plugins
call plug#end()

" Sick customizations
colorscheme gruvbox
" Sick Vertical Ruler
:set colorcolumn=80
highlight ColorColumn ctermbg=red

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
	set rnu
        function! ToggleNumbersOn()
            set nu!
            set rnu
        endfunction
        function! ToggleRelativeOn()
            set rnu!
            set nu
        endfunction
        autocmd FocusLost * call ToggleRelativeOn()
        autocmd FocusGained * call ToggleRelativeOn()
        autocmd InsertEnter * call ToggleRelativeOn()
        autocmd InsertLeave * call ToggleRelativeOn()

" General Vim Settings
let mapleader=','
set autoread " Reload files changed outside vim
set autoindent
set tabstop=4
set shiftwidth=4
autocmd BufWritePost *.py call Flake8()
" use the regular clipboard instead of the unnamed clipboard
set clipboard^=unnamed
" disable creation of backup
set nobackup nowritebackup

