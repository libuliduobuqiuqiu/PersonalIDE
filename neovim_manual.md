## NeoVim Manual

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
