# [WPA-Sec](https://wpa-sec.stanev.org/) Docker (Nvidia)
## About
This docker container runs the help_crack.py from [wpa-sec](https://wpa-sec.stanev.org/), a "Distributed WPA PSK auditor". The docker container utilizes the ubuntu 22.04 hashcat binary.

The docker container currently only supports NVIDIA GPUs. Feel free to PR support for AMD 
## Install from Dockerhub (recommended)
```
docker pull jakami/wpa-sec-docker-nvidia:latest
docker run -it --gpus all -v $HOME/.docker-data/wpa-sec-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpa-sec-docker-nividia:latest
```
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
docker build -t wpa-sec-docker-nvidia:latest .
docker run -it --gpus all -v $HOME/.docker-data/wpa-sec-docker:/app/data -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpa-sec-docker-nividia:latest

```
pwnamap
## Potfile
When using the supplied run command or the Docker Compose file, the container will put a file "cracked.pot" into the data directory which gets mounted at `$HOME/.docker-data/wpa-sec-docker`. The file will store all your loot :3