local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}
local mux = wezterm.mux

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'AdventureTime'
-- 背景透過
config.window_background_opacity = 0.63

-- 画面サイズの設定
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {width=148, height=54})
end)

-- フォントの設定
--config.font = wezterm.font("font", {weight="Medium", stretch="Normal", style="Normal"})

-- フォントサイズの設定
config.font_size = 11

-- ショートカットキー設定
config.keys = {
  -- Ctrl+左矢印でカーソルを前の単語に移動
  {
    key = "LeftArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "b",
      mods = "META",
    },
  },
  -- Ctrl+右矢印でカーソルを次の単語に移動
  {
    key = "RightArrow",
    mods = "CTRL",
    action = act.SendKey {
      key = "f",
      mods = "META",
    },
  },
  -- Ctrl+Backspaceで前の単語を削除
  {
    key = "Backspace",
    mods = "CTRL",
    action = act.SendKey {
      key = "w",
      mods = "CTRL",
    },
  },
  -- CTRL+SHIFT+sで8:2に画面を分割
  {
    key = 's',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
      direction = 'Down',
      size = { Percent = 25 },
    },
  },
}

return config
