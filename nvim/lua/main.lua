-- Core -----------------------------------------
require("core.main").setup()
require("core.bufferline").setup()
require("core.file-tree").setup()
require("core.statusline").setup()
require("core.tree-sitter").setup()
require("core.keymaps").setup()
require("core.autocommands").setup()
require("core.tree-sitter").setup()
require("lsp.main").setup()
-- Plugins ---------------------------------------
require("plugins.comment").setup()
require("plugins.filetype").setup()
require("plugins.fterm").setup()
require("plugins.indent-blankline").setup()
require("plugins.scrollbar").setup()
require("plugins.todo-comments").setup()
require("plugins.trouble").setup()
require("plugins.twilight").setup()
require("plugins.which-key").setup()
require("plugins.nvim-lightbulb").setup()
require("plugins.vim-yoink").setup()
require("plugins.goto-preview").setup()
require("plugins.nvim-spectre").setup()
-- require("plugins.dap.main").setup()

vim.cmd("colorscheme kanagawa")

-- Diffview has to be called before applying themem
require("core.git").setup()

require("spellsitter").setup()
require("stabilize").setup()
