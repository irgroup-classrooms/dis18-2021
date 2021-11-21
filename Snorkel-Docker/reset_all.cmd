@echo off
docker stack rm snorkel1
echo WAITING TO STOP SWARM
timeout /T 20 /nobreak
docker swarm leave --force
docker image rm spam:latest
echo Done!
pause