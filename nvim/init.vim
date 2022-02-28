call plug#begin("~/.local/share/nvim/plugged")
Plug 'nvim-lua/plenary.nvim'                                " async for coroutines
Plug 'tweekmonster/startuptime.vim'                         " startup time tracker
Plug 'nathom/filetype.nvim'                                 " startup time improvement
Plug 'mhinz/vim-startify'                                   " startup screen
Plug 'windwp/nvim-autopairs'                                " creates pairs for () {} []
Plug 'windwp/nvim-ts-autotag'                               " autocomplete
Plug 'petertriho/nvim-scrollbar'                            " scrollbar with LSP error indicators
Plug 'kqito/vim-easy-replace'                               " replace words under cursor/visua
Plug 'numToStr/Comment.nvim'                                " commenting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'          " embedded lang comment, jsx
" git ---------------------------------------------
Plug 'TimUntersberger/neogit'                               " magit clone
Plug 'APZelos/blamer.nvim'                                  " git blame on cursor
Plug 'lewis6991/gitsigns.nvim'                              " git gutter
Plug 'sindrets/diffview.nvim'                               " git disf viewer
Plug 'ruifm/gitlinker.nvim'                                 " link to specific lines
" ------------------------------------------------
Plug 'rktjmp/lush.nvim'                                     " styling for gruvbox
Plug 'sstallion/vim-cursorline'                             " only show cursorline on active window
Plug 'lukas-reineke/indent-blankline.nvim'                  " indentation guides
Plug 'rhysd/conflict-marker.vim'                            " merge conflict markers
Plug 'windwp/nvim-spectre'                                  " global search and replace
Plug 'kosayoda/nvim-lightbulb'                              " code action hiing
Plug 'rmagatti/goto-preview'                                " pop open definition in window
Plug 'OJFord/vim-quickfix-conflicts'                        " all conflicts in quickfix
Plug 'RRethy/vim-illuminate'                                " highlight tokens under cursor
Plug 'numToStr/FTerm.nvim'                                  " floating terminal
Plug 'cwqt/nvim-code-action-menu'                           " code action menu
" lsp --------------------------------------------
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'Iron-E/nvim-cmp'                                      " autocomplete
Plug 'hrsh7th/cmp-vsnip'                                    " snippets completion integration
Plug 'hrsh7th/vim-vsnip'                                    " snippets engine
Plug 'rafamadriz/friendly-snippets'                         " snippets collection
Plug 'neovim/nvim-lspconfig'                                " language servers
Plug 'creativenull/efmls-configs-nvim'                      " efm formatters & linters
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'                 " ts lsp utils
Plug 'ray-x/lsp_signature.nvim'                             " fn signature while typing
Plug 'onsails/lspkind-nvim'                                 " pictograms for completion menu
Plug 'j-hui/fidget.nvim'                                    " lsp loading indicator
" ------------------------------------------------
Plug 'supercrabtree/vim-resurrect'                          " reopen closed buffers
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitting
Plug 'romgrk/nvim-treesitter-context'                       " context bar
Plug 'hoob3rt/lualine.nvim'                                 " status bar at the bottom
Plug 'pantharshit00/vim-prisma'                             " prisma syntax highlighting
Plug 'romgrk/barbar.nvim'                                   " tab/buffer top bar
Plug 'folke/trouble.nvim'                                   " quickfix, doc errors etc.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " fuzzy finder
Plug 'junegunn/fzf.vim'                                     " fuzzy finder ui
Plug 'nvim-lua/popup.nvim'                                  " fuzzy finder & overlay
Plug 'yuttie/comfortable-motion.vim'                        " smooth scrolling, C-d C-u
Plug 'machakann/vim-sandwich'                               " allows for ci( etc.
Plug 'rebelot/kanagawa.nvim'                                " color theme
Plug 'folke/todo-comments.nvim'                             " todo comment highlighting
Plug 'folke/which-key.nvim'                                 " keybindings helper
Plug 'lewis6991/impatient.nvim'                             " faster startup via binaries
Plug 'kyazdani42/nvim-tree.lua'                             " file tree
Plug 'junegunn/vim-easy-align'                              " aligning characters
Plug 'ggandor/lightspeed.nvim'                              " better easymotion
Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'} " share kitty split keybinds
call plug#end()

" cuts my load time from 120ms to 50ms
lua require('impatient')

