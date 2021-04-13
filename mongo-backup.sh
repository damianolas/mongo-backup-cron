#!/bin/bash
  
set -e

S3="<NOME-BUCKET>"
BACKUP_NAME=$(date +%y%m%d_%H%M%S).gz
DB="<NOME-DB>"
ENV="<SOTTOCARTELLA-BUCKET>"

date

echo "Dumping MongoDB $DB database to compressed archive"
mongodump --db $DB --excludeCollection "Logs" --archive=$HOME/mongobackup/<NOME>.gz --gzip

echo "Copying compressed archive to S3 bucket: $S3"
aws s3 cp $HOME/mongobackup/<NOME>.gz s3://$S3/$ENV/$BACKUP_NAME
