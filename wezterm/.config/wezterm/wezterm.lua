local wezterm = require("wezterm")

wezterm.on("window-focus-changed", function()
	os.execute(
		"xdotool search -classname org.wezfurlong.wezterm | xargs -I{} xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id {}"
	)
end)

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night"

config.enable_tab_bar = false
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.8
config.warn_about_missing_glyphs = false

config.font = wezterm.font("Monaspace Radon")
config.font_size = 17

return config
