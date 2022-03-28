call plug#begin("~/.local/share/nvim/plugged")
Plug 'nvim-lua/plenary.nvim'                                " async for coroutines
Plug 'tweekmonster/startuptime.vim'                         " startup time tracker
Plug 'nathom/filetype.nvim'                                 " startup time improvement
Plug 'mhinz/vim-startify'                                   " startup screen
Plug 'lewis6991/impatient.nvim'                             " startup speed via binaries
Plug 'windwp/nvim-autopairs'                                " creates pairs for () {} []
Plug 'kqito/vim-easy-replace'                               " replace words under cursor/visual
Plug 'numToStr/Comment.nvim'                                " commenting
Plug 'sstallion/vim-cursorline'                             " only show cursorline on active window
Plug 'lukas-reineke/indent-blankline.nvim'                  " indentation guides
Plug 'rmagatti/goto-preview'                                " pop open definition in window
Plug 'RRethy/vim-illuminate'                                " highlight tokens under cursor
Plug 'supercrabtree/vim-resurrect'                          " reopen closed buffers
Plug 'pantharshit00/vim-prisma'                             " prisma syntax highlighting
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }             " closing buffers/windows
Plug 'cwqt/nvim-cokeline'                                   " bufferline
Plug 'folke/trouble.nvim'                                   " quickfix, doc errors etc.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " fuzzy finder
Plug 'junegunn/fzf.vim'                                     " fuzzy finder ui
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'stsewd/fzf-checkout.vim'                              " fuzzy finder switching branches
Plug 'machakann/vim-sandwich'                               " operations on text objects
Plug 'wellle/targets.vim'                                   " more text objects
Plug 'folke/todo-comments.nvim'                             " todo comment highlighting
Plug 'junegunn/vim-easy-align'                              " aligning characters
Plug 'ggandor/lightspeed.nvim'                              " better easymotion
Plug 'benstockil/twilight.nvim'                             " for demos
Plug 'rebelot/kanagawa.nvim'                                " color theme
Plug 'hoob3rt/lualine.nvim'                                 " status bar at the bottom
Plug 'kyazdani42/nvim-tree.lua' ", {'branch': 'feat/add-mark-capabilities'} 
Plug 'numToStr/FTerm.nvim'                                  " floating terminal
Plug 'folke/which-key.nvim'                                 " keybindings helper
Plug 'windwp/nvim-spectre'                                  " global search and replace
Plug 'mrjones2014/smart-splits.nvim'                        " sane split resizing/navigationj
Plug 'stevearc/dressing.nvim'
" treesitter --------------------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitting
Plug 'romgrk/nvim-treesitter-context'                       " context bar
Plug 'JoosepAlviste/nvim-ts-context-commentstring'          " embedded lang comment, jsx
Plug 'windwp/nvim-ts-autotag'                               " autoclose jsx/html tags
" git ---------------------------------------------
Plug 'tpope/vim-fugitive'                                   " git porcelain
Plug 'APZelos/blamer.nvim'                                  " git blame on cursor
Plug 'lewis6991/gitsigns.nvim'                              " git gutter
Plug 'sindrets/diffview.nvim'                               " git diff viewer
Plug 'ruifm/gitlinker.nvim'                                 " link to specific lines
Plug 'rhysd/conflict-marker.vim'                            " merge conflict markers
Plug 'OJFord/vim-quickfix-conflicts'                        " all conflicts in quickfix
" lsp --------------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp', { 'branch': 'dev' }                " autocomplete
Plug 'hrsh7th/cmp-vsnip'                                    " snippets completion integration
Plug 'hrsh7th/vim-vsnip'                                    " snippets engine
Plug 'rafamadriz/friendly-snippets'                         " snippets collection
Plug 'neovim/nvim-lspconfig'                                " language servers
Plug 'creativenull/efmls-configs-nvim'                      " efm formatters & linters
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'                 " ts lsp utils
" Plug 'ray-x/lsp_signature.nvim'                             " fn signature while typing
Plug 'onsails/lspkind-nvim'                                 " pictograms for completion menu
Plug 'j-hui/fidget.nvim'                                    " lsp loading indicator
Plug 'petertriho/nvim-scrollbar'                            " scrollbar with LSP error indicators
Plug 'weilbith/nvim-code-action-menu'                       " lsp code action menu
Plug 'kosayoda/nvim-lightbulb'                              " lsp code action highlight
" ------------------------------------------------
Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'} " share kitty split keybinds
call plug#end()

" cuts my load time from 120ms to 50ms
lua require('impatient')

set completeopt=menu,menuone,noselect
syntax on             " hi syntax
syntax sync minlines=256
set number            " show line numbers
set encoding=UTF-8    " character encoding
" set relativenumber    " relative line numbers
set noswapfile        " disable the swapfile
set hlsearch          " hi all results
set ignorecase        " ignore case in search
set smartcase         " don't ignore case if capital is used
set incsearch         " show search results as you type
set updatetime=750    " set time to wait before trigger git gutter
set tabstop     =2    " width of character
set softtabstop =2    " amount of whitespace
set shiftwidth  =2    " amount of whitespace in normal mode
set expandtab         " indent using spaces instead of tabs
set noshowmode        " hide --INSERT-- stuff
set mouse=a           " allow trackpad scrolling
set shell=/bin/dash   " use fastest shell
set nowrap
set cursorline        " hi line of cursor
set ignorecase        " ignore case in search
set so=999            " set cursor to always be in the center
set clipboard=unnamed " make yy add to system clipboard
set synmaxcol=128
set pumheight=5       " maximum number of items in completion popup
set splitbelow
set splitright
set foldlevelstart=99 " start file with all folds opened
set foldmethod=expr
" set list listchars=tab:>-

