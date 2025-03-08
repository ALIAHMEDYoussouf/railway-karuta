FROM tomcat:9-jdk11

# Copier les fichiers WAR dans webapps
COPY karuta.war /usr/local/tomcat/webapps/
COPY karuta-backend.war /usr/local/tomcat/webapps/
COPY karuta-fileserver.war /usr/local/tomcat/webapps/

# Configurer les variables d'environnement
ENV JAVA_OPTS="-Xmx512m"

# Exposer le port
EXPOSE 8080

# Démarrer Tomcat
CMD ["catalina.sh", "run"]
