""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: FONTAINRE Ulysse
" Description: Vim configuration
"
" I use vim-plug as my plugins manager.
" 
" Key bingings are:
" <Tab>               When inserting snippets
" <C-t>               NerdTree
" <C-p>               FZF Tags
" /                   Search ( in Visual mode only )
" <leader>w           vimwiki
" <leader>wi          Vimwiki Diary Index
" <leader>w,w         Vimwiki Make Diary Note
" <leader>w,i         Vimwiki Diary GenerateLinks
" <leader>w,y         Vimwiki Make Yesterday Diary Note
" <leader>w,m         Vimwiki Make Tomorrow Diary Note
" <leader>w,t         Vimwiki Tab Make Diary Note
" <leader>ws          Vimwiki UI Select
" <leader>wt          Vimwiki Tab Index
" <leader>ww          Vimwiki Index
" <C-b>n              Buffer Next
" <C-b>p              Buffer Previous
" <C-b>d              Buffer Delete
" <C-b>i              Bugger Select
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin section
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Colorschem / ui
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'

"Misc
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

"Color Syntax
Plug 'hdima/python-syntax', {'for': 'python'}
Plug 'NLKNguyen/c-syntax.vim', {'for': 'c'}
Plug 'isRuslan/vim-es6', {'for': 'javascript'}

" Linter
Plug 'w0rp/ale'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'justinmk/vim-syntax-extra', {'for': 'c'}

" Markdown/ Pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax' 

" Tools
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle'}
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'honza/vim-snippets'
Plug 'craigemery/vim-autotag'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }


" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Comments
Plug 'scrooloose/nerdcommenter'

" WEBDEV
Plug 'mattn/emmet-vim', {'for': 'html'}

" Completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --rust-completer --java-completer --clang-completer'}
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'

call plug#end()

" Enable 256 Color
if !has('gui_running')
  set t_Co=256
endif





""""""""""""""""""""""""""""""""""""""""""""""""""
" Configration option section
""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim essential config
let mapleader = "," " Change Leader if needed
set relativenumber
set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set encoding=UTF-8
color dracula

"Ale settings
let g:ale_completion_delay = 300
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'c': ['gcc', 'cpplint', 'clang'],
      \ }


" NerdTree
noremap <C-t> :NERDTreeToggle<CR>

" FZF
noremap <C-p> :Tags<CR>

" easy motion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Auto tags
let g:autotagTagsFile=".tags"

" ultisneep
" let g:UltiSnipsExpandTrigger="<C-c>"
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = '<tab>'

"Goyo
nnoremap <Leader><Space> :Goyo 120<CR>
function! s:goyo_enter()
  "silent !tmux set status off
  "silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "set noshowmode
  set noshowcmd
  set relativenumber
  set scrolloff=999
  "Limelight
  " ...
endfunction

function! s:goyo_leave()
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Python syntax
let python_highlight_all = 1
let Python3Syntax = 1

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 0
  \     }
  \   }
  \ }

"Disable ale java linter
"let g:ale_linters = {'java': []}

"YCM options
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview

" Autotag
let g:fzf_tags_command = 'ctags -R -f .tags'
let g:autotagTagsFile=".tags"


"Raimbow pluign
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Launch terminal
noremap <leader>t :vert term<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

" Buffer manipulation
noremap <C-b>n :bn<CR> 
noremap <C-b>p :bp<CR> 
noremap <C-b>d :bd<CR>
noremap <C-b>i :Buffers<CR>

" FZF navigation
noremap <C-f> :Files<CR>
noremap <C-g>c :Commits<CR>

" Fugitive
noremap <C-g>s :Gstatus<CR>
