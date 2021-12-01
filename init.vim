"" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" view file tree
Plug 'scrooloose/nerdtree'

" use ctrl p to search text, code objects and functions
Plug 'ctrlpvim/ctrlp.vim' " show icons on nerdtree
Plug 'ryanoasis/vim-devicons'

" auto pair a character {[()]}
Plug 'jiangmiao/auto-pairs'

" Golang
Plug 'fatih/vim-go'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf
" https://github.com/junegunn/fzf.vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Rego
Plug 'tsandall/vim-rego'
Plug 'Chiel92/vim-autoformat'

" Web development
Plug 'posva/vim-vue'
Plug 'ap/vim-css-color'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Autotest 
Plug 'buoto/gotests-vim'

" make vim cool
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Async as you type code linting at its finest. Zero config needed.
Plug 'dense-analysis/ale'

" auto comment
" highlight line/s and then press g + c to comment
Plug 'tpope/vim-commentary'

" auto surround a word
" highlight a word > press shift + the character to surround the word
Plug 'tpope/vim-surround'

" colors
Plug 'fatih/molokai'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'
Plug 'lifepillar/vim-solarized8'

" docker
Plug 'ekalinin/Dockerfile.vim'

" terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

" auto snippets - I used this mostly with go
" https://github.com/fatih/vim-go-tutorial#snippets
" https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets
" Plug 'SirVer/ultisnips'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" markdown
Plug 'tpope/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'

Plug 'junegunn/vim-easy-align'

" colorizer for rgb definitions in buffer
Plug 'chrisbra/Colorizer'


call plug#end()

" =============================================================================
"                     start: basic vim setup and utility shortcuts
" =============================================================================
set cc=100
set number
set encoding=utf-8
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows

" My Shortcuts
" display color column in lightgrey color
"nnoremap cc :hi ColorColumn ctermbg=lightgrey guibg=lightgrey<CR>
" Remove higlights
nnoremap rh :nohl<CR>
" Next tab
nnoremap <Tab> :bnext!<CR>
" Previous tab
nnoremap p<Tab> :bprev!<CR>
" Close tab
nnoremap c<Tab> :bd!<CR>
" Trim all whitespaces
nnoremap tws :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" GoInfo
nnoremap <space>i :GoInfo<CR>
" Copy/Paste to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p 

"" colors
if has("termguicolors")
    set termguicolors
endif

syntax enable
set shell=/bin/zsh

" colorscheme
set t_Co=256
set t_ut=
" colorscheme moonfly
colorscheme codedark
" colorscheme molokai

" devicons setup
set guifont=SauceCodePro_Nerd_Font:h13
let g:airline_powerline_fonts = 1

" make tabs and spaces amazing  for code tbas
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>

" =============================================================================
"                     end: basic vim setup and utility shortcuts
" =============================================================================

""" markdown settings
" Syntax highlight is synchronized in 50 lines. It may cause collapsed highlighting
" at large fenced code block. In the case, please set larger value
let g:markdown_minlines = 100
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'go', 'json', 'yaml']

" terraform
let g:terraform_align=1
let g:terraform_remap_spacebar=1
let g:terraform_fmt_on_save=1
autocmd FileType terraform setlocal commentstring=#%s

" Align GitHub-flavored Markdown tables
" press <leader> + \ to fix a table alignment
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" mapleader
let mapleader=","

" togglable shortcuts
nmap <F8> :TagbarToggle<CR>
nmap <leader>p :NERDTreeToggle<CR>

" ==============================================
" vim-go
" ==============================================
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
let g:go_term_mode = "split"
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command='gopls'
" let g:ale_go_golangci_lint_options='--exclude-use-default=false'
let g:go_metalinter_enabled = 0
let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = []

" ==============================================
" coc.nvim default settings
" ==============================================

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
		 \ pumvisible() ? "\<C-n>" :
					 \ <SID>check_back_space() ? "\<TAB>" :
								 \ coc#refresh()
								 inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

								 function! s:check_back_space() abort
									 let col = col('.') - 1
										 return !col || getline('.')[col - 1]  =~# '\s'
										 endfunction

										 " Use <c-space> to trigger completion.
										 inoremap <silent><expr> <c-space> coc#refresh()

"" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
"" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"
"" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

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

" " Go ale settings
let g:ale_linters = {
	\ 'go': ['golint',  'gopls', 'golangci-lint'],
  \ 'terraform': [''],
	\}

" let g:go_metalinter_autosave_enabled = ['gometalinter']
let g:go_fmt_autosave = 1

" highlights
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Remove annoying popups on autocomplete go
set completeopt-=preview

" This will add new commands, called :A, :AV, :AS and :AT. Here :A works just
" like :GoAlternate, it replaces the current buffer with the alternate file.
" :AV will open a new vertical split with the alternate file. :AS will open
" the alternate file in a new split view and :AT in a new tab.
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" Run additional commands when saving files.
augroup auto_go
	autocmd!
	autocmd BufWritePost *.go :GoBuild
augroup end

" Terraform
autocmd BufNewFile,BufRead *.tf  nnoremap tp :Terraform plan<CR>
autocmd BufNewFile,BufRead *.tf  nnoremap tg :Terraform get -update<CR>
autocmd BufNewFile,BufRead *.tf  nnoremap ti :Terraform init<CR>

" =======================================================
" Web development
"
" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for 
" properties) between the completions and the origin position in the result 
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of 
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ] 

"
" =============== airline  ===================
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'

set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Rego
let g:formatdef_rego = '"opa fmt"'
let g:formatters_rego = ['rego']
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_verbosemode = 1

autocmd BufNewFile,BufRead *.proto setfiletype proto
autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
autocmd BufNewFile,BufRead *.hcl setf conf
autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.groovy set expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.js setlocal expandtab noet ts=2 sw=2
autocmd BufNewFile,BufRead *.css setlocal expandtab noet ts=2 sw=2
autocmd BufNewFile,BufRead *.html setlocal noet ts=2 sw=2
autocmd BufNewFile,BufRead *.md setlocal expandtab expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.zsh setlocal noet ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.yaml setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.json setlocal expandtab noet ts=2 sw=2
autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.sql setlocal noexpandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead Vagrantfile set syntax=ruby expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Matchfile set syntax=ruby expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Appfile set syntax=ruby expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Gymfile set syntax=ruby expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Fastfile set syntax=ruby expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Podfile* set syntax=ruby expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.rules set syntax=yaml expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Jenkinsfile* set expandtab ts=2 sw=2
autocmd BufNewFile,BufRead Makefile set noet ts=2 sw=2
autocmd BufNewFile,BufRead *.gradle setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead Dockerfile* setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.tf setlocal ts=2 sw=2
autocmd BufNewFile,BufRead *.tfvars setlocal ts=2 sw=2
autocmd BufNewFile,BufRead *.proto setlocal ts=2 sw=2
filetype plugin indent on
