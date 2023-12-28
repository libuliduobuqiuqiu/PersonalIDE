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

### Formatting
参考链接： 
> https://www.lazyvim.org/extras/formatting/black

格式化Python代码：
1. 通过:LazyExtras启用对应格式化插件formatting
2. 通过Mason下载对应Formatting配置（black）
3. 定位到confirm.nvim配置目录下，/root/.local/share/nvim/lazy/conform.nvim/lua/conform，修改配置文件
4. 在代码中使用<leader> cf
