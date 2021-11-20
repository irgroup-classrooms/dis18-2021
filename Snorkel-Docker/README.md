# Tutorial - Docker & Snorkel

Hi everyone,  
this is a Tutorial on how to install Snorkel with Docker. This has only been tested on a system running Windows.  
The later mentioned automatic scripts are based on the Windows CLI so you will have to run the commands manually on any other OS. If you need help on the installation for Linux or MacOS either DM me or refer to the original installation instructions [on this page](https://github.com/snorkel-team/snorkel).  
The tutorial and all scripts are based on this [snorkel tutorial repo](https://github.com/snorkel-team/snorkel-tutorials).  
___
I’ve had some issues installing the Snorkel - Docker version so I decided to write a little tutorial and even write some scripts that will automatically build the image and deploy the container on your docker system. Those scripts will take care of the whole installation so this Tutorial can be as short as possible.  
**Important note:** While testing Snorkel on my device I saw that 100% of my CPU was used even though I was not running any lines of code. I figured that the Image configuration is set to allow snorkel to use all available system resources. As this could lead to memory running out of bounds or simply your system crashing, I’ve decided to restrict its resources using Docker Swarms (correct me if im wrong).  
Similar to Solr, Docker Swarms are initially used to split the load on multiple docker engines. This is the only working way to limit the resource utilization of our container. If you want to read more about Docker Swarms you can have a look at [this documentation](https://docs.docker.com/engine/swarm/stack-deploy/).  
## Now onto the installation steps:
### 1.	If you haven’t installed Docker yet  
please do so. If you need help with that, please refer to [this tutorial](https://github.com/irgroup-classrooms/dis17-2021/tree/main/Solr-Docker) (Step 1 & 2). You will find all the necessary links there.  
**Important note:** If you’re running a windows system and using an **account without admin privileges** you will have to follow [step five on this page](https://docs.docker.com/desktop/windows/install/#install-docker-desktop-on-windows) to be able to run Docker containers as a non admin user.  
Once downloaded and installed please open Docker Desktop.
### 2.	Download  
all the `.cmd` files from this folder along with the [docker-compose](docker-compose.yml) file.
### 3.	Create a folder  
somewhere on your local machine and save all the from step 2 downloaded files there.
### 4.	As explained before to prevent your system from crashing  
or overheating you will need to specify your resources. To do so open the [docker-compose](docker-compose.yml) file in any editor and change the values under the `resources` node to your liking.  
> The supported units are `b`, `k`, `m` and `g`, and their alternative notation `kb`, `mb` and `gb`. Decimal values are not supported at this time.  
For further information on units and defining resources visit [this page](https://docs.docker.com/compose/compose-file/compose-file-v2/#cpu-and-other-resources).
### 5.	Run the `docker_deploy.cmd` file  
and wait until it says `Done!` and wants you to press any key to continue.  
___
If you followed all those steps and no error messages have come up, then you should find a running container in your Docker container list. Snorkel or rather the Jupyter Notebook will be accessible on [localhost:8888](http://localhost:8888).  
## Stopping the container:
**Please don’t use Dockers start and stop buttons on the GUI.** As we are using Docker Swarms, Docker will always recreate the instances. To stop the container run the `stop_swarm.cmd` script that you’ve downloaded in step 2.
## Starting the container:
As soon as you stop the container it will no longer be visible in your container list. Same as stopping the container, please use the `start_swarm.cmd` file to start your container.  
## Resetting everything to default (except the data folder):
If you want to reset the installation and begin from 0 you can run the `reset_all.cmd` script. This will stop and remove all the snorkel running containers and delete the image.  
## Last very important note:
**Docker containers are not persistent unless you use a volume bind.** This means that unless you save all your files in the data folder (or on the container itself under /tmp/data) every time you stop the container it will dump all its data and your progress will be lost. So be careful and **always save your stuff in the corresponding folders.**
___
If any questions arise or if there are error messages while youre trying to follow the tutorial, please feel free to open a ticket or DM me.