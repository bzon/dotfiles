" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ekalinin/Dockerfile.vim'
Plug 'pearofducks/ansible-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tfnico/vim-gradle'
Plug 'ngmy/vim-rubocop'
" Plug 'plasticboy/vim-markdown'
Plug 'fatih/molokai'
Plug 'shime/vim-livedown'
Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/vim-easy-align'
Plug 'mzlogin/vim-markdown-toc'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
call plug#end()

" set column
set cc=80

" deoplete-go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" colorscheme
" https://github.com/tomasiser/vim-code-dark#installation
set t_Co=256
set t_ut=
" colorscheme codedark
colorscheme molokai
let g:airline_theme = 'codedark'

" ==================== markdown ====================
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['go=go', 'viml=vim', 'bash=sh']
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

" devicons setup
set guifont=SauceCodePro_Nerd_Font:h13
let g:airline_powerline_fonts = 1

if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif 

" tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>

" mapleader
let mapleader=","

" open nvim terminal shortcut
"  nmap <leader>ot :vs term://zsh<CR>

" open new tmux vertical-split terminal
nmap <leader>ot :!tmux split-window<CR>

" togglable shortcuts
nmap <F8> :TagbarToggle<CR>
nmap <leader>p :NERDTreeToggle<CR>

" quit using q
map <leader>q :q<CR>

" Press F5 to trim all whitespaces
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" ctags for go
" Please ensure to follow this guide 
" https://unknwon.io/setup-vim-for-go-development/
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" ==============================================
" vim-go shortcuts
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_snippet_engine = "automatic"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
let g:go_fmt_command = "goimports"
let g:go_test_timeout = "1m"
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

let g:go_metalinter_autosave_enabled = ['gometalinter']
" highlights
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_format_strings = 0

" This will add new commands, called :A, :AV, :AS and :AT. Here :A works just
" like :GoAlternate, it replaces the current buffer with the alternate file.
" :AV will open a new vertical split with the alternate file. :AS will open
" the alternate file in a new split view and :AT in a new tab. 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Now you easily call :GoInfo by just hitting <leader>i
autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
" set updatetime=100

" you don't need to call :GoSameIds manually anymore. Matching identifier
" variables are now highlighted automatically for you.
" let g:go_auto_sameids = 1


""""""

" =============== airline  ===================
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark_minimal'

set encoding=utf-8              " Set default encoding to UTF-8
set backspace=indent,eol,start  " Makes backspace key more powerful.
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set columns=80
set lazyredraw

syntax enable
set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L

  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4

  autocmd BufNewFile,BufRead *.groovy setlocal noet expandtab ts=4 sw=4
  autocmd BufNewFile,BufRead *.js setlocal expandtab noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.zsh setlocal noet ts=2 sw=2
  autocmd BufNewFile,BufRead *.yml setlocal expandtab ts=2 sw=2
  autocmd BufNewFile,BufRead *.json setlocal expandtab noet ts=2 sw=2
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2

  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
  " fastlane and xcode  files
  autocmd BufNewFile,BufRead Vagrantfile set syntax=ruby expandtab ts=2 sw=2
  autocmd BufNewFile,BufRead Matchfile set syntax=ruby expandtab ts=2 sw=2
  autocmd BufNewFile,BufRead Appfile set syntax=ruby expandtab ts=2 sw=2
  autocmd BufNewFile,BufRead Gymfile set syntax=ruby expandtab ts=2 sw=2
  autocmd BufNewFile,BufRead Fastfile set syntax=ruby expandtab ts=2 sw=2
  autocmd BufNewFile,BufRead Podfile* set syntax=ruby expandtab ts=2 sw=2
  " jenkins files
  autocmd BufNewFile,BufRead Jenkinsfile setf groovy
  " gradle
  autocmd BufNewFile,BufRead *.gradle setlocal noet ts=4 sw=4
  " docker
  autocmd BufNewFile,BufRead Dockerfile* setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" autocomplete
filetype plugin indent on
"set omnifunc=syntaxcomplete#Complete

