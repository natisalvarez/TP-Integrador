# TP Integrador - Computación Aplicada
# Grupo 6

Integrantes del grupo: Natalia Soledad Álvarez / Micaela Cecilia Omahna

Docentes: Martín Barrios / Matias Chiesa

*Contenido del proyecto*

Este repositorio contiene:

1. Compresiones de directorios requeridos: /root, /etc, /opt, /www_dir, /backup_dir, /proc/particion
2. Backup de /var dividido en partes: var_part_aa y var_part_ab.
3. El directorio /proc no fue comprimido. Se incluye el archivo particion.txt con el contenido de /proc/partitions.

*Uso del script de backup: ./backup_full.sh*

Automatización de backups con cron El script backup_full.sh se ejecuta automáticamente mediante tareas programadas (cron):

- Todos los días a las 00:00: Realiza backup de /var/log en /backup_dir.
- Lunes, miércoles y viernes a las 23:00: Realiza backup de /www_dir en /backup_dir.

El script backup_full.sh se encuentra en la máquina virtual ubicado en la ruta /opt/scripts/.
