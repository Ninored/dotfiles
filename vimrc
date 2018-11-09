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
" :Cheat [args]       Query Cheat.sh [arg]
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

" Linter
Plug 'w0rp/ale'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
"Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'justinmk/vim-syntax-extra', {'for': 'c'}
Plug 'chemzqm/vim-jsx-improve'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

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
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'tmhedberg/matchit'
Plug 'khzaw/vim-conceal'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'joegesualdo/jsdoc.vim'


" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Comments
Plug 'scrooloose/nerdcommenter'

" WEBDEV
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript']}

" Completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --rust-completer --java-completer --clang-completer --enable-coverage'}
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'ervandew/eclim'

" Latex
Plug 'lervag/vimtex'

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
let maplocalleader = ",,"
set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2
set mouse=a
set encoding=UTF-8
set nospell
color dracula

" Set conceal
set conceallevel=1

" Column at 80
highlight ColorColumn ctermbg=gray
set colorcolumn=80

" delete trailing whitespaces
"autocmd BufWritePre * %s/\s\+$//e

"Ale settings
let g:EclimJavaValidate = 0
autocmd FileType java let g:ale_java_javac_classpath=eclim#Execute('-command java_classpath -p ' . eclim#project#util#GetCurrentProjectName())
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
      \ 'c': ['gcc', 'cpplint', 'clang'],
      \ 'cpp': ['gcc'],
      \ }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Javascript syntax
let g:javascript_plugin_flow = 1

" NerdTree
noremap <C-t> :NERDTreeToggle<CR>

" FZF
noremap <C-p> :Tags<CR>

" easy motion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" ultisneep
" let g:UltiSnipsExpandTrigger="<C-c>"
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
let g:ycm_min_num_of_chars_for_completion = 4
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_register_as_syntastic_checker = 0
let g:ycm_min_num_of_chars_for_completion = 99
set completeopt-=preview

" Autotag
let g:fzf_tags_command = 'ctags -f .tags -R'
let g:autotagTagsFile=".tags"

" Pandoc
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#modules#disabled = ["folding"]

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

" Vim Polyglot
let g:polyglot_disabled = ['latex', 'markdown', 'python']

"vimtex
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
let g:vimtex_view_method = 'zathura'
let g:tex_flavor = 'latex'
let g:vimtex_syntax_minted = [
      \ {'lang': 'cpp',},
      \ {'lang': 'python',},
      \ {'lang': 'c',},
      \ {'lang': 'ocaml',},
      \ {'lang': 'asm',},
      \ {'lang': 'html',},
      \ {'lang': 'javascript',},
      \ {'lang': 'json',},
      \ {'lang': 'php',}]


" JsDoc
nnoremap jsd :<C-u>call JSDocAdd()<CR>

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
