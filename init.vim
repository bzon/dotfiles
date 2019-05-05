"" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" view file tree
Plug 'scrooloose/nerdtree'

" use ctrl p to search text, code objects and functions
Plug 'ctrlpvim/ctrlp.vim' " show icons on nerdtree
Plug 'ryanoasis/vim-devicons'

" auto pair a character {[()]}
Plug 'jiangmiao/auto-pairs'

" Autotest 
Plug 'buoto/gotests-vim'

Plug 'chase/vim-ansible-yaml'

Plug 'buoto/gotests-vim'

" make vim cool
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Async as you type code linting at its finest. Zero config needed.
Plug 'w0rp/ale'

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

" ansible
Plug 'pearofducks/ansible-vim'

" terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" auto snippets - I used this mostly with go
" https://github.com/fatih/vim-go-tutorial#snippets
" https://github.com/fatih/vim-go/blob/master/gosnippets/UltiSnips/go.snippets
Plug 'SirVer/ultisnips'

" auto completion for go
" <C-x><C-o> to activate autocompletion
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.vim/plugged/gocode/nvim/symlink.sh' }
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" markdown
Plug 'tpope/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'

" gradle
Plug 'tfnico/vim-gradle'

" ruby
Plug 'ngmy/vim-rubocop'
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
nnoremap cc :hi ColorColumn ctermbg=lightgrey guibg=lightgrey<CR>
" Remove higlights
nnoremap <space> :nohl<CR>
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

"" colors
if has("termguicolors")
    set termguicolors
endif

syntax enable
set shell=/bin/zsh

" colorscheme
set t_Co=256
set t_ut=
colorscheme moonfly

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
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_term_mode = "split"
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
" let go_info_mode='guru'
" let g:go_auto_type_info = 1

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
" let g:ale_linters = {'go': ['gometalinter', 'gofmt', 'revive', 'govet']}
" call ale#linter#Define('go', {
" \   'name': 'revive',
" \   'output_stream': 'both',
" \   'executable': 'revive',
" \   'read_buffer': 0,
" \   'command': 'revive %t',
" \   'callback': 'ale#handlers#unix#HandleAsWarning',
" \})

let g:go_metalinter_autosave_enabled = ['gometalinter']
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

autocmd BufNewFile,BufRead *.proto setfiletype proto
autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
autocmd BufNewFile,BufRead *.hcl setf conf
autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.groovy set expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.js setlocal expandtab noet ts=4 sw=4
autocmd BufNewFile,BufRead *.md setlocal expandtab expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.zsh setlocal noet ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.yaml setlocal expandtab ts=2 sw=2
autocmd BufNewFile,BufRead *.json setlocal expandtab noet ts=2 sw=2
autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
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
autocmd BufNewFile,BufRead *.gradle setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead Dockerfile* setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.tf setlocal ts=4 sw=4
autocmd BufNewFile,BufRead *.tfvars setlocal ts=4 sw=4
autocmd BufNewFile,BufRead *.proto setlocal ts=4 sw=4
filetype plugin indent on
