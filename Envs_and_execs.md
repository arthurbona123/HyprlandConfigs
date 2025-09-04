env = AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0 or env = AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card2 (olhe em /dev/dri/by-path para ver o numero do link simbólico relacionado a ambas as placas de vídeo do sistema hybrid graphics.

env = LIBVA_DRIVER_NAME, nvidia

env = NVD_BACKEND, direct

env = SDL_VIDEODRIVER, wayland

env = CLUTTER_BACKEND, wayland

env = GDK_BACKEND, wayland

env = XDG_CURRENT_DESKTOP, Hyprland

env = XDG_CURRENT_SESSION, wayland

env = XDG_SESSION_DESKTOP, wayland

env = XCURSOR_THEME, LyraQ_cursor

env = XCURSOR_SIZE, 25

env = ELECTRON_OZONE_PLATFORM_HINT, auto

env = QT_QPA_PLATFORM, wayland

env = QT_QPA_PLATFORMTHEME, qt6ct

env = QT_AUTO_SCREEN_SCALE_FACTOR, 1

------------------------------------------------------------------------------------------

exec-once = waybar
exec-once = copyq --start-server
exec-once = hypridle
exec-once = hyprpaper
exec-once = udiskie -A -s -C
exec-once = dunst
exec-once = swayosd-server
exec-once = /usr/lib/hyprpolkitagent/hyprpolkitagent

------------------------------------------------------------------------------------------

Para a Steam Flatpak funcionar corretamente com placas de vídeo dedicadas ao invés da integrada, coloque como variáveis de ambiente a serem carregadas por meio do Flatseal:

__NV_PRIME_RENDER_OFFLOAD=1
__GLX_VENDOR_LIBRARY_NAME=nvidia
