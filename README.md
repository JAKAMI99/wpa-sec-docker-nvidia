# [WPA-Sec](https://wpa-sec.stanev.org/) Docker (Nvidia)
## About
This docker container runs the help_crack.py from [wpa-sec](https://wpa-sec.stanev.org/), a "Distributed WPA PSK auditor". The docker container utilizes the ubuntu 22.04hashcat binary.

The docker container currently only supports NVIDIA GPUs. Feel free to PR support for AMD 
## Install & Run
```
docker run -it --gpus all -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpas-ec-docker-nividia
docker pull jakami/wpa-sec-docker-nvidia:latest
```
## Run 
```
docker run -it --gpus all -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpas-ec-docker-nividia
```
Edit `NVIDIA_VISIBLE_DEVICES=all` to an index, if you have multiple GPUs (e.g. `=0` to select the first GPU)

## Manual Build
```
git clone https://github.com/JAKAMI99/wpa-sec-docker-nvidia
cd wpa-sec-docker-nvidia
docker build -t wpa-sec-docker-nvidia:latest .
```
Then enter the commands from Run