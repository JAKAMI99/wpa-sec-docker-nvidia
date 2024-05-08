# Start with the NVIDIA CUDA base image
FROM nvidia/cuda:12.1.1-devel-ubuntu22.04

LABEL com.nvidia.volumes.needed="nvidia_driver"

# Update and install essential packages
RUN apt-get update && apt-get install -y \
    ca-certificates \
    build-essential \
    python3 \
    python3-pip \
    git \
    curl \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up the NVIDIA environment
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# Clone and build Hashcat
RUN mkdir -p /hashcat && \
    cd /hashcat && \
    git clone https://github.com/hashcat/hashcat.git . && \
    git submodule update --init && \
    make install && \
    rm -rf .git

# Set up the Python environment
RUN pip3 install --upgrade pip

# Copy your Python script to the container
COPY help_crack.py /app/help_crack.py

# Create a subfolder for script output
RUN mkdir -p /app/data

# Set the working directory to the script output folder
WORKDIR /app/data

# Run the Python script
CMD ["python3", "../help_crack.py", "-co=--deprecated-check-disable", "--pot", "cracked.potfile"]
