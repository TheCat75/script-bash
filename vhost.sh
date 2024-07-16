#!/bin/bash

function createvhostforprojet() {
    local projet="$1"
    local vhost_conf="/etc/apache2/sites-available/${projet}.conf"
    local document_root="/var/www/html/${projet}"
    local host_entry="127.0.0.1 ${projet}.com"
    
    local lgn1="<VirtualHost *:80>"
    local lgn2="  ServerAdmin webmaster@localhost"
    local lgn3="  DocumentRoot ${document_root}"
    local lgn4="  ServerName ${projet}.com"
    local lgn5="  ServerAlias www.${projet}.com"
    local lgn6="  ErrorLog \${APACHE_LOG_DIR}/error.log"
    local lgn7="  CustomLog \${APACHE_LOG_DIR}/access.log combined"
    local lgn8="</VirtualHost>"

    if [ -z "$projet" ]; then
        echo "Usage: $0 nom_du_projet"
        exit 1
    fi

    if [ -d "$document_root" ]; then
        echo "Le projet $projet existe déjà."
        exit 1
    else
        mkdir -p "$document_root" && \
        chown -R "$(whoami):$(whoami)" "$document_root"

        echo -e "$lgn1\n$lgn2\n$lgn3\n$lgn4\n$lgn5\n$lgn6\n$lgn7\n$lgn8" > "$vhost_conf"

        if ! grep -q "${projet}.com" /etc/hosts; then
            echo "$host_entry" >> /etc/hosts
        fi

        a2ensite "${projet}.conf"
        systemctl restart apache2

        echo "Répertoire et fichier de configuration vhost pour $projet créés."
    fi
}

if [ "$(id -u)" -ne 0 ]; then
    echo "Ce script doit être exécuté en tant que root ou avec sudo."
    sudo su -c "bash $0"
    exit 0
fi

read -p "Entrez le nom du projet: " nom_du_projet

createvhostforprojet "$nom_du_projet"
