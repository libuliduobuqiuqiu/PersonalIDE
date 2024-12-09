local platform = require('utils.platform')
local backdrops = require('utils.backdrops')
local colors = require('utils.colors')
local wezterm = require('wezterm')
local act = wezterm.action

local mod = {}

if platform.is_mac then
    mod.SUPER = 'SUPER'
    mod.SUPER_REV = 'SUPER|CTRL'
 elseif platform.is_win or platform.is_linux then
    mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
    mod.SUPER_REV = 'ALT|CTRL'
 end

 local keys = {
     -- misc/useful --
   { key = 'F1', mods = 'NONE', action = 'ActivateCopyMode' },
   { key = 'F2', mods = 'NONE', action = act.ActivateCommandPalette },
   { key = 'F3', mods = 'NONE', action = act.ShowLauncher },
   { key = 'F4', mods = 'NONE', action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },

   -- copy/paste --
   { key = 'c',          mods = 'CTRL|SHIFT',  action = act.CopyTo('Clipboard') },
   { key = 'v',          mods = 'CTRL|SHIFT',  action = act.PasteFrom('Clipboard') },

   -- panes: navigation
   { key = 'k',     mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Up') },
   { key = 'j',     mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Down') },
   { key = 'h',     mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Left') },
   { key = 'l',     mods = mod.SUPER_REV, action = act.ActivatePaneDirection('Right') },

   -- background controls --
    {
        key = [[/]],
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
           backdrops:random(window)
        end),
     },
     {
        key = [[,]],
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
           backdrops:cycle_back(window)
        end),
     },
     {
        key = [[.]],
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
           backdrops:cycle_forward(window)
        end),
     },
     {
        key = [[/]],
        mods = mod.SUPER_REV,
        action = act.InputSelector({
           title = 'InputSelector: Select Background',
           choices = backdrops:choices(),
           fuzzy = true,
           fuzzy_description = 'Select Background: ',
           action = wezterm.action_callback(function(window, _pane, idx)
              if not idx then
                 return
              end
              ---@diagnostic disable-next-line: param-type-mismatch
              backdrops:set_img(window, tonumber(idx))
           end),
        }),
     },
     {
        key = 'b',
        mods = mod.SUPER,
        action = wezterm.action_callback(function(window, _pane)
           backdrops:toggle_focus(window)
        end)
     },
 }

 return {keys = keys, colors=colors}