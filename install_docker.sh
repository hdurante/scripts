#!/bin/bash

set -e

# Detección de distribución
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "No se puede detectar la distribución."
    exit 1
fi

install_docker_ubuntu() {
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg lsb-release
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable --now docker
}

install_docker_fedora() {
    sudo dnf -y install dnf-plugins-core
    sudo curl -fsSL -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable --now docker
}

install_docker_suse() {
    sudo zypper refresh
    sudo zypper install -y docker
    sudo systemctl enable --now docker
}

case "$DISTRO" in
    ubuntu|debian)
        install_docker_ubuntu
        ;;
    fedora)
        install_docker_fedora
        ;;
    opensuse*|suse*|sles)
        install_docker_suse
        ;;
    *)
        echo "Distribución $DISTRO no soportada por este script."
        exit 2
        ;;
esac

echo "Docker instalado correctamente en $DISTRO."

# Preguntar si desea agregar el usuario al grupo docker
echo
echo "¿Quieres agregar el usuario '$USER' al grupo 'docker' para usar Docker sin sudo? [s/n]"
read -r RESP

if [[ "$RESP" =~ ^[sS]$ ]]; then
    if id -nG "$USER" | grep -qw docker; then
        echo "El usuario $USER ya está en el grupo docker."
    else
        sudo usermod -aG docker "$USER"
        echo
        echo "¡Listo! El usuario $USER ha sido agregado al grupo docker."
        echo
        echo "IMPORTANTE:"
        echo "Para que este cambio tenga efecto, debes cerrar completamente la sesión de tu usuario (no sólo cerrar la terminal) y volver a ingresar."
        echo "Esto significa cerrar la sesión gráfica (GNOME, KDE, XFCE, etc.) o salir de tu sesión de usuario en consola, o bien reiniciar tu equipo."
        echo "Después de hacer esto, ya podrás usar Docker sin poner sudo delante de los comandos."
    fi
else
    echo "No se agregará el usuario al grupo docker. Podrás seguir usando Docker usando sudo."
fi
