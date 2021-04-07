call plug#begin()
Plug 'joshdick/onedark.vim'	  " OneDarkPro Theme
Plug 'dylanaraps/wal.vim'     " Theme based on pywal scheme
Plug 'ryanoasis/vim-devicons'	  " File Icons
Plug 'vim-airline/vim-airline'	  " Status Bar
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-discord-rpc',
	\ 'coc-eslint',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-omnisharp',
	\ 'coc-pairs',
	\ 'coc-prettier',
	\ 'coc-pyright',
	\ 'coc-sh',
	\ 'coc-snippets',
	\ 'coc-spell-checker',
	\ 'coc-tslint',
	\ 'coc-tsserver',
	\ 'coc-vimlsp',
	\ 'coc-yaml',
\ ]
Plug 'metakirby5/codi.vim' " Live scratchpad
Plug 'sheerun/vim-polyglot'
" Plug '907th/vim-auto-save' 	  " Auto save files
Plug 'preservim/nerdtree'  	  " File Explorer
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'

call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set splitbelow splitright
set tabstop=4 softtabstop=2 expandtab shiftwidth=2 smarttab
set number wrap relativenumber
set signcolumn="yes"

filetype plugin indent on
syntax enable

colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE   " Make neovim transparent

let mapleader = ","

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif 
nnoremap <silent> <C-F> :NERDTreeToggle<CR>     "<C-W><C-w> 

" Enable Auto Save
" let g:auto_save = 1

" Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"  Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za 

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Markdown preview
nmap <leader>p <Plug>MarkdownPreviewToggle

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Open new files
noremap <C-n> :execute("FZF")<CR>

" Sorry bro
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" Shortcuts to reload and edit this file
nnoremap <silent> <leader><leader> :source $MYVIMRC<CR>
nnoremap <silent> <leader>e :tabnew $MYVIMRC<CR>

" NERDCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
nmap <leader>c <Plug>NERDCommenterToggle
vmap <leader>c <Plug>NERDCommenterToggle<CR>gv

" https://stackoverflow.com/a/2585673
function! CopyToClipBoard() range 
  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).' | xclip -selection clipboard')
endfunction

noremap <silent> <C-c> :call CopyToClipBoard()<CR> 
noremap <silent> <C-v> :r !xclip -o -selection clipboard<CR>
