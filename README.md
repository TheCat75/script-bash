# Scripts Personnalisés pour Terminal

Ce dépôt contient une collection de scripts Bash pour améliorer l'efficacité du développement et la gestion des projets.

## Scripts Inclus

- `pass.sh` : Un script pour copier un mot de passe dans le presse-papiers.
- `symfony_script.sh` : Un ensemble de commandes pour gérer un projet Symfony.
- `createvhost.sh` : Un script pour créer rapidement des hôtes virtuels pour Apache.
- `createUserMysql.sh` : Un script pour créer des utilisateurs MySQL avec des privilèges spécifiques.

## Utilisation

Chaque script est documenté avec des commentaires expliquant son fonctionnement. Pour utiliser un script, rendez-le exécutable avec la commande `chmod +x nom_du_script.sh` et exécutez-le avec `./nom_du_script.sh`.

## Création d'Alias pour les Scripts

Pour faciliter l'exécution des scripts, vous pouvez créer des alias. Suivez ces étapes pour configurer votre environnement :

1. Créez un dossier `script-perso/` dans le dossier `bin/` situé à la racine de votre système :
   
   sudo mkdir -p /bin/script-perso/

2. Copiez ensuite tous les scripts dans ce dossier :

   sudo cp chemin/vers/vos/scripts/*.sh /bin/script-perso/

3. Donnez la propriété des fichiers à l’utilisateur root :

   sudo chown -R root:root /bin/script-perso/

4. Ouvrez votre fichier .bashrc avec un éditeur de texte, par exemple nano :

    sudo nano ~/.bashrc

5. Ajoutez ces lignes à la fin du fichier pour mettre à jour votre variable PATH :

    export PATH="$PATH:/bin/script-perso"

6. Créez un alias pour chaque script en ajoutant des lignes comme celle-ci :

    alias votre_alias="/bin/script-perso/nom-du-script.sh"

Remplacez votre_alias par l’alias que vous souhaitez utiliser et nom-du-script.sh par le nom réel de votre script.

7. Une fois les modifications enregistrées, exécutez la commande suivante pour que les changements prennent effet :

    source ~/.bashrc

Avec ces alias, vous pourrez exécuter vos scripts personnalisés directement depuis le terminal en utilisant l’alias correspondant.


Assurez-vous de remplacer `chemin/vers/vos/scripts/` par le chemin réel où vos scripts sont stockés avant de les copier. De même, remplacez `votre_alias` et `nom-du-script.sh` par les noms que vous souhaitez utiliser pour vos alias et scripts. Si vous avez besoin d'aide supplémentaire ou si vous avez des questions, n'hésitez pas à demander !
