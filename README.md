
sudo nano /etc/nginx/sites-available/bagisto
# Set proper ownership
sudo chown -R ubuntu:www-data /home/ubuntu/bagisto

# Give Nginx permission to traverse the directory paths
sudo chmod +x /var/www/html/bagisto
sudo chmod +x /var/www/html/bagisto
sudo chmod -R 755 /var/www/html/bagisto/public

https://devdocs.bagisto.com/getting-started/installation.html