set nosm
" let g:loaded_matchparen=1

" change leaderkey to spacebar
" nnoremap <SPACE> <Nop>
let mapleader=" "
set timeoutlen=0 ttimeoutlen=0

" redraw on these events
autocmd VimResized,FocusGained * redraw
" move quickfix to bottom of window
autocmd FileType qf wincmd J
" enter insert mode when opening :terminal
autocmd TermOpen * startinsert
" autosave all buffers on focus loss
autocmd FocusLost * silent! wall
" exit terminal on double escape
tnoremap <silent> <C-[><C-[> <C-\><C-n>
" ci" don't yank
nnoremap c "_c
" maintain cursor position in buffers
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

lua require('main')

" pretty colours, must be set after main lua call
set termguicolors
colorscheme kanagawa
autocmd ColorScheme * hi! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme & hi! hi! NormalFloat guibg=#1f202b
" indentation marker colour
hi IndentBlanklineChar guifg=#2f303e gui=nocombine
" hi active line
hi illuminatedWord guibg=#1f202a
hi CursorLine guibg=#16161d
hi Search guibg=#21324a

highlight! link mkdLineBreak NONE

hi! Pmenu guibg=#1f202b guifg=#717168
hi! PmenuSel guibg=#2a2a37 guifg=#dcd7ba
set completeopt=menu,menuone,noselect

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

" easymotion labelling
let g:sneak#label = 1
" sane pasting in visual mode https://vi.stackexchange.com/a/25274
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'
" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source $MYVIMRC \| :PlugInstall \| :LuaCacheClear<CR>
" redo
noremap U <C-R>
" line wrap go to next line
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" disable arrow keys for movement
noremap <up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" reselect last selection
noremap gV `[v`]
" delete whole line from cursor
inoremap <A-Backspace> <C-o>d0
" hide hi from search
nnoremap <silent> _ :nohl<CR>
" recenter cursor
map <silent><leader>cc :set so=999 <CR>:set cursorline<CR>:set number<CR>

nmap <leader>rl :LspRestart<CR>
" search and replace
nnoremap <leader>sr :lua require('spectre').open()<CR>
" file tree sidebar key binding 
noremap <silent> <leader>b :NvimTreeToggle<CR>
nnoremap <silent> <leader>kk :silent !kitty @ set-spacing padding=0 margin=0<CR>
" disable irrating command history
nnoremap q: <nop>
nnoremap Q <nop>
" yank to end of line, like D
map Y y$
" super fast switch between last 2 buffers
nnoremap <leader><leader> <c-^>

" smart indent on i
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_cc"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" override Blines fzf to have a preview window
" command! -bang -nargs=* BLines
"     \ call fzf#vim#grep(
"     \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
"     \   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))
" escape to quit https://github.com/junegunn/fzf/issues/1393
" autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" create split and move to it
nnoremap <A-;> <C-w>v<C-w>l<CR>
nnoremap <A-'> <C-w>s<C-w>j<CR>
" change split dimensions
map <silent><A-H> :SmartResizeLeft 4<CR>
map <silent><A-J> :SmartResizeDown 2<CR>
map <silent><A-K> :SmartResizeUp 2<CR>
map <silent><A-L> :SmartResizeRight 4<CR>

" moving around splits, backwards and forwards
map <Tab> <C-W><C-W>
map <S-Tab> <C-W><S-W>

" visual mode align
xmap ga <Plug>(EasyAlign)

" quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" git conflicts quickfix menu
nnoremap <Leader>cx <cmd>call conflicts#PopulateConflicts() <bar> TroubleToggle quickfix<CR>

" git blame in cursor
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_delay = 500
let g:blamer_show_in_insert_modes = 0
let g:blamer_show_in_visual_modes = 0

" motion!
let g:lightspeed_no_default_keymaps = 1
nmap <silent> f <Plug>Lightspeed_omni_s

" change highlight marker colors
function! HighlightConflictMarker() abort
    highlight ConflictMarkerBegin guibg=#1e4428
    highlight ConflictMarkerOurs guibg=#13271e
    highlight ConflictMarkerTheirs guibg=#311b1f
    highlight ConflictMarkerEnd guibg=#552527
    highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
endfunction
autocmd VimEnter * call HighlightConflictMarker()

" moving between splits / kitty splits
let g:kitty_navigator_no_mappings = 1
nnoremap <silent> <a-h> :KittyNavigateLeft<cr>
nnoremap <silent> <a-j> :KittyNavigateDown<cr>
nnoremap <silent> <a-k> :KittyNavigateUp<cr>
nnoremap <silent> <a-l> :KittyNavigateRight<cr>

" background color
hi TabLineFill guibg=#0d1014

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

let g:scrollbar_excluded_filetypes = ['NvimTree']
let g:startify_custom_header = ""

" Lazy shift finger
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>

" delete html tags
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
  \   {
  \     'buns'    : ['TagInput(1)', 'TagInput(0)'],
  \     'expr'    : 1,
  \     'filetype': ['html'],
  \     'kind'    : ['add', 'replace', 'delete'],
  \     'action'  : ['add'],
  \     'input'   : ['t'],
  \   },
  \ ]

let g:code_action_menu_window_border = 'rounded'
let g:code_action_menu_show_details = v:false
let g:code_action_menu_show_diff = v:false

function! TagInput(is_head) abort
  if a:is_head
    let s:TagLast = input('Tag: ')
    if s:TagLast !=# ''
      let tag = printf('<%s>', s:TagLast)
    else
      throw 'OperatorSandwichCancel'
    endif
  else
    let tag = printf('</%s>', matchstr(s:TagLast, '^\a[^[:blank:]>/]*'))
  endif
  return tag
endfunction
