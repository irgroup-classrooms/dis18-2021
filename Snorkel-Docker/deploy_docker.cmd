git clone https://github.com/Git-Romer/snorkel-tutorials.git
cd snorkel-tutorials
py scripts/docker_launch.py spam --build
cd ..
rmdir snorkel-tutorials /s /q
docker swarm init
docker stack deploy --compose-file docker-compose.yml snorkel1
echo Done!
pause