Bonjour/Bonsoir

Alors voilà mon code se trouve lib/tasks/import.rake, j'ai aussi fait un import2.rake pour importer un buldings2.csv.

Je run en commande *bundle exec rake import:buildings2* pour l'executer.

Il y a une petit seed pour remplir Building

EDIT 
---
j'ai déplacé les fonctions dans models/buildings.rb 
j'ai supprimé la collonne namestock qui servait à stocker les anciennes valeurs de manager_name
J'ai remplacé cela par un système d'historique (je crée des records et regarde grace à la référence des buildings si le manager_name des records du csv match avec les manager_name des anciens records dans la db)





note: J'ai codé et push via le mac que j'ai récupéré d'une tante, les commit ne sont pas encore à mon nom via cet ordinateur. Mais c'est bien moi!

note: Je suis bien conscient de la faute d'orthographe "bu_lding.csv" 


Melec du Halgouet
