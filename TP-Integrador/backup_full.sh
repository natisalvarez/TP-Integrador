#!/bin/bash

# backup_full.sh - Script de backup automático
# Uso: ./backup_full.sh <origen> <destino>

# Función para mostrar ayuda
show_help() {
    echo "Uso: $0 <origen> <destino>"
    echo ""
    echo "Opciones:"
    echo "  -h, --help     Muestra este mensaje de ayuda"
    echo ""
    echo "Ejemplo:"
    echo "  $0 /var/log /backup_dir"
    echo ""
    echo "Nota: El script generará un archivo de backup con el nombre"
    echo "      <directorio>_bkp_YYYYMMDD.tar.gz"
}

# Verificar si se solicitó ayuda
if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    show_help
    exit 0
fi

# Verificar número de argumentos
if [ $# -ne 2 ]; then
    echo "Error: Se requieren exactamente 2 argumentos"
    show_help
    exit 1
fi

ORIGEN=$1
DESTINO=$2

# Verificar que el origen existe
if [ ! -e "$ORIGEN" ]; then
    echo "Error: El directorio de origen '$ORIGEN' no existe"
    exit 1
fi

# Verificar que el destino existe
if [ ! -e "$DESTINO" ]; then
    echo "Error: El directorio de destino '$DESTINO' no existe"
    exit 1
fi

# Verificar que el destino está montado
if ! mountpoint -q "$DESTINO"; then
    echo "Error: El directorio de destino '$DESTINO' no está montado"
    exit 1
fi

# Obtener el nombre del directorio de origen
DIR_NAME=$(basename "$ORIGEN")

# Generar nombre del archivo de backup con fecha
FECHA=$(date +%Y%m%d)
BACKUP_FILE="${DIR_NAME}_bkp_${FECHA}.tar.gz"

# Crear el backup
echo "Creando backup de $ORIGEN..."
tar -czf "$DESTINO/$BACKUP_FILE" -C "$(dirname "$ORIGEN")" "$(basename "$ORIGEN")"

# Verificar si el backup fue exitoso
if [ $? -eq 0 ]; then
    echo "Backup completado exitosamente: $BACKUP_FILE"
    exit 0
else
    echo "Error al crear el backup"
    exit 1
fi 