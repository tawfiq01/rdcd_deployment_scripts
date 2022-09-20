#!/bin/bash

#Create Date: 08-09-2022
#Description: Jenkins to server(RDCD Live Server:10.11.200.32) deploy.
#Prerequsite: must be configured ssh connection jenkins to app server.

ssh rdcd@10.11.200.32 << endssh 
#must be configure ssh for github to app directory. 
cd /home/rdcd/App/loan-core
git switch main
git pull origin main
npm install
npm run build
cd /home/rdcd/App/pm2-scripts
pm2 start pm2-loan-core.json
ENDSSH