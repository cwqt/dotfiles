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
    yellow = theme.autumnYellow,
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
      -- tab start
      -- {
      --   text = function(buffer)
      --     if buffer.is_focused then
      --       activeIndex = buffer.index
      --     end
      --
      --     if buffer.is_first then
      --       return " "
      --     end
      --
      --     if buffer.is_focused then
      --       return ""
      --     end
      --
      --     if activeIndex and (buffer.index > activeIndex) then
      --       return ""
      --     end
      --
      --     return " "
      --   end,
      --   fg = colors.bg,
      --   bg = "NONE",
      -- },
      { text = " " },
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
            return "* "
          end
          return " "
        end,
        fg = function(buffer)
          if buffer.diagnostics.errors > 0 then
            return colors.red
          end
          if buffer.is_modified then
            return colors.yellow
          end
          return "NONE"
        end,
      },
      { text = " " },
      -- tab end
      -- {
      --   text = function(buffer)
      --     if buffer.is_focused then
      --       return ""
      --     end
      --
      --     if activeIndex and (buffer.index < activeIndex) then
      --       return ""
      --     end
      --
      --     return " "
      --   end,
      --   fg = colors.bg,
      --   bg = "NONE",
      -- },
    },
  })

  vim.cmd([[
" Move to previous/next
nnoremap <silent>    <A-,> <Plug>(cokeline-focus-prev)<CR>
nnoremap <silent>    <A-.> <Plug>(cokeline-focus-next)<CR>
nnoremap <silent>    <A->> <Plug>(cokeline-switch-prev)<CR>
nnoremap <silent>    <A-<> <Plug>(cokeline-switch-next)<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Plug>(cokeline-focus-1)<CR>
nnoremap <silent>    <A-2> <Plug>(cokeline-focus-2)<CR>
" kitty sends a raw hashtag for A-3
nnoremap <silent>    # <Plug>(cokeline-focus-3)<CR>
nnoremap <silent>    <A-4> <Plug>(cokeline-focus-4)<CR>
nnoremap <silent>    <A-5> <Plug>(cokeline-focus-5)<CR>
nnoremap <silent>    <A-6> <Plug>(cokeline-focus-6)<CR>
nnoremap <silent>    <A-7> <Plug>(cokeline-focus-7)<CR>
nnoremap <silent>    <A-8> <Plug>(cokeline-focus-8)<CR>
nnoremap <silent>    <A-8> <Plug>(cokeline-focus-9)<CR>
" sneak-like select buffer
nnoremap <silent>    <A-s> <Plug>(cokeline-pick-focus)<CR>
]])
end

return M
