return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      on_colors = function(colors)
        colors.green = "#fcd9b8"
      end,
      on_highlights = function(hl, c)
        hl.String = { fg = c.green }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
