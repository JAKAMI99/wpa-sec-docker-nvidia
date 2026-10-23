# Start with the NVIDIA CUDA base image (Ubuntu 24.04 LTS)
FROM nvidia/cuda:12.9.2-devel-ubuntu24.04

LABEL com.nvidia.volumes.needed="nvidia_driver"

ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    ca-certificates \
    build-essential \
    python3 \
    git \
    curl \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up the NVIDIA environment
ENV PATH=/usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# Clone and build Hashcat
RUN mkdir -p /hashcat && \
    cd /hashcat && \
    git clone https://github.com/hashcat/hashcat.git . && \
    git submodule update --init && \
    make install && \
    rm -rf .git

# Create a subfolder for script output
RUN mkdir -p /app/data

# Set the working directory to the script output folder
WORKDIR /app/data

# Entrypoint script to dynamically pull the latest Python script and run it
COPY entry.sh /app/entry.sh
RUN chmod +x /app/entry.sh

# Set the entrypoint to the custom script
ENTRYPOINT ["/app/entry.sh"]

