-- empty setup using defaults

require("nvim-tree").setup({
  renderer = {
    icons = {
      webdev_colors = false,
      show = {
        file = false,
        folder_arrow=false,
      },
      git_placement = 'after',
      glyphs = {
        git = {
          untracked = '+',
          ignored = ' ',
          deleted = '-',
        }
      },
    }
  }  
})
