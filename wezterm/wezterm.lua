local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

-- FONT
config.font = wezterm.font_with_fallback({
	"Hack Nerd Font",
	-- "FiraCode Nerd Font",
})
config.font_size = 14.0
-- config.line_height = 1.2

-- COLORS

local scheme = "Catppuccin Mocha"
config.color_scheme = "Catppuccin Mocha"
wezterm.on("toggle-colors", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == "Catppuccin Mocha" then
		overrides.color_scheme = "Catppuccin Latte"
	else
		overrides.color_scheme = "Catppuccin Mocha"
	end
	window:set_config_overrides(overrides)
end)

-- WINDOW APPEARANCE
config.window_background_opacity = 1.0
config.text_background_opacity = 1.0
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 8,
	right = 8,
	top = 4,
	bottom = 4,
}

-- BEHAVIOR
config.scrollback_lines = 10000
config.adjust_window_size_when_changing_font_size = false

-- KEYBINDINGS (Optional: for Neovim-like workflow)
config.keys = {
	-- Split panes
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "SUPER|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Pane navigation using Cmd (SUPER)
	{
		key = "h",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "SUPER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "f",
		mods = "SUPER", -- ⌘ + F
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "LeftArrow",
		mods = "SUPER|ALT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "RightArrow",
		mods = "SUPER|ALT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "UpArrow",
		mods = "SUPER|ALT",
		action = wezterm.action.AdjustPaneSize({ "Up", 2 }),
	},
	{
		key = "DownArrow",
		mods = "SUPER|ALT",
		action = wezterm.action.AdjustPaneSize({ "Down", 2 }),
	},
	{
		key = "3",
		mods = "ALT",
		action = wezterm.action.SendString("#"),
	},
	{
		key = "t",
		mods = "ALT",
		action = act.EmitEvent("toggle-colors"),
	},
}

config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 0.95,
}

return config
