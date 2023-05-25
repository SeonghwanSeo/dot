return {
  {"nvim-telescope/telescope.nvim",
    opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    mappings = {
      i = {
        ["<c-t>"] = function(...)
          return require("trouble.providers.telescope").open_with_trouble(...)
        end,
        ["<a-t>"] = function(...)
          return require("trouble.providers.telescope").open_selected_with_trouble(...)
        end,
        ["<C-j>"] = function(...)
          --return require("telescope.actions").cycle_history_next(...)
          return require("telescope.actions").move_selection_next(...)
        end,
        ["<C-k>"] = function(...)
          --return require("telescope.actions").cycle_history_prev(...)
          return require("telescope.actions").move_selection_previous(...)
        end,
        ["<C-f>"] = function(...)
          return require("telescope.actions").preview_scrolling_down(...)
        end,
        ["<C-b>"] = function(...)
          return require("telescope.actions").preview_scrolling_up(...)
        end,
        ["<Tab>"] = function(...)
          return require("telescope.actions").move_selection_next(...)
        end,
        ["<S-Tab>"] = function(...)
          return require("telescope.actions").move_selection_previous(...)
        end,
      },
      n = {
        ["q"] = function(...)
          return require("telescope.actions").close(...)
        end,
      },
    },
  },
}
--  defaults = {
--    file_previewer = previewers.vim_buffer_cat.new,
--    grep_previewer = previewers.vim_buffer_vimgrep.new,
--    qflist_previewer = previewers.vim_buffer_qflist.new,
--    buffer_previewer_maker = previewers.buffer_previewer_maker,
--    mappings = {
--      i = {
--        ["<C-h>"] = "select_horizontal",
--        ["<C-j>"] = "move_selection_next",
--        ["<C-k>"] = "move_selection_previous",
--        ["?"] = action_layout.toggle_preview,
--      },
--      n = {
--        ["<C-c>"] = "close"
--      }
--    },
--    sorting_strategy = "ascending"
--  },
--  pickers = {
--    git_files = {
--      theme = "dropdown",
--    },
--    find_files = {
--      layout_strategy="horizontal",
--    },
--    oldfiles = {
--      layout_strategy="horizontal",
--    },
--    grep_string = {
--      theme = "dropdown",
--    },
--    live_grep = {
--      theme = "dropdown",
--    },
--  },
}
}
