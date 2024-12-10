return {
  {
    "gh-liu/fold_line.nvim",
    event = "VeryLazy",
    init = function()
      -- change the char of the line, see the `Appearance` section
      vim.g.fold_line_char_top_close = "+" -- default: fillchars.foldclose or "+"
      vim.g.fold_line_char_close = "├" -- default: fillchars.vertright or "├"
      vim.g.fold_line_char_open_sep = "│" -- default: fillchars.foldsep or "│"

      vim.g.fold_line_char_open_start = "╭"
      vim.g.fold_line_char_open_end = "╰"
      vim.api.nvim_set_hl(0, "FoldLine", { link = "NonText" })
      vim.api.nvim_set_hl(0, "FoldLineCurrent", { default = true, link = "Folded" })
    end,
  }
}
