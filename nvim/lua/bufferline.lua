local M = {}

local get_hex = require("cokeline/utils").get_hex

function M.setup()
  local present, cokeline = pcall(require, "cokeline")
  if not present then
    return
  end

  local theme = require("kanagawa.colors").setup()
  local colors = {
    bg = "#16161d",
    purple = theme.oniViolet,
    light_purple = theme.springViolet1,
    gray = theme.fujiGray,
    red = theme.autumnRed,
    green = theme.autumnGreen,
  }

  cokeline.setup({
    show_if_buffers_are_at_least = 2,

    mappings = {
      cycle_prev_next = true,
    },

    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and colors.purple or colors.gray
      end,
      bg = "NONE",
      style = function(buffer)
        return buffer.is_focused and "bold" or nil
      end,
    },

    -- sidebar = {
    --   filetype = "NvimTree",
    --   components = {
    --     {
    --       text = function(buffer)
    --         return " "
    --       end,
    --     },
    --   },
    -- },
    --

    components = {
      {
        text = function(buffer)
          return buffer.index == 1 and " "
            or (buffer.is_focused and "" or " ")
        end,
        fg = colors.bg,
      },
      {
        text = function(buffer)
          return " " .. buffer.index
        end,
        style = function(buffer)
          return buffer.is_focused and "bold" or nil
        end,
        fg = function(buffer)
          return buffer.is_focused and colors.light_purple or colors.gray
        end,
        bg = function(buffer)
          return buffer.is_focused and colors.bg or "NONE"
        end,
      },
      {
        text = function(buffer)
          return "  " .. buffer.filename
        end,
        style = function(buffer)
          return "NONE"
        end,
        bg = function(buffer)
          return buffer.is_focused and colors.bg or "NONE"
        end,
      },
      {
        text = function(buffer)
          return buffer.is_modified and " 樂" or "  "
        end,
        fg = function(buffer)
          return buffer.is_focused and colors.green
        end,
        bg = function(buffer)
          return buffer.is_focused and colors.bg or "NONE"
        end,
      },
      {
        text = function(buffer)
          return buffer.is_focused and "" or " "
        end,
        fg = colors.bg,
      },
    },
  })
end

return M
