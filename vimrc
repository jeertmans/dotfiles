set nocompatible              " be iMproved, required
filetype off                  " required

" 4-spaces indent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tabnine/YouCompleteMe'
Plugin 'dense-analysis/ale' " Check syntax in Vim asynchronously and fix files
Plugin 'altercation/vim-colors-solarized' " Color theme
Plugin 'airblade/vim-gitgutter' " Shows git diff markers in the sign column
Plugin 'editorconfig/editorconfig-vim' " EditorConfig plugin
Plugin 'lervag/vimtex' " Filtetype and syntax for LaTeX files
Plugin 'preservim/nerdcommenter' " Comment functions
Plugin 'ervandew/supertab' " Use Tab for completions
Plugin 'SirVer/ultisnips' " Vim snippets
Plugin 'mg979/vim-visual-multi' " Multiple cursors
Plugin 'euclio/vim-markdown-composer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"

let g:python3_host_prog = '/usr/bin/python3'

" Add this for YCM to support virtualenv
" let g:python_host_prog = '/bin/python'
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:ale_python_flake8_options = "--ignore=E501,F403,F405"

"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/snippets']
