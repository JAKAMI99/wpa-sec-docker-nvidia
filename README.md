# WPA-Sec Docker for Nvidia

## Install & Run
```
docker run -it --gpus all -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpas-ec-docker-nividia
docker pull jakami/wpa-sec-docker-nvidia:latest
```
## Run 
```
docker run -it --gpus all -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpas-ec-docker-nividia
```
Edit `NVIDIA_VISIBLE_DEVICES=all` to a index, if you have multiple GPUs (e.x. `=0`" to select the first GPU)

## Build & Run
```
git clone https://github.com/JAKAMI99/wpa-sec-docker-nvidia
cd wpa-sec-docker-nvidia
docker build -t wpa-sec-docker-nvidia:latest .
docker run -it --gpus all -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=all wpa-sec-docker-nividia:latest
```