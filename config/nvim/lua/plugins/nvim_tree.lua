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
          ignored = 'i',
          deleted = '-',
        }
      },
    }
  },
  git = {
    ignore=false
  },
  update_focused_file = {
      enable=true,
      update_root = true
  }
})
