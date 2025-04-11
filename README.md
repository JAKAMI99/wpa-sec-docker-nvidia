# [WPA-Sec](https://wpa-sec.stanev.org/) Docker (Nvidia)
## About
This docker container runs latest the help_crack.py from the [wpa-sec](https://wpa-sec.stanev.org/hc/help_crack.py), a "Distributed WPA PSK auditor". The docker container utilizes the ubuntu 22.04 hashcat binary.

The docker container currently only supports NVIDIA GPUs. Feel free to PR support for AMD 

## Prerequisites:
You need the `NVIDIA Container Toolkit` in order to run this container.
First install it from [HERE](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html#installation) and restart your docker daemon `sudo systemctl restart docker` 
# Installing methods:

## Install from Dockerhub (recommended)
```
docker pull jakami/wpa-sec-docker-nvidia:latest
docker run -it --gpus all -v $HOME/.docker-data/wpa-sec-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all jakami/wpa-sec-docker-nvidia:latest
```
## Oneliner for Windows 
```
docker run -it --gpus all -v %USERPROFILE%\.docker-data\wpa-sec-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all jakami/wpa-sec-docker-nvidia:latest
```
(Thanks to @HackCocaine in #5)
## Docker Compose build and run
```
git clone https://github.com/JAKAMI99/wpa-sec-docker-nvidia.git
cd wpa-sec-docker-nvidia
docker-compose build
docker-compose up
```
## Manual build and run
```
git clone https://github.com/JAKAMI99/wpa-sec-docker-nvidia
cd wpa-sec-docker-nvidia
docker build -t jakami/wpa-sec-docker-nvidia:latest .
docker run -it --gpus all -v $HOME/.docker-data/wpa-sec-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all jakami/wpa-sec-docker-nvidia:latest
```
pwnamap
## Potfile
When using the supplied run command or the Docker Compose file, the container will put a file "cracked.pot" into the data directory which gets mounted at `$HOME/.docker-data/wpa-sec-docker`. The file will store all your loot :3
