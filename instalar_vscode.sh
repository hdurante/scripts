#!/bin/bash

# Script para instalar Visual Studio Code en Fedora 44
# Uso: bash instalar_vscode.sh

# --- Colores para una salida más bonita ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

# --- Funciones ---
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# --- Verificar que se ejecuta como usuario normal ---
if [[ $EUID -eq 0 ]]; then
   print_error "No ejecutes este script como root. Ejecútalo con un usuario normal."
   print_info "El script usará 'sudo' cuando sea necesario."
   exit 1
fi

# --- Inicio del script ---
clear
echo "---------------------------------------------"
echo "  Script de instalación de Visual Studio Code"
echo "          para Fedora 44"
echo "---------------------------------------------"
print_info "Este script agregará el repositorio oficial de Microsoft e instalará VS Code."
print_warning "Se requerirá tu contraseña de sudo para continuar."

read -p "¿Deseas continuar? (s/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    print_info "Instalación cancelada por el usuario."
    exit 0
fi

# --- 1. Importar la clave GPG de Microsoft ---
print_info "Importando la clave GPG de Microsoft..."
if sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc 2>/dev/null; then
    print_success "Clave GPG importada correctamente."
else
    print_warning "La clave GPG ya estaba presente o hubo un error, continuando..."
fi

# --- 2. Agregar el repositorio de VS Code ---
print_info "Agregando el repositorio de Visual Studio Code..."
VSCODE_REPO="/etc/yum.repos.d/vscode.repo"

# Crear el archivo .repo usando un 'here document' con sudo
sudo tee "$VSCODE_REPO" > /dev/null <<EOF
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

if [[ $? -eq 0 ]]; then
    print_success "Repositorio agregado correctamente en $VSCODE_REPO."
else
    print_error "No se pudo crear el archivo del repositorio."
    exit 1
fi

# --- 3. Verificar si VS Code ya está instalado ---
if command -v code &> /dev/null; then
    print_warning "Visual Studio Code ya está instalado."
    read -p "¿Deseas reinstalarlo? (s/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        print_info "Instalación cancelada."
        exit 0
    fi
fi

# --- 4. Limpiar caché e instalar VS Code ---
print_info "Limpiando caché de dnf..."
sudo dnf clean all --quiet

print_info "Instalando Visual Studio Code (esto puede tomar un momento)..."
print_info "Ejecutando: sudo dnf install -y code"

# Instalar directamente sin check-update previo
if sudo dnf install -y code; then
    print_success "¡Visual Studio Code se ha instalado correctamente!"
else
    print_error "Ocurrió un error durante la instalación."
    exit 1
fi

# --- 5. Confirmación final ---
echo "---------------------------------------------"
print_success "Instalación completada."
print_info "Puedes iniciar VS Code de las siguientes maneras:"
echo "  - Desde el menú de aplicaciones (buscando 'Visual Studio Code')."
echo "  - Ejecutando el comando 'code' en la terminal."
echo ""
print_info "Versión instalada:"
code --version 2>/dev/null | head -n1 || echo "  (No se pudo obtener la versión)"
echo "---------------------------------------------"
