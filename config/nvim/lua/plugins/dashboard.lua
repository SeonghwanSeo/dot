-- Dashboard
require('dashboard').setup {
  theme = 'hyper',
  config = {
    shortcut = {
      -- action can be a function type
      { desc = " Recents", group = 'Telescope', key = 'r', action = 'Telescope oldfiles'},
      { desc = " Find File", group = 'Telescope', key = 'f', action = 'Telescope find_files'},
      { desc = " Find Word", group = 'Telescope', key = 'w', action = 'Telescope live_grep'},
      { desc = " New File", group = 'Default', key = 'n', action = 'DashboardNewFile'},
      { desc = " Update Plugins", group = 'Default', key = 'u', action = 'PackerUpdate'},
      { desc = " Exit", group = 'Default', key = 'q', action = 'exit'},
    },
    packages = { enable = true }, -- show how many plugins neovim loaded
  } 
}
