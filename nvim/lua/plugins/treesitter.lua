require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  }
}
-- workaround for nextflow
vim.cmd [[au BufRead,BufNewFile *.nf setfiletype groovy]]
