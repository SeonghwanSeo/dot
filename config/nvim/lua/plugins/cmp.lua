return {
  {"hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
  },
  opts = function()
  local cmp = require("cmp")
  local cmp_types = require("cmp.types")
  return {
    preselect = cmp.PreselectMode.None,
    completion = {
      completeopt = "menu,menuone,noselect,noinsert",
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-e>'] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<S-CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp",
        entry_filter = function(entry, ctx)
          return cmp_types.lsp.CompletionItemKind[entry:get_kind()] ~= 'File'
        end
      },
      { name = "path" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            local cur_buf = vim.api.nvim_get_current_buf()
            local cur_byte_size = vim.api.nvim_buf_get_offset(cur_buf, vim.api.nvim_buf_line_count(cur_buf))
            if cur_byte_size > 1024 * 1024 then -- 1 Megabyte max
              return {}
            end

            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
              if byte_size < 1 * 1024 * 1024 then -- 1 Megabyte max
                bufs[buf] = true
              end
            end
            return vim.tbl_keys(bufs)
          end
        }
      },
    }),
    formatting = {
      format = function(entry, item)
        local icons = require("lazyvim.config").icons.kinds
        if icons[item.kind] then
          item.kind = icons[item.kind] .. item.kind
        end
        item.menu = ({
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          path = "[Path]",
          cmdline = "[CMD]"
        })[entry.source.name]
        return item
      end,
    },
    experimental = {
      ghost_text = {
        hl_group = "LspCodeLens",
      },
    },
    cmdline = {'/',
      {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          {{ name = 'path' }},
          {{ name = 'cmdline' }}
        })
      }
    },
  }
  end,

}
}
