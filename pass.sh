#!/bin/bash

function pass(){
    # Remplacez "votre_mot_de_passe" par votre mot de passe
    local mdp="votre_mot_de_passe"
    echo "$mdp" | xclip -selection clipboard
    echo "password check"
}

pass 
