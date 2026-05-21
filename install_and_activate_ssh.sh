#!/usr/bin/env bash

set -e

echo "========================================="
echo " Instalador y configurador SSH Linux"
echo "========================================="

# Detectar distro
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "No se pudo detectar la distribución"
    exit 1
fi

echo "Distribución detectada: $DISTRO"

install_ubuntu_debian() {
    echo "Instalando OpenSSH Server..."
    sudo apt update
    sudo apt install -y openssh-server

    echo "Habilitando servicio SSH..."
    sudo systemctl enable ssh
    sudo systemctl restart ssh

    # Firewall UFW
    if command -v ufw >/dev/null 2>&1; then
        echo "Configurando firewall UFW..."
        sudo ufw allow ssh || true
        sudo ufw allow 22/tcp || true
    fi

    SERVICE_NAME="ssh"
}

install_fedora() {
    echo "Instalando OpenSSH Server..."
    sudo dnf install -y openssh-server

    echo "Habilitando servicio SSH..."
    sudo systemctl enable sshd
    sudo systemctl restart sshd

    # FirewallD
    if command -v firewall-cmd >/dev/null 2>&1; then
        echo "Configurando FirewallD..."
        sudo firewall-cmd --permanent --add-service=ssh || true
        sudo firewall-cmd --reload || true
    fi

    SERVICE_NAME="sshd"
}

install_opensuse() {
    echo "Instalando OpenSSH..."
    sudo zypper install -y openssh

    echo "Habilitando servicio SSH..."
    sudo systemctl enable sshd
    sudo systemctl restart sshd

    # FirewallD
    if command -v firewall-cmd >/dev/null 2>&1; then
        echo "Configurando FirewallD..."
        sudo firewall-cmd --permanent --add-service=ssh || true
        sudo firewall-cmd --reload || true
    fi

    SERVICE_NAME="sshd"
}

case "$DISTRO" in
    ubuntu|debian|linuxmint)
        install_ubuntu_debian
        ;;
    fedora)
        install_fedora
        ;;
    opensuse*|sles)
        install_opensuse
        ;;
    *)
        echo "Distribución no soportada: $DISTRO"
        exit 1
        ;;
esac

echo ""
echo "========================================="
echo " Estado del servicio SSH"
echo "========================================="

sudo systemctl --no-pager status $SERVICE_NAME | head -n 15

echo ""
echo "========================================="
echo " IPs disponibles"
echo "========================================="

hostname -I || ip addr

echo ""
echo "========================================="
echo " SSH configurado correctamente"
echo "========================================="
echo ""
echo "Para conectarte desde otro equipo:"
echo ""
echo "ssh usuario@IP_DEL_EQUIPO"
echo ""
