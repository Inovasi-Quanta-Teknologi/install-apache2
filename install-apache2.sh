#!/bin/bash
set -e

echo "======================================"
echo "🚀 Starting Apache2 installation setup"
echo "======================================"

# Update system packages
echo "🔄 Updating package list..."
sudo apt update -y

# Install Apache2
echo "📦 Installing Apache2..."
sudo apt install -y apache2

# Enable common Apache modules
echo "⚙️ Enabling common Apache modules..."
sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_http

# Install useful libraries
echo "📚 Installing common dependencies..."
sudo apt install -y \
    libapache2-mod-php \
    php-cli \
    php-mysql \
    php-curl \
    php-xml \
    php-mbstring \
    php-zip \
    php-bcmath \
    php-intl \
    unzip curl ufw

# Enable and start Apache
echo "▶️ Enabling Apache2 to start on boot..."
sudo systemctl enable apache2
sudo systemctl start apache2

# Adjust firewall
echo "🌐 Configuring UFW firewall for Apache..."
sudo ufw allow 'Apache Full'

# Verify installation
echo "✅ Apache version:"
apache2 -v

echo "✅ PHP version:"
php -v

echo "======================================"
echo "🎉 Apache2 + PHP installation completed!"
echo "======================================"
