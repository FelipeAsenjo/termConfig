" PLUGIN MANAGER 'vim-plug/junegunn' :PlugInstall :PlugClean :PlugStatus

set nu relativenumber
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
syntax enable
set showcmd
set nowrap
set ruler
set encoding=utf-8
set showmatch
set sw=4
set laststatus=2
"set smartindent
set incsearch
set hlsearch
set smartcase
set ignorecase
set splitright

" -- HTML TEMPLATE
autocmd BufNewFile *.html 0r ~/.vim/templates/html.skel

" -- AUTOCOMPLETION
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" -- INIT PLUGINS--
call plug#begin('~/.vim/plugged')

" STATUS BAR
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'


" IDE
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'terryma/vim-multiple-cursors' ( otro de cursores multiples )

" COMMENTS
Plug 'preservim/nerdcommenter'

" HIGHLIGHT LANGUAGES
Plug 'sheerun/vim-polyglot'

" TYPING
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
"Plug 'tpope/vim-surround'

" TMUX
"Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" AUTOCOMPLETION
"Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tree & navigation
Plug 'scrooloose/nerdtree'

let NERDTreeQuitOnOpen=1
let g:EasyMotion_smartcase=1
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.jsx"

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

call plug#end()
" --END PLUGINS--

let mapleader=' '

" Plugin maps
map <Leader>nt :NERDTreeFind<CR>
map <Leader>s <Plug>(easymotion-s2)
" Search files references
map <Leader>p :Files<CR>
" Search function or variable references
noremap <Leader>gs :CocSearch 

" Split & split resize
nnoremap <Leader>j :sp<CR>
nnoremap <Leader>l :vsp<CR>
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

map <S-t> :vert:term<CR>
map <Leader>t :term<CR>

" Quick save & quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Go to's
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Format code
nmap <leader>f :Prettier<CR>

" Faster scrolling
nnoremap <S-j> 10j
nnoremap <S-k> 10k

" Run current file
nnoremap <Leader>x :!node %<cr>

" Current path to clipboard
nnoremap <Leader>r :.!pwd<CR>

" Easy ESC
:imap jk <Esc>
