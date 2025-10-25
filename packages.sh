#!/bin/bash

# Script de instalação de pacotes para Arch Linux com Hyprland
# Com tratamento de erros e pacotes essenciais

set -e  # Parar em caso de erro

echo "================================================"
echo "  Instalação de Pacotes - Arch Linux + Hyprland"
echo "================================================"
echo ""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Função para log
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERRO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[AVISO]${NC} $1"
}

# Atualizar sistema primeiro
log_info "Atualizando sistema..."
sudo pacman -Syu --noconfirm

# Instalar pacotes fundamentais do repositório oficial
log_info "Instalando pacotes fundamentais do sistema..."
sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    wget \
    curl \
    linux-firmware \
    sudo

# Pacotes de rede
log_info "Instalando ferramentas de rede..."
sudo pacman -S --needed --noconfirm \
    networkmanager \
    nm-connection-editor \
    network-manager-applet \
    dhcpcd \
    iwgtk

# Sistema de arquivos
log_info "Instalando suporte a sistemas de arquivos..."
sudo pacman -S --needed --noconfirm \
    ntfs-3g \
    dosfstools \
    exfatprogs \
    mtools \
    fuse

# Utilitários básicos
log_info "Instalando utilitários básicos..."
sudo pacman -S --needed --noconfirm \
    nano \
    vi \
    vim \
    unzip \
    zip \
    p7zip \
    tar \
    man-db \
    man-pages \
    bash-completion \
    htop \
    hwinfo \
    reflector \
    chrony

# Desktop/Ambiente Gráfico
log_info "Instalando componentes do ambiente gráfico..."
sudo pacman -S --needed --noconfirm \
    xdg-user-dirs \
    xdg-utils \
    polkit-kde-agent \
    gvfs \
    gvfs-mtp \
    udiskie

# Audio (Pipewire completo)
log_info "Instalando sistema de áudio Pipewire..."
sudo pacman -S --needed --noconfirm \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-jack \
    wireplumber \
    pavucontrol \
    qjackctl

# Hyprland e Wayland
log_info "Instalando Hyprland e componentes Wayland..."
sudo pacman -S --needed --noconfirm \
    hyprland \
    hyprland-protocols \
    waybar \
    hypridle \
    hyprlock \
    hyprpaper \
    hyprshot \
    hyprpolkitagent \
    rofi \
    nwg-bar \
    nwg-look \
    nwg-icon-picker \
    weston

# Qt/KDE
log_info "Instalando ferramentas Qt/KDE..."
sudo pacman -S --needed --noconfirm \
    qt5ct \
    qt6ct \
    kvantum \
    gwenview

# Aplicações do sistema
log_info "Instalando aplicações do sistema..."
sudo pacman -S --needed --noconfirm \
    firefox \
    kitty \
    nemo \
    evince \
    drawing \
    inkscape \
    skanlite \
    gimp \
    vlc \
    libreoffice-fresh

# Ferramentas de desenvolvimento
log_info "Instalando ferramentas de desenvolvimento..."
sudo pacman -S --needed --noconfirm \
    gcc \
    cmake \
    make \
    codeblocks

# Impressão e scanner
log_info "Instalando suporte a impressoras e scanners..."
sudo pacman -S --needed --noconfirm \
    cups \
    cups-browsed \
    sane

# Bluetooth
log_info "Instalando suporte Bluetooth..."
sudo pacman -S --needed --noconfirm \
    blueman

# Gerenciamento de energia
log_info "Instalando ferramentas de energia..."
sudo pacman -S --needed --noconfirm \
    brightnessctl \
    tlp \
    tlpui

# Virtualização
log_info "Instalando VirtualBox..."
sudo pacman -S --needed --noconfirm \
    virtualbox \
    linux-lts \
    linux-lts-headers

# Gaming
log_info "Instalando ferramentas para jogos..."
sudo pacman -S --needed --noconfirm \
    gamemode

# NVIDIA
log_info "Instalando drivers NVIDIA e ferramentas..."
sudo pacman -S --needed --noconfirm \
    nvidia-settings \
    nvtop

