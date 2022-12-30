local map = require("utils.map")

local M = {}

M.setup = function()
  local dap = require("dap")

  -- Register languages
  local go = require("plugins.dap.golang")
  dap.adapters.go = go.adapter
  dap.configurations.go = go.configuration

  -- Setup UI
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
     remove = "d",
      edit = "e",
      repl = "r",
      toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7"),
    sidebar = {
      -- You can change the order of elements in the sidebar
      elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        {
          id = "scopes",
          size = 0.25, -- Can be float or integer > 1
        },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 00.25 },
      },
      size = 40,
      position = "left", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
      elements = { "repl" },
      size = 10,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = "single", -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    },
  })

  map("n", "<leader>D", ":lua require('dapui').toggle()<CR>")
  map("n", "<leader>B", ":lua require('dap').toggle_breakpoint()<CR>")
  map("n", "<leader>C", ":lua require('dap').continue()<CR>")
  map("n", "<leader>]", ":lua require('dap').step_into()<CR>")
  map("n", "<leader>[", ":lua require('dap').step_out()<CR>")
  map("n", "<leader>-", ":lua require('dap').step_over()<CR>")
  map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>")

  map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>")
  map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>")

  map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>")
  map(
    "n",
    "<Leader>duf",
    ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>"
  )

  map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>")
  map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>")

  map(
    "n",
    "<Leader>dbc",
    ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>"
  )
  map(
    "n",
    "<Leader>dbm",
    ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>"
  )
  map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>")
end

return M
