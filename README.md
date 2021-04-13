# Premessa
Backup di un nodo MongoDB in locale e su S3.
In locale resta sempre il latest, mentre su S3 c'è un versioning per data.

Si omette la parte di installazione della AWS CLI e dello IAM Role associato al server, per i permessi di accesso al bucket.

Si imposta un cronjob per un processo automatico periodico.

# Procedura
- Crea lo script "mongo_backup.sh" nel nodo
- Crea EC2 AmazonLinux2  

Installa mongoDB (https://docs.mongodb.com/manual/tutorial/install-mongodb-on-amazon/)  
- Consenti l'accesso dall'esterno:
  ``` 
  sudo vim /etc/mongod.conf
  ```
  e imposta:
  ```
  bindIp: 0.0.0.0
  ```
