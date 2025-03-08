# Guide de déploiement Karuta

Ce dépôt contient tous les fichiers nécessaires pour déployer l'application Karuta.

## Composants du projet
- karuta.war - Frontend de l'application
- karuta-backend.war - Backend pour la gestion des données 
- karuta-fileserver.war - Serveur de fichiers

## Gestion locale sur Debian

### Commandes Tomcat
Pour gérer le serveur Tomcat local :
```bash
# Arrêter Tomcat
/opt/youssouf/tomcat/bin/shutdown.sh

# Démarrer Tomcat
/opt/youssouf/tomcat/bin/startup.sh
```

## Configuration ngrok

### Démarrage manuel
Pour créer un tunnel vers le serveur local :
```bash
~/ngrok http 8080
```

### Récupération de l'URL publique
Pour obtenir l'URL ngrok active :
```bash
curl http://localhost:4040/api/tunnels | grep -o '"public_url":"[^"]*' | grep -o 'http[^"]*'
```

### Configuration du démarrage automatique
Créer un service systemd pour ngrok :
```bash
sudo nano /etc/systemd/system/ngrok.service
```

Contenu du fichier service :
```
[Unit]
Description=ngrok
After=network.target

[Service]
ExecStart=/home/youssouf/ngrok http 8080
Restart=always
User=youssouf

[Install]
WantedBy=multi-user.target
```

Activation du service :
```bash
sudo systemctl enable ngrok
sudo systemctl start ngrok
```
