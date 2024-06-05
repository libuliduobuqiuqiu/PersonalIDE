## 构建一套属于Linux的IDE

> 基于Windows的WSL环境，部署Ubuntu系统，搭建一套IDE环境，减少鼠标操作，能够直接通过键盘完成大部分开发工作。

构建过程使用到的插件/工具：
- WSL(虚拟环境)
- WezTerm(终端工具)
- NeoVIM(IDE)
- LazyVIM(NeoVIM 配置)
- Lsp（pyright,gopls)
- zsh(oh-my-zsh配置)
- Tmux(Linux 窗口会话管理工具)


## Windows虚拟Linux系统：WSL

### 安装教程

手动安装指定的位置：
> https://www.cnblogs.com/xiaoliangyuu/p/15506352.html

### 异常解决

启动Windows子系统报错：
> https://blog.csdn.net/inthat/article/details/117805383

旧版WSL更新内核：
> https://learn.microsoft.com/zh-cn/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package

设置默认WSL用户：(进入到解压缩的ubuntu系统目录)
> ubuntu.exe config --default-user root

## 终端：WezTerm

**使用lua脚本：（wezterm.lua ）**
```lua
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local c = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  c = wezterm.config_builder()
end


-- 配色方案（主题）
local materia = wezterm.color.get_builtin_schemes()['Brogrammer']
materia.scrollbar_thumb = '#cccccc' -- 更明显的滚动条
c.colors = materia

-- 透明背景
-- c.window_background_opacity = 0.9

-- 设置背景图片的后的字体
c.text_background_opacity  = 1

-- 设置图片
c.window_background_image = "D:\\Coding\\WezTerm\\WezTerm\\wallhaven-d66zrl.jpg"
c.window_background_image_hsb = {
  -- Darken the background image by reducing it to 1/3rd
  brightness = 0.1,

  -- You can adjust the hue by scaling its value.
  -- a multiplier of 1.0 leaves the value unchanged.
  hue = 1.0,

  -- You can adjust the saturation also.
  saturation = 1.0,
}

-- 取消 Windows 原生标题栏
c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- 滚动条尺寸为 15 ，其他方向不需要 pad
c.window_padding = { left = 0, right = 15, top = 0, bottom = 0 }

-- 启用滚动条
c.enable_scroll_bar = true

-- 进入窗口启动命令
c.default_prog = {"wsl.exe", "--cd", "~"}

-- and finally, return the configuration to wezterm
return c
```

终端配置详解：
> https://wezfurlong.org/wezterm/config/files.html

终端默认按键定义；
> https://wezfurlong.org/wezterm/config/default-Keyss.html

文章：
> https://www.rayalto.pro/2023/10/25/wezterm-replace-windows-terminal/

## IDE编辑器：NeoVIM

入门配置：lazyVIM

设置自定义快捷键示例
```
vim.Keyssmap.set('i', 'jj', '<esc>')
```

LazyVim按键绑定：
> https://www.lazyvim.org/keymaps

LazyVim Keysmaps：
> https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/Keysmaps.lua

## Python LSP插件：pyright

pyright虚拟环境库设置：(pyrightconfig.json)
```json
{
  "venvPath": "/data/PythonDemo/",
  "venv": "venv"
}
```

参考官方解决方案：
> https://microsoft.github.io/pyright/#/import-resolution?id=configuring-your-python-environment


## Python 虚拟环境工具：Virtualenv

如何配置进入到指定项目文件夹中自动加在对应的venv目录的环境：（设置.bashrc）
```
cd() {
        builtin cd $1
        if [ -d "venv" ]; then
                source venv/bin/activate
        fi
}
```


## zsh && oh-my-zsh

```shell
apt install zsh -y
```

oh-my-zsh参考链接：
> https://ohmyz.sh/

oh-my-zsh主题：（powerlevel10k）
> https://github.com/romkatv/powerlevel10k

## tmux

```
apt install tmux
```

加载标准个性化tmux配置：
```shell
$ cd

$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```

tmux命令：
> https://github.com/gpakosz/.tmux

参考教程：
> https://www.ruanyifeng.com/blog/2019/10/tmux.html

## Clash(代理)
设置ALL_PROXY,设置https_proxy,设置http_proxy（备注：自身部署服务测试接口API，有可能会走到代理访问vpn，建议下载更新软件时候才开启，默认关闭）
```
host_ip=$(cat /etc/resolv.conf | grep nameserver | cut -f 2 -d " ")
export ALL_PROXY="http://$host_ip:7890"
export https_proxy="http://$host_ip:7890"
export http_proxy="http://$host_ip:7890"
```
补充shell脚本用于快捷设置代理地址和取消代理地址,具体参考clash_for_linux.sh,增加快捷命令：
```
alias clash='source /root/clash_for_linux.sh set'
alias unclash='source /root/clash_for_linux.sh unset'
```

### 备注

windows系统上capsLock 和 ctrl键互换
1. 通过win+r，regedit打开注册表；
2. 找到路径（计算机\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout）
3. 新建一个二进制值，重命名Scancode Map;
4. 编辑二进制值
```
0000 00 00 00 00 00 00 00 00
0008 03 00 00 00 1D 00 3A 00
0010 3A 00 1D 00 00 00 00 00
0018
```
