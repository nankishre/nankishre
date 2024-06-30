local cmd = vim.cmd

cmd [[
call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/tokyonight.nvim'

call plug#end()
]]

vim.opt.termguicolors = true
require('nvim-tree').setup{}

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

local function set_theme_by_time()
    local hour = tonumber(os.date('%H'))
    if hour >= 6 and hour < 18 then
        vim.cmd('colorscheme tokyonight-day")
    elseif hour >= 18 and hour < 20 then
        vim.cmd('colorscheme tokyonight-storm')
    else
        vim.cmd('colorscheme tokyonight-night')
    end
end

set_theme_by_time()
