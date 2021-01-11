call plug#begin()

" THEMES
Plug 'joshdick/onedark.vim'	  " OneDarkPro Theme
Plug 'ryanoasis/vim-devicons'	  " File Icons
Plug 'vim-airline/vim-airline'	  " Status Bar
Plug 'vim-airline/vim-airline-themes'

" Coc
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
let g:coc_global_extensions = [
	\ 'coc-css',
	\ 'coc-discord-rpc',
	\ 'coc-docker',
	\ 'coc-eslint',
	\ 'coc-emmet',
	\ 'coc-git',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-lists',
	\ 'coc-lua',
	\ 'coc-marketplace',
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

Plug 'sheerun/vim-polyglot'
Plug 'xabikos/vscode-react'	  	

" UTILS

Plug '907th/vim-auto-save' 	  " Auto save files
Plug 'preservim/nerdtree'  	  " File Explorer
Plug 'kien/ctrlp.vim'             " File Finder

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
 " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

" Start NERDTree and put the cursor back in the other window if file opened
autocmd VimEnter * NERDTree | if argc() != 0 | wincmd p | endif


" Exit Vim if NERDTree is the only window left.
 autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif 

" Enable Auto Save
let g:auto_save = 1

" Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

"  Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za 


" Tabs
au BufNewFile,BufRead *.js,*.jsx,*.ts,*.tsx set
    \ tabstop=4
    \ shiftwidth=4
    \ softtabstop=4
    \ expandtab

au BufNewFile,BufRead *.p set 
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79 
    \ expandtab 
    \ autoindent
    \ fileformat=unix
    

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" CocSpellCheck
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
