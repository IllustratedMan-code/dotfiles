local myfunctions = {}

function myfunctions.findConfig()
  require('telescope.builtin').find_files {
    winblend = 5,
    border = true,
    cwd = '~/.config/nvim',
  }
end

return myfunctions

