## NeoVim Manual
### Base
#### 光标
| Key | Description | Mode |
| --- | --- | --- |
| ctrl + o | 光标跳转(回到上一次光标所在位置) | n |
| ctrl + i | 光标跳转（回到返回前的光标所在位置） |  |

#### Mark
| Key | Description | Mode |
| --- | --- | --- |
| m + <a-z>（本文件）<A-Z）（缓冲区) | Mark标记 | n |
| M + <a-z> | 跳转Mark标记 | n |
| dm + <a-z> | 取消Mark标记 | n |

Keymap映射：
```lua
-- Goto Mark
vim.keymap.set('n', 'M', "'")

-- Delete Mark
vim.keymap.set('n', 'dm', '<cmd>lua DelMark()<cr>', { noremap = true, silent = true })
function DelMark()
  local mark = vim.fn.input('')
  vim.cmd('delmarks ' .. mark)
end
```
#### Buffer
| Key | Description | Mode |
| --- | --- | --- |
| <leader> bd | 关闭buffer | n |
| <S-hj> | 切换buffer | n |
| <leader> bp | 固定buffer | n |
| <leader> bP | 除固定的buffer全部删除 | n |

### Neo-tree
目录列表操作:

| Key | Description | Mode |
| --- | --- | --- |
| <S-h> | (在树形列表中）打开隐藏文件 | n |
| <leader> e | 打开当前文件树 | n |

### Mini
注释：gcc
### LSP
| Key | Description | Mode |
| --- | --- | --- |
| <leader> cl | LSPInfo | n |

lsp 插件:

- gopls(go LSP)
- pyright(python LSP)
### Formatting
参考链接：
> [https://www.lazyvim.org/extras/formatting/black](https://www.lazyvim.org/extras/formatting/black)


格式化Python代码：

1. 通过:LazyExtras启用对应格式化插件formatting
2. 通过Mason下载对应Formatting配置（black）
3. 定位到confirm.nvim配置目录下，/root/.local/share/nvim/lazy/conform.nvim/lua/conform，修改配置文件
4. 在代码中使用 cf
### Treesitter
开启折叠功能(/root/.config/nvim/lua/config/lazy.lua)
```lua
-- 开启代码折叠
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不折叠
vim.wo.foldlevel = 99
```
折叠操作：

| Key | Description | Mode |
| --- | --- | --- |
| zc | 折叠代码(光标下) | n |
| zr | 打开代码(光标下) | n |
| zM | 折叠所有 | n |
| zR | 打开所有 | n |

需要安装支持额外语言(go)的插件：
```
TSInstall go
```
查看已安装支持的语言
```
TSInstallInfo
```

### Telescope
| Key | Description | Mode |
| --- | --- | --- |
| <leader> / | 全文搜索 | n |

Ubuntu需要安装额外插件：
```shell
apt-get install ripgrep
```
### Git Blame
> 查看代码提交历史插件

使用：

1. 找到lazy-vim的插件lua配置存放的路径：（/root/.config/nvim/lua/plugins/)
2. 新建插件lua配置文件，设置插件名称，使用快捷键等
3. 重启安装即可
```lua
return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "ToggleBlame",
    keys = { { "<leader>gb", "<cmd>ToggleBlame<cr>", desc = "Toggle Blame" } },
  }
}
```
### Spectre
> 批量查找替换

安装使用参考Git Blame插件
```lua
return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
    keys = {
      { '<leader>gF', '<cmd>lua require("spectre").toggle()<CR>',                        desc = "Toggle Spectre" },
      { '<leader>gf', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', desc = "Search current word" }
    }
  }
}
```
#### 备注
问题：解决查找替换后，出现Neo-tree错误( no such file or directory)
解决方法：关闭neo-tree部分配置项，在nvim中plugins目录新建lua配置
```lua
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    table.insert(opts.open_files_do_not_replace_types, "spectre_panel")
    opts.filesystem.use_libuv_file_watcher = false
  end,
}
```
参考issue：
> https://github.com/nvim-pack/nvim-spectre/issues/170
