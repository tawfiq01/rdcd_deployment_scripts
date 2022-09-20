#!/bin/bash

#Create Date: 08-09-2022
#Description: Jenkins to server(RDCD Live Server:10.11.200.32) deploy.
#Prerequsite: Should be configured ssh connection jenkins to app server.

ssh rdcd@10.11.200.32 << endssh 
cd /home/rdcd/App/cooperative-client
git switch main
git pull origin main
npm install
npm run build
cd /home/rdcd/App/pm2-scripts
pm2 start pm2-coop-client.json
ENDSSH