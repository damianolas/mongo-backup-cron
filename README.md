# Premessa
Backup di un nodo MongoDB in locale e su S3.
In locale resta sempre il latest, mentre su S3 c'è un versioning per data.

Si omette la parte di installazione della AWS CLI e dello IAM Role associato al server, per i permessi di accesso al bucket.

Si imposta un cronjob per un processo automatico periodico.

# Procedura
- Crea la folder di backup locale
  ``` 
  cd
  mkdir mongobackup
  ```
- Crea lo script "mongo-backup.sh" nel nodo
- Aggiungi il permesso di execution:
  ``` 
  sudo chmod +x mongo-backup.sh
  ```
- Crea una folder di log per il cron:
  ```
  sudo mkdir /var/log/mongo_backup
  sudo chown ec2-user:ec2-user /var/log/mongo_backup
  ```
- Crea il cron (nell'esempio si esegue ogni notte alle 2):
  ```
  crontab -e  
  ```
  ```
  0 2 * * * /home/ec2-user/mongo-backup.sh >>/var/log/mongo_backup/mongo_backup.log 2>&1
  ```
