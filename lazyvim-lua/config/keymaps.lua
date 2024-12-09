-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('v', 'jk', '<Esc>')

-- Goto Mark
vim.keymap.set('n', 'M', "'")

-- Delete Mark
vim.keymap.set('n', 'dm', '<cmd>lua DelMark()<cr>', { noremap = true, silent = true })
function DelMark()
  local mark = vim.fn.input('')
  vim.cmd('delmarks ' .. mark)
end
