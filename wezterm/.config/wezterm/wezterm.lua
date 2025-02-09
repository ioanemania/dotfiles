local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_wayland = false

config.color_scheme = "Catppuccin Macchiato"
config.enable_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
-- config.window_background_opacity = 0.90
config.warn_about_missing_glyphs = false

-- FONT CONFIG

local small_font = {
	font = wezterm.font("Cozette"),
	size = 9,
	rules = {}
}

local large_font = {
  font = wezterm.font("Input Mono Condensed"),
  size = 15,
  -- rules = {},
  rules = {
      {
          intensity = 'Bold',
          font = wezterm.font("Input Mono Condensed"),
        }
      },
    }

    local current_font = large_font
    config.font = current_font.font
    config.font_size = current_font.size
    config.font_rules = current_font.rules

    wezterm.on('toggle-font', function(window, _)
      local overrides = window:get_config_overrides() or {}

      if current_font == large_font then
	current_font = small_font
      else
	current_font = large_font
      end

      overrides.font = current_font.font
      overrides.font_size = current_font.size
      overrides.font_rules = current_font.rules

      window:set_config_overrides(overrides)
    end)

    -- Padding Config
    local normal_window_padding = {
      top = 0,
      left = 10,
      right = 10,
      bottom = 0,
    }

    local current_window_padding = normal_window_padding
    config.window_padding = current_window_padding

    wezterm.on('toggle-padding', function(window, _)
      local window_dims = window:get_dimensions()
      local overrides = window:get_config_overrides() or {}

      if current_window_padding == normal_window_padding then
	local window_width = math.floor(window_dims.pixel_width / 2)
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

	current_window_padding = new_padding
      else
	current_window_padding = normal_window_padding
      end

      overrides.window_padding = current_window_padding
      window:set_config_overrides(overrides)
    end)

    -- KEY CONFIG

    config.keys = {
      {
	key = "=",
	mods = "ALT",
	action = wezterm.action.EmitEvent 'toggle-font'
      },
      {
	key = "-",
	mods = "ALT",
	action = wezterm.action.EmitEvent 'toggle-padding'
      },
    }

    return config
