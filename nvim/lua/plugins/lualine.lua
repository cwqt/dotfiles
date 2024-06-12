local background = "#16161d"

local M = {}

M.setup = function()
  local oxocarbon = require("oxocarbon.lualine")

  require("noice").setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,       -- use a classic bottom cmdline for search
      command_palette = true,     -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,         -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,     -- add a border to hover docs and signature help
    },
  })



  require("lualine").setup({
    extensions = {
      "nvim-tree",
      "fzf",
      "fugitive",
    },
    options = {
      icons_enabled = false,
      component_separators = "",
      theme = oxocarbon,
      disabled_filetypes = { "DiffviewFiles", "fzf", "DiffviewFileHistory" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = string.lower,
        },
      },
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          color = { bg = background },
        },
      },
      lualine_x = {
        -- {
        --   "filetype",
        --   color = { bg = background },
        -- },
        {
          require("noice").api.status.message.get_hl,
          cond = require("noice").api.status.message.has,
        },
        {
          require("noice").api.status.command.get,
          cond = require("noice").api.status.command.has,
          -- color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.mode.get,
          cond = require("noice").api.status.mode.has,
          -- color = { fg = "#ff9e64" },
        },
        {
          require("noice").api.status.search.get,
          cond = require("noice").api.status.search.has,
          -- color = { fg = "#ff9e64" },
        },
      },
      lualine_y = {
        "diff",
        "branch",
      },
    },
  })
end

return M
