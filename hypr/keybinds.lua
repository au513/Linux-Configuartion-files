local mainMod = "SUPER"

-- Screenpad Toggle
hl.bind("XF86Launch7", hl.dsp.exec_cmd("if [[ $(brightnessctl -d asus::screenpad g) == 0 ]]; then brightnessctl -rd asus::screenpad; else brightnessctl -sd asus::screenpad s 0; fi"), {locked = true})

-- Screenpad brightness
hl.bind(mainMod .. " + XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -d asus::screenpad set 5%+"),                  { locked = true, repeating = true })
hl.bind(mainMod .. " + XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -d asus::screenpad set 5%-"),                  { locked = true, repeating = true })

-- Lid Switch
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock & hyprctl dispatch dpms off && if [[ \"$(playerctl -p spotify status)\" != \"Playing\" && \"$(pidof hypridle)\" != '' ]]; then systemctl hibernate; fi"), {locked = true})
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("hyprctl dispatch dpms on"), {locked = true})

-- Fine Brightness Adjustment
hl.bind("SHIFT + XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl set 1+"),                  { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl set 1-"),                  { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -d asus::screenpad set 1+"),                  { locked = true, repeating = true })
hl.bind(mainMod .. " + SHIFT + XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -d asus::screenpad set 1-"),                  { locked = true, repeating = true })

-- "Start Menu"
hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("waybar -c /home/au512/.config/waybar/StatusBar/config -s /home/au512/.config/waybar/StatusBar/style.css -l off"))
hl.bind(" SUPER + SUPER_L ", hl.dsp.exec_cmd('pkill rofi || rofi -show drun -show-icons && kill $(pgrep -f "waybar -c /home/au512/.config/waybar/StatusBar/config -s /home/au512/.config/waybar/StatusBar/style.css")'))

-- Hypridle toggle
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd('if [ "$(pidof hypridle)" == "" ]; then hypridle & notify-send -t 1000 "Hypridle" "Hypridle resumed."; else killall hypridle && notify-send -t 1000 "Hypridle" "Hypridle paused."; fi'))

-- Clock Toggle
hl.bind(mainMod .. "+ P", hl.dsp.exec_cmd('pkill waybar || waybar -c /home/au512/.config/waybar/CnM/config -s /home/au512/.config/waybar/CnM/style.css'))

-- Display Resolution Toggle
hl.bind(mainMod .. " + R ", hl.dsp.exec_cmd("cp ~/.config/hypr/highres.lua ~/.config/hypr/monitorconf.lua"))
hl.bind(mainMod .. " + SHIFT + R ", hl.dsp.exec_cmd("cp ~/.config/hypr/lowres.lua ~/.config/hypr/monitorconf.lua"))

-- Close Windows
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + mouse:275", hl.dsp.window.close())

-- Browser
hl.bind(mainMod .. "+ Z", hl.dsp.exec_cmd("flatpak run app.zen_browser.zen"))

-- Settings
hl.bind(mainMod .. "+ I", hl.dsp.exec_cmd("systemsettings"))
