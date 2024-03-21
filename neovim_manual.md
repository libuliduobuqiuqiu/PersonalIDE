## NeoVim Manual

### Base operate

光标跳转(回到上一次光标所在位置)
```
ctrl + o
```
光标跳转（回到返回前的光标所在位置）
```
ctrl + i
```

### neo-tree.vim

(在树形列表中）打开隐藏文件
```
<S-h>
```
visual
```
v
```
打开当前文件树
```
<leader> e
```

### buffer

关闭buffer:
```
<leader> bd
```
切换buffer：
```
<S-hj>
```
固定buffer:
```
<leader> bp
```
### mini
注释：
```
gcc
```
### lsp

打开LSPInfo
```
<leader> cl 
```
go LSP
> gopls

python LSP
> pyright

### Formatting
参考链接： 
> https://www.lazyvim.org/extras/formatting/black

格式化Python代码：
1. 通过:LazyExtras启用对应格式化插件formatting
2. 通过Mason下载对应Formatting配置（black）
3. 定位到confirm.nvim配置目录下，/root/.local/share/nvim/lazy/conform.nvim/lua/conform，修改配置文件
4. 在代码中使用<leader> cf

### Treesitter

开启折叠功能(/root/.config/nvim/lua/config/lazy.lua)
```
-- 开启代码折叠
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不折叠
vim.wo.foldlevel = 99
```

需要安装支持额外语言(go)的插件：
```
TSInstall go
```

查看已安装支持的语言
```
TSInstallInfo
```

折叠代码\打开代码(光标下)
```
zc zr
```
切换折叠和打开:单层级\所有层级
```
za zA
```
折叠所有\打开所有
```
zM zR
```
### Telescope

提供全文搜索功能
```
<leader> /
```
Ubuntu需要安装额外插件：
```
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