# Outros
log_info "Instalando outras ferramentas..."
sudo pacman -S --needed --noconfirm \
    flatpak \
    copyq \
    mysql \
    zsh \
    openrgb \
    preload \
    easyeffects

# Habilitar serviços essenciais
log_info "Habilitando serviços do sistema..."
sudo systemctl enable NetworkManager
sudo systemctl enable cups
sudo systemctl enable bluetooth
sudo systemctl enable tlp
sudo systemctl enable chronyd

# Instalar yay (AUR helper)
log_info "Instalando yay (AUR helper)..."
if ! command -v yay &> /dev/null; then
    if [ -d "yay" ]; then
        log_warn "Diretório yay já existe, removendo..."
        rm -rf yay
    fi

    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    log_info "yay instalado com sucesso!"
else
    log_info "yay já está instalado, pulando..."
fi

# Instalar pacotes do AUR
log_info "Instalando pacotes do AUR..."
yay -S --needed --noconfirm \
    google-chrome \
    brave-bin \
    pycharm-community-edition \
    code \
    epson-inkjet-printer-escpr \
    sonobus \
    reaper \
    sddm-silent-theme \
    fontbase \
    ttf-cascadia-nerd \
    ttf-bree-serif \
    sane-airscan \
    lsp-plugins

# Flatpak
log_info "Instalando aplicações via Flatpak..."
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub org.freedesktop.Platform.VulkanLayer.MangoHud
flatpak install -y flathub md.obsidian.Obsidian
flatpak install -y flathub com.github.tchx84.Flatseal

# Criar diretório AppImages se não existir
log_info "Preparando diretório AppImages..."
mkdir -p /home/$USER/AppImages

# Download de AppImages
log_info "Baixando AppImages..."
cd /tmp

wget -4 https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v2.13.0/ProtonUp-Qt-2.13.0-x86_64.AppImage
wget -4 https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.17.2/Heroic-2.17.2-linux-x86_64.AppImage
wget -4 https://github.com/PCSX2/pcsx2/releases/download/v2.4.0/pcsx2-v2.4.0-linux-appimage-x64-Qt.AppImage
wget -4 https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-9c93ec0bc31bbc94ca4dce2a76ceea80da6f6554/rpcs3-v0.0.37-18022-9c93ec0b_linux64.AppImage

# Tornar executáveis
chmod +x *.AppImage

# Mover para diretório AppImages
mv ProtonUp-Qt-2.13.0-x86_64.AppImage /home/$USER/AppImages/
mv Heroic-2.17.2-linux-x86_64.AppImage /home/$USER/AppImages/
mv pcsx2-v2.4.0-linux-appimage-x64-Qt.AppImage /home/$USER/AppImages/
mv rpcs3-v0.0.37-18022-9c93ec0b_linux64.AppImage /home/$USER/AppImages/

log_info "AppImages instalados em /home/$USER/AppImages/"

# NVIDIA Driver (opcional - comentado por padrão)
# AVISO: A instalação manual do driver NVIDIA pode causar conflitos
# Recomenda-se usar os pacotes nvidia do repositório oficial
# Descomente apenas se necessário:
#
# log_warn "Instalando driver NVIDIA manualmente..."
# cd /tmp
# wget -4 https://us.download.nvidia.com/XFree86/Linux-x86_64/580.82.07/NVIDIA-Linux-x86_64-580.82.07.run
# chmod +x NVIDIA-Linux-x86_64-580.82.07.run
# sudo ./NVIDIA-Linux-x86_64-580.82.07.run

# Finalização
echo ""
echo "================================================"
log_info "Instalação concluída!"
echo "================================================"
echo ""
log_info "Recomendações pós-instalação:"
echo "  1. Reinicie o sistema"
echo "  2. Configure o NetworkManager se necessário"
echo "  3. Adicione seu usuário ao grupo vboxusers para VirtualBox:"
echo "     sudo usermod -aG vboxusers \$USER"
echo "  4. Configure o Flatpak: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
echo ""
