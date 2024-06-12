" use vim-surroud keybinds, e.g. sd" is now ds"
" saa{} is now ysa{}
runtime macros/sandwich/keymap/surround.vim

map <leader>p <Plug>(miniyank-startput)
set laststatus=3      " global statusline
syntax on             " hi syntax
syntax sync minlines=256
syntax sync maxlines=256
set synmaxcol=250
set cmdheight=0       " hide cmd line
set shell=/bin/dash   " use fastest shell
set nonumber          " hide line numbers
set encoding=UTF-8    " character encoding
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
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
set nowrap
set cursorline        " hi line of cursor
set ignorecase        " ignore case in search
set so=30             " set cursor to always be in the center
set clipboard=unnamed " make yy add to system clipboard
set synmaxcol=128
set pumheight=5       " maximum number of items in completion popup
set splitbelow
set splitright
" always have 1 column space on left
set signcolumn=yes
set foldlevelstart=99 " start file with all folds opened
" tree-sitter folding
set foldmethod=manual
" set foldexpr=nvim_treesitter#foldexpr()
" disable horizontal mouse scrolling
set mousescroll=ver:5,hor:0
" stop screen jumping about
set splitkeep=screen

" change leaderkey to spacebar
let mapleader=" "
set timeoutlen=0 ttimeoutlen=0

" hide cursor line on non-active splits
augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" fast save
nnoremap <leader><leader> :w<CR>

" use same version of node  - npm root -g
let g:node_host_prog = '/Users/cass/.local/share/nvm/v18.19.0/lib/node_modules'

" redraw on these events
autocmd VimResized,FocusGained * redraw
" move quickfix to bottom of window
autocmd FileType qf wincmd J
" enter insert mode when opening :terminal
autocmd TermOpen * startinsert
" autosave all buffers on focus loss
autocmd FocusLost * silent! wall
" ci" don't yank
nnoremap c "_c

" pretty colours, must be set after main lua call
set termguicolors
autocmd ColorScheme * hi! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme & hi! hi! NormalFloat guibg=#1f202b
" indentation marker colour
hi IndentBlanklineChar guifg=#2f303e gui=nocombine
" hi active line
hi illuminatedWord guibg=#1f202a
hi CursorLine guibg=#16161d
hi Search guibg=#21324a

highlight! link mkdLineBreak NONE

" plumbline colours
" set completeopt=menu,noinsert
highlight! Pmenu            guibg=#16161d
highlight! PmenuSbar        guibg=#16161d
highlight! PmenuThumb       guibg=#2d2f3d

" highlight! PmenuThumb       guibg=#6b6b8d 
" highlight! PmenuSel         guibg=#6b6b8d guifg=#16161d gui=Bold
highlight! PmenuSel         guibg=#947fb8 guifg=#16161d gui=Bold

" easymotion labelling
let g:sneak#label = 1
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" sane pasting in visual mode https://vi.stackexchange.com/a/25274
xnoremap <expr> p 'pgv"'.v:register.'y`>'
xnoremap <expr> P 'Pgv"'.v:register.'y`>'
" redo
nnoremap U <C-R>
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

" search and replace
nnoremap <leader>sr :lua require('spectre').open()<CR>
" disable irrating command history
nnoremap q: <nop>
nnoremap Q <nop>
" yank to end of line, like D
map Y y$
" super fast switch between last 2 buffers
" nnoremap <leader><leader> <c-^>

" smart indent on i
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_cc"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" split movement
nnoremap <silent> <a-h> <C-W><C-H>
nnoremap <silent> <a-j> <C-W><C-J>
nnoremap <silent> <a-k> <C-W><C-K>
nnoremap <silent> <a-l> <C-W><C-L>
" backwards and forwards
map <Tab> <C-W><C-W>
map <S-Tab> <C-W><S-W>
" create split and move to it
nnoremap <A-;> <C-w>v<C-w>l<CR>
nnoremap <A-'> <C-w>s<C-w>j<CR>
" change split dimensions
map <silent><A-H> :SmartResizeLeft 4<CR>
map <silent><A-J> :SmartResizeDown 2<CR>
map <silent><A-K> :SmartResizeUp 2<CR>
map <silent><A-L> :SmartResizeRight 4<CR>

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

" lightspeed motions
let g:lightspeed_no_default_keymaps = 1
nmap s <Plug>Lightspeed_omni_s
xmap s <Plug>Lightspeed_omni_s

" change highlight marker colors
function! HighlightConflictMarker() abort
    highlight ConflictMarkerBegin guibg=#1e4428
    highlight ConflictMarkerOurs guibg=#13271e
    highlight ConflictMarkerTheirs guibg=#311b1f
    highlight ConflictMarkerEnd guibg=#552527
    highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
endfunction
autocmd VimEnter * call HighlightConflictMarker()

" open a terminal as a tab
nnoremap <silent> <leader>t :terminal fish<cr>
"tnoremap <Esc> <C-\><C-n>
" exit terminal on double escape
tnoremap <silent> <C-[><C-[> <C-\><C-n>


" close the terminal when process ended
autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')
" quake style terminal
nnoremap <silent><A-i> :Nuake<CR>
inoremap <silent><A-i> <C-\><C-n>:Nuake<CR>
tnoremap <silent><A-i> <C-\><C-n>:Nuake<CR>
let g:nuake_shell="/opt/homebrew/bin/fish"
let g:nuake_size=0.5


" background color
hi TabLineFill guibg=#0d1014

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Lazy shift finger
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
" Quick close all forced
command Q qa!

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


let g:codi#aliases = {
\ 'ts': 'typescript',
\ }

au BufRead,BufNewFile *.md setlocal textwidth=80

" Jump forward or backward on snippets
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" use correct highlighting for .env files
autocmd BufNewFile,BufReadPost .env* set syntax=bash

" next / prev fold
nnoremap <silent> [z zk
nnoremap <silent> ]z zj

" quick close all
nnoremap <silent> <leader>q :x<CR>
nnoremap <silent> <leader>Q :qa!<CR>

" Diffview empty gaps
set fillchars+=diff:╱

" folds background
"hi Folded guibg=#16161d

" fzf.nvim config
"let $FZF_DEFAULT_OPTS = "--color=dark --keep-right --marker=+ --margin=0,0 --padding=0,0 --prompt='' --info=hidden"
"let g:fzf_layout = { 'down': '40%' }
"let g:fzf_preview_window = []
"let g:fzf_statusline = 0
"let g:fzf_nvim_statusline = 0
"map <silent><leader>p :Files<CR>
"map <silent><leader>f :Rg<CR>

" change directory to current file
nnoremap <silent><leader>cd :cd %:p:h<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" cx highlight
highlight ExchangeRegion gui=underline guibg=#223249

" wall of text issue in husky hooks
let g:fugitive_pty = 0


