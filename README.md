Bonjour/Bonsoir

Alors voilà mon code se trouve lib/tasks/import.rake, j'ai aussi fait un import2.rake pour importer un buldings2.csv.

Je run en commande *bundle exec rake import:buildings* pour l'executer.

Il y a une petit seed pour remplir Building

J'ai créé Building.namestock pour stocker les précédents 'manager_name'.

En fait j'avais oublié mais je ne suis pas arrivé à facilement faire en sorte que namestock soit un Array. (à cause de sqlite3 ?). 
J'ai donc opter pour une autre manière:  
Building.namestock n'est donc pas un array mais un text_field où je rajoute les manager_name séparés par une virgule.
Je .split ensuite lors du code.

note: J'ai codé et push via le mac que j'ai récupéré d'une tante, les commit ne sont pas encore à mon nom via cet ordinateur. Mais c'est bien moi!

note: Je suis bien conscient de la faute d'orthographe "bu_lding.csv" 


Melec du Halgouet
