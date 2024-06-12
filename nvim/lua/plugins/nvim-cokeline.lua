local map = require("utils.map")

local M = {}

local get_hex = require("cokeline/utils").get_hex

function M.setup()
  local cokeline = require("cokeline")
  local oxocarbon = require("oxocarbon").oxocarbon

  local colors = {
    bg = "#16161d",
    purple = oxocarbon.base14,
    light_purple = oxocarbon.base15,
    gray = oxocarbon.base03,
    red = oxocarbon.base02,
    green = oxocarbon.base13,
    yellow = oxocarbon.base00,
  }

  -- append space
  local activeIndex = nil

  cokeline.setup({
    show_if_buffers_are_at_least = 2,

    mappings = {
      cycle_prev_next = true,
    },

    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and colors.purple or colors.gray
      end,
      bg = function(buffer)
        return buffer.is_focused and colors.bg or "NONE"
      end,
      style = function(buffer)
        return buffer.is_focused and "bold" or nil
      end,
    },

    components = {
      { text = " " },
      {
        text = function(buffer)
          return " " .. buffer.index
        end,
        style = function(buffer)
          return buffer.is_focused and "bold" or nil
        end,
        fg = function(buffer)
          return buffer.is_focused and colors.purple or colors.gray
        end,
      },
      {
        text = function(buffer)
          return "  " .. buffer.filename
        end,
        style = "NONE",
      },
      -- status indicator
      {
        style = "NONE",
        text = function(buffer)
          if buffer.diagnostics.errors > 0 then
            return "* "
          end
          if buffer.is_modified then
            return "*"
          end
          return " "
        end,
        fg = function(buffer)
          if buffer.diagnostics.errors > 0 then
            return colors.red
          end
          if buffer.is_modified then
            return colors.gray
          end
          return "NONE"
        end,
      },
      { text = " " },
    },
  })

  -- Move to previous/next
  map("n", "<A-,>", "<Plug>(cokeline-focus-prev)")
  map("n", "<A-.>", "<Plug>(cokeline-focus-next)")
  map("n", "<A->>", "<Plug>(cokeline-switch-prev)")
  map("n", "<A-<>", "<Plug>(cokeline-switch-prev)")

  -- Goto buffer in position...
  map("n", "<A-1>", "<Plug>(cokeline-focus-1)")
  map("n", "<A-2>", "<Plug>(cokeline-focus-2)")
  -- kitty sends a raw hashtag for A-3
  map("n", "#", "<Plug>(cokeline-focus-3)")
  map("n", "<A-4>", "<Plug>(cokeline-focus-4)")
  map("n", "<A-5>", "<Plug>(cokeline-focus-5)")
  map("n", "<A-6>", "<Plug>(cokeline-focus-6)")
  map("n", "<A-7>", "<Plug>(cokeline-focus-7)")
  map("n", "<A-8>", "<Plug>(cokeline-focus-8)")
  map("n", "<A-9>", "<Plug>(cokeline-focus-9)")
end

return M
