require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
-- workaround for nextflow
-- vim.cmd [[au BufRead,BufNewFile *.nf setfiletype groovy]]
