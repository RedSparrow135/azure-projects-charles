#!/bin/bash
sudo su
apt-get -y update
apt-get -y install nginx git

# Iniciar Nginx
systemctl start nginx
systemctl enable nginx

# Clonar tu repo principal
git clone https://github.com/RedSparrow135/azure-projects-charles.git

# Copiar tu carpeta de demo web al directorio de Nginx
cd azure-projects-charles/01-vm-ubuntu-webserver/azure-web-demo
sudo cp -r * /var/www/html/

# Permisos correctos
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Reiniciar Nginx
sudo systemctl restart nginx

echo "✅ Web desplegada desde GitHub: RedSparrow135/azure-projects-charles"
