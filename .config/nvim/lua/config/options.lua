-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Установка прозрачного фона для NeoVim
-- vim.opt.winblend = 15 -- Прозрачность плавающих окон (0-100)
-- vim.opt.pumblend = 15 -- Прозрачность выпадающих меню (0-100)
-- vim.opt.background = "light" -- или 'dark', может влиять на видимость
if vim.env.SSH_TTY and not vim.g.remote_neovim_host then
  vim.g.clipboard = "osc52"
  vim.opt.clipboard = "unnamedplus"
end
