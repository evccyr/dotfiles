---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

theme.font = "JetBrains Mono Nerd Font Mono Bold 12"
theme.icon_font = "FontAwesome 5 Free Solid Bold 12"

-- Color palette
theme.white = "#ffffff"
theme.black = "#000000"
theme.cyan = "#00ffff"
theme.light_grey = "#bebebe"
theme.dark_grey = "#3a3b3c"
theme.grey = "#808080"
theme.cream = "#fffdd0"
theme.khaki = "#f0e68d"
theme.cherry = "#ff0636"
theme.green = "#00ff00"
theme.tangerine = "#f28500"
theme.sky_blue = "#87ceeb"
theme.green = "#00ff00"
theme.glass = "#ffffff00"
theme.smoked_glass = "#ffffff11"

-- Shades of pink
theme.pink = "#ffc0cb"
theme.pink1 = "#7f3667"
theme.pink2 = "#a53e76"
theme.pink3 = "#bb437e"
theme.pink4 = "#d24787"
theme.pink5 = "#e44b8d"
theme.pink6 = "#e2619f"
theme.hot_pink = "#ff69b4"

-- Shades of purple
theme.purple1 = "#100412"
theme.purple2 = "#210c35"
theme.purple3 = "#3e1046"
theme.purple4 = "#4e1458"
theme.purple5 = "#5e176a"
theme.purple6 = "#9c27b0"

theme.bg_normal   = theme.purple1 -- statusbar color
theme.bg_focus    = theme.pink
theme.bg_urgent   = theme.black
theme.bg_minimize = theme.grey
theme.bg_systray  = theme.bg_normal

theme.fg_normal   = theme.cream
theme.fg_focus    = theme.pink
theme.fg_urgent   = theme.white
theme.fg_minimize = theme.white

theme.useless_gap   = dpi(6)
theme.border_width  = dpi(0)
theme.border_normal = theme.black
theme.border_focus  = theme.pink
theme.border_marked = theme.black

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--
theme.dbg = theme.orange3
theme.lbg = theme.dark_purple6

theme.systray_icon_spacing = 9

theme.volume_bg_bar = theme.purple5
theme.volume_fg_bar = theme.pink
theme.volume_handle = theme.white

theme.battery_arc = theme.white

-- tasklist_[bg|fg]_[focus|urgent]
theme.tasklist_bg_focus = theme.pink

-- titlebar_[bg|fg]_[normal|focus]
theme.titlebar_size = 6
theme.titlebar_position = "top"
theme.titlebar_bg_normal = theme.black
theme.titlebar_bg_focus = theme.hot_pink

-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_fg_focus = theme.dark_purple6
theme.taglist_bg_focus = theme.pink
theme.taglist_fg_occupied = theme.pink
theme.taglist_bg_occupied = theme.pink2
theme.taglist_fg_empty = theme.khaki
theme.taglist_bg_empty = theme.dark_purple4
theme.taglist_fg_urgent = theme.pink
theme.taglist_bg_urgent = theme.black

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]

theme.menu_bg_focus = theme.black

theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(30)
theme.menu_width        = dpi(300)

-- You can use your own layout icons like this:
theme.layout_fairh      = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv      = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating   = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier  = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max        = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile       = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop    = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral     = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle    = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw   = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne   = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw   = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse   = themes_path .. "default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
  theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80