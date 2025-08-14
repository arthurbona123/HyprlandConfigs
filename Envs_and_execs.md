env = AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0 - aqui, definimos quais placas de vídeos serão usadas para renderizar o hyprland

env = LIBVA_DRIVER_NAME, nvidia - aceleração gráfica baseada em hardware

env = NVD_BACKEND, direct

env = SDL_VIDEO_DRIVER, wayland

env = CLUTTER_BACKEND, wayland

env = XDG_CURRENT_DESKTOP, Hyprland

env = XDG_CURRENT_SESSION, wayland - configs do XDG e do desktop em geral, com o Hyprland e o Wayland

env = XDG_SESSION_DESKTOP, wayland

env = XCURSOR_THEME, LyraQ_cursor

env = XCURSOR_SIZE, 25 - configurações de cursores do desktop

env = ELECTRON_OZONE_PLATFORM_HINT, auto - correção do Ozone para apps que são baseados em Electron

env = QT_QPA_PLATFORM, wayland

env = QT_QPA_PLATFORMTHEME, qt6ct - correções e configs para apps baseados em gráficos Qt

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