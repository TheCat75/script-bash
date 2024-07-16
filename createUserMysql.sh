#!/bin/bash

function createUserMysql(){
    # Demande de l'identifiant
    read -p "Veuillez entrer l'identifiant: " ident

    # Demande du mot de passe
    read -p "Veuillez entrer le mot de passe: " mdp

    # Demande si DataBase spécifique ou non
    read -p "Veuillez entrer le nom de la base de données (laisser vide pour toutes les bases de données): " db

    # Connexion à MySQL et création de l'utilisateur
    mysql <<MYSQL_SCRIPT
    CREATE USER '$ident'@'localhost' IDENTIFIED BY '$mdp';

    # Si l'utilisateur a spécifié une base de données, lui donner tous les privilèges sur cette base de données
    if [ -n "$db" ]; then
        GRANT ALL PRIVILEGES ON $db.* TO '$ident'@'localhost';
    else
        # Sinon, donner à l'utilisateur tous les privilèges sur toutes les bases de données
        GRANT ALL PRIVILEGES ON *.* TO '$ident'@'localhost';
    fi

    FLUSH PRIVILEGES;
MYSQL_SCRIPT

    echo "Utilisateur MySQL '$ident' créé avec succès."
}

createUserMysql