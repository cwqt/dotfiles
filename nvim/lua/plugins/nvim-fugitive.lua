local M = {}

M.setup = function()
  vim.api.nvim_create_user_command('FugitiveFloat', function()
    ui = vim.api.nvim_list_uis()[1]

    local width = math.floor(ui.width * 0.5)
    local height = math.floor(ui.height * 0.5)

    local win_config = {
      relative = 'editor',
      width = width,
      height = height,
      col = (ui.width - width) / 2,
      row = (ui.height - height) / 2,
      style = 'minimal',
      focusable = true,
      border = 'single',
    }

    if not fugitive_float_bufnr then
      fugitive_float_bufnr = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_open_win(fugitive_float_bufnr, true, win_config)
      vim.cmd ':Gedit :'
    elseif vim.api.nvim_win_get_buf(0) == fugitive_float_bufnr then
      vim.api.nvim_command 'hide'
    else
      print '1234'
      vim.api.nvim_open_win(fugitive_float_bufnr, true, win_config)
      vim.cmd ':Gedit :'
    end
  end, {})

  vim.cmd [[
"nmap <silent><leader>gg :FugitiveFloat<CR>
nmap <silent><leader>gg :tab G<CR>
nmap <silent><leader>gc :Git commit<CR>
nmap <silent><leader>gp :Git push<CR>

nmap <silent><leader>gfa :Git fetch --all<CR>
nmap <silent><leader>gfp :Git push --force<CR>

nmap <silent><leader>gR :Git rebase -i dev<CR>
  ]]
end

return M
