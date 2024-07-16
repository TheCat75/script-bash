#!/bin/bash

# Définir les couleurs
RED='\033[0;31m' # Rouge
GREEN='\033[0;32m' # Vert
YELLOW='\033[0;33m' # Jaune
BLUE='\033[0;34m' # Bleu
NC='\033[0m' # Pas de couleur

function symfony_script() {
    cmd=$1
    if [ "$cmd" == "sa" ]; then
        echo -e "${GREEN}Starting symfony server${NC}"
        symfony serve
    elif [ "$cmd" == "so" ]; then
        echo -e "${RED}Stopping symfony server${NC}"
        symfony server:stop
    elif [ "$cmd" == "cl" ]; then
        echo -e "${BLUE}Clearing cache${NC}"
        symfony console cache:clear
    elif [ "$cmd" == "ci" ]; then
        echo -e "${YELLOW}Installing dependencies${NC}"
        composer install
    elif [ "$cmd" == "up" ]; then
        echo -e "${YELLOW}Updating dependencies${NC}"
        composer update
    elif [ "$cmd" == "cont" ]; then
        echo -e "${BLUE}Creating a new controller${NC}"
        symfony console make:controller
    elif [ "$cmd" == "ent" ]; then
        echo -e "${BLUE}Creating a new entity${NC}"
        symfony console make:entity
    elif [ "$cmd" == "mig" ]; then
        echo -e "${BLUE}Creating a new migration${NC}"
        symfony console make:migration
    elif [ "$cmd" == "migrate" ]; then
        echo -e "${BLUE}Migrating the database${NC}"
        symfony console doctrine:migrations:migrate
    elif [ "$cmd" == "list" ]; then
        echo -e "${BLUE}Listing all routes${NC}"
        symfony console debug:router
    elif [ "$cmd" == "fix" ]; then
        echo -e "${BLUE}Loading fixtures${NC}"
        symfony console doctrine:fixtures:load -n
    elif [ "$cmd" == "dsu" ]; then
        echo -e "${BLUE}Updating schema${NC}"
        symfony console doctrine:schema:update --force
    elif [ "$cmd" == "b" ]; then
        echo -e "${GREEN}Running npm build${NC}"
        npm run build
    elif [ "$cmd" == "w" ]; then
        echo -e "${GREEN}Running npm watch${NC}"
        npm run watch
    elif [ "$cmd" == "i" ]; then
        echo -e "${GREEN}Running npm install${NC}"
        npm install
    elif [ "$cmd" == "if" ]; then
        echo -e "${GREEN}Running npm install with force${NC}"
        npm install -f
    elif [ "$cmd" == "up" ]; then
        echo -e "${GREEN}Running npm update${NC}"
        npm update
    elif [ "$cmd" == "shl" ]; then
        echo -e "${GREEN}Launching terminal configured for Symfony${NC}"
        if ! command -v tilix &> /dev/null; then
            echo -e "${RED}Tilix n'est pas installé. Veuillez l'installer pour exécuter ce script.${NC}"
            exit 1
        fi

        # Demande du nom du fichier JSON à l'utilisateur
        read -p "Veuillez entrer le nom du fichier JSON (sans chemin): " json_filename

        # Définir le chemin complet du fichier JSON
        json_file="/bin/script-perso/file-shell/$json_filename-shell.json"

        # Vérifier si le fichier existe
        if [ ! -f "$json_file" ]; then
            echo -e "${RED}Le fichier $json_file n'existe pas. Veuillez vérifier le nom et réessayer.${NC}"
            exit 1
        fi

        # Lancer Tilix avec la session spécifiée
        tilix --session="$json_file"
    elif [ "$cmd" == "h" ]; then
        echo -e "${YELLOW}Available commands: 
        symfony serve = sa, 
        symfony server:stop = so, 
        symfony console cache:clear = cl, 
        composer install = ci,
        composer update = up,
        symfony console make:controller = cont,
        symfony console make:entity = ent,
        symfony console make:migration = mig,
        symfony console doctrine:migrations:migrate = migrate,
        symfony console debug:router = list,
        symfony console doctrine:fixtures:load -n = fix,
        symfony console doctrine:schema:update --force = dsu,
        npm run build = b,
        npm run watch = w,
        npm install = i,
        npm install -f = if,
        npm update = up,
        launch terminal configured for Symfony = shl${NC}"
    else
        echo -e "${RED}Command not found${NC}"
    fi
}

symfony_script $1