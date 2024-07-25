local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_wayland = false

config.color_scheme = "Melange"

config.enable_tab_bar = false
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}
config.window_close_confirmation = "NeverPrompt"
-- config.window_background_opacity = 0.90
config.warn_about_missing_glyphs = false

config.font = wezterm.font("CozetteVector", { weight = "Medium" })
-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

wezterm.on("window-resized", function(window, _)
	local window_dims = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}

	if not window_dims.is_full_screen then
		if not overrides.window_padding then
			-- not changing anything
			return
		end
		overrides.window_padding = nil
	else
		local window_width = math.floor(window_dims.pixel_width / 1.5)
		local padding = math.floor((window_dims.pixel_width - window_width) / 2)
		local new_padding = {
			left = padding,
			right = padding,
			top = 0,
			bottom = 0,
		}
		if overrides.window_padding and new_padding.left == overrides.window_padding.left then
			-- padding is same, avoid triggering further changes
			return
		end
		overrides.window_padding = new_padding
	end
	window:set_config_overrides(overrides)
end)

config.font_size = 18
return config