set completeopt=menu,menuone,noselect
syntax on             " hi syntax
syntax sync minlines=256
set number            " show line numbers
set encoding=UTF-8    " character encoding
set relativenumber    " relative line numbers
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
hi! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
hi! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
hi! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
hi! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
hi! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
hi! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
hi! CmpItemKindFunction guibg=NONE guifg=#C586C0
hi! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
hi! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
hi! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
hi! CmpItemKindUnit guibg=NONE guifg=#D4D4D4

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
" git mappings
nmap <leader>ng :Neogit kind=split<CR>
nmap <leader>nc :Neogit commit<CR>
nmap <leader>df :lua DiffviewToggle()<CR>

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
command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}, 'right:50%'))

" fuzzy finder
noremap <silent> <leader>p :FZF<CR>
nnoremap <silent> <leader>f :Rg<CR>
nnoremap <silent> <leader>l :BLines<cr>
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" autocmd! FileType fzf
" autocmd  FileType fzf set laststatus=0 noshowmode noruler nonumber nornu
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number

" let g:fzf_layout = { 'down': '40%' }
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'top' } }
" escape to quit https://github.com/junegunn/fzf/issues/1393
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" create split and move to it
nnoremap <A-;> <C-w>v<C-w>l<CR>
nnoremap <A-'> <C-w>s<C-w>j<CR>
" change split dimensions
map <A-H> :vertical resize +4<CR>
map <A-J> :resize -2<CR>
map <A-K> :resize +2<CR>
map <A-L> :vertical resize -4<CR>

" moving around splits, backwards and forwards
map <Tab> <C-W><C-W>
map <S-Tab> <C-W><S-W>

" quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

" git conflicts quickfix menu
nnoremap <Leader>co <cmd>call conflicts#PopulateConflicts() <bar> TroubleToggle quickfix<CR>

" trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" context
nnoremap <leader>cx <cmd>TSContextToggle<cr>

" tabline -----------------------------------------------------------------
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:false
let bufferline.icon_separator_inactive = ''
let bufferline.icon_separator_active = ''
let bufferline.closable = v:false
let bufferline.animation = v:false
let bufferline.maximum_padding = 2
let bufferline.minimum_padding = 2
let bufferline.auto_hide = v:true

" separator color
hi BufferTabpageFill guibg=#0d1014
" active
hi BufferCurrent guibg=#0d1014
hi BufferCurrentIndex guibg=#0d1014 guifg=#957FB8
hi BufferCurrentSign guibg=#0d1014
hi BufferCurrentMod guibg=#0d1014 guifg=#FF9E3B

hi BufferVisible guibg=#0d1014 guifg=#727169
hi BufferVisibleSign guibg=#0d1014 guifg=#727169
hi BufferVisibleIndex guibg=#0d1014 guifg=#727169
hi BufferVisibleMod guibg=#0d1014 guifg=#B35200

hi BufferInactive guibg=#0d1014 guifg=#727169
hi BufferInactiveSign guibg=#0d1014 guifg=#727169
hi BufferInactiveIndex guibg=#0d1014 guifg=#727169
hi BufferInactiveMod guibg=#0d1014 guifg=#B35200

" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Open and close a buffer
nnoremap <silent>    <A-n> :enew<CR>
nnoremap <silent>    <A-w> :BufferClose<CR>
nnoremap <silent>    <A-W> :Resurrect<CR>
nnoremap <silent>    <A-x> :BufferCloseAllButCurrent<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
" kitty sends a raw hashtag for A-3
nnoremap <silent>    # :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" sneak-like select buffer
nnoremap <silent>    <A-s> :BufferPick<CR>

" visual mode align
xmap ga <Plug>(EasyAlign)


" git blame in cursor
let g:blamer_enabled = 1
let g:blamer_relative_time = 1
let g:blamer_delay = 500
let g:blamer_show_in_insert_modes = 0
let g:blamer_show_in_visual_modes = 0

" motion!
let g:lightspeed_no_default_keymaps = 1
nmap <silent> f <Plug>Lightspeed_omni_s
nmap <silent> <C-f> <Plug>Lightspeed_omni_s

function! HighlightConflictMarker() abort
    highlight ConflictMarkerBegin guibg=#1e4428
    highlight ConflictMarkerOurs guibg=#13271e
    highlight ConflictMarkerTheirs guibg=#311b1f
    highlight ConflictMarkerEnd guibg=#552527
    highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
endfunction
" call timer_start(200, { tid -> execute('call HighlightConflictMarker()') })
autocmd VimEnter * call HighlightConflictMarker()

let g:kitty_navigator_no_mappings = 1

nnoremap <silent> <a-h> :KittyNavigateLeft<cr>
nnoremap <silent> <a-j> :KittyNavigateDown<cr>
nnoremap <silent> <a-k> :KittyNavigateUp<cr>
nnoremap <silent> <a-l> :KittyNavigateRight<cr>

" goto preview
nnoremap gp <cmd>lua require('goto-preview').goto_preview_definition()<CR>
nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>

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

