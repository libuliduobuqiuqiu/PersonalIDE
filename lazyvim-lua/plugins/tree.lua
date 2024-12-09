return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    table.insert(opts.open_files_do_not_replace_types, "spectre_panel")
    opts.filesystem.use_libuv_file_watcher = false
  end,
}
