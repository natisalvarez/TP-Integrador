# Agregar estas líneas al crontab (crontab -e):

# Backup diario de /var/log a las 00:00
0 0 * * * /opt/scripts/backup_full.sh /var/log /backup_dir

# Backup de /www_dir los lunes, miércoles y viernes a las 23:00
0 23 * * 1,3,5 /opt/scripts/backup_full.sh /www_dir /backup_dir 