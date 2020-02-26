" vim-plug self-install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugs install
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-sleuth'
call plug#end()

" My Own Config
colorscheme Tomorrow-Night
let g:airline_powerline_fonts = 1
let g:airline_theme='tomorrow'
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_show_diagnostics_ui = 0
map <C-n> :NERDTreeToggle<CR>
map <F8> :call ToggleMouse()<CR>
set encoding=utf-8
set mouse=a
set number
set pastetoggle=<F9>
set termencoding=utf-8

" My Own Function
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

