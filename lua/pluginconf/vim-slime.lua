vim.g.slime_target = "tmux"
vim.g.slime_paste_file = "$HOME/.slime_paste"

local ft = vim.bo.filetype
if (
  ft == "python" or
  ft == "sh" or
  ft == "julia" or
  ft == "r"
  ) then
  vim.g.slime_cell_delimiter = "# %%"
elseif (ft == "javascript") then
  vim.g.slime_cell_delimiter = "// %%"
elseif (
    ft == "lua" or
    ft == "haskell"
    ) then
  vim.g.slime_cell_delimiter = "-- %%"
end
