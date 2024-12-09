-- Pull in the wezterm API
local wezterm = require 'wezterm'
local Config = require('utils')


-- This table will hold the configuration.
local c = Config:init():append(require('utils.bindings')).options


require('utils.backdrops')
   :set_files()
   -- :set_focus('#000000')
   :random()


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