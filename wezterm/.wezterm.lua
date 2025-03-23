-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.font = wezterm.font 'JetBrains Mono'
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.launch_menu = {
  {
    label = "Open nvim workspace",
    args = { "zsh", "-c", "cd ~/.config/nvim && exec zsh"}
  }
}

local LEADER = "CTRL|SHIFT"
local DEFAULT_REZIZE = 2

config.keys = {
	{
		key = "P",
		mods = LEADER,
		action = wezterm.action.SpawnCommandInNewTab({
      args = { "bash", "cd ~/.config/nvim" }
    }),
	},
	-- Split
	{
		key = "6",
		mods = LEADER,
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = LEADER,
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- show tab navigation
	{
		key = "n",
		mods = LEADER,
		action = wezterm.action.ShowTabNavigator,
	},
	-- Toglle full screen for terminal
	{
		key = "z",
		mods = LEADER,
		action = wezterm.action.ToggleFullScreen,
	},
	-- Toggle zoom in current pane
	{
		key = "f",
		mods = LEADER,
		action = wezterm.action.TogglePaneZoomState,
	},
	-- Navigate in pane
	{
		key = "h",
		mods = LEADER,
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = LEADER,
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = LEADER,
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = LEADER,
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	-- Rezize
	{
		key = "LeftArrow",
		mods = LEADER,
		action = wezterm.action.AdjustPaneSize({ "Left", DEFAULT_REZIZE }),
	},
	{
		key = "RightArrow",
		mods = LEADER,
		action = wezterm.action.AdjustPaneSize({ "Right", DEFAULT_REZIZE }),
	},
	{
		key = "UpArrow",
		mods = LEADER,
		action = wezterm.action.AdjustPaneSize({ "Up", DEFAULT_REZIZE }),
	},
	{
		key = "DownArrow",
		mods = LEADER,
		action = wezterm.action.AdjustPaneSize({ "Down", DEFAULT_REZIZE }),
	},
	-- Closing
	{
		key = "d",
		mods = LEADER,
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "w",
		mods = LEADER,
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
}

return config
-- and finally, return the configuration to wezterm return config
