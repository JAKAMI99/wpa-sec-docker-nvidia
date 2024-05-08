# Start with the NVIDIA CUDA base image
FROM nvidia/cuda:11.8.0-base-ubuntu22.04

# Install essential tools and update packages
RUN apt-get update && apt-get install -y \
    build-essential \
    python3 \
    python3-pip \
    git \
    curl \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Hashcat
RUN wget https://github.com/hashcat/hashcat/releases/download/v6.2.6/hashcat-6.2.6.7z \
    && apt-get install -y p7zip-full \
    && 7z x hashcat-6.2.6.7z \
    && mv hashcat-6.2.6 /usr/local/hashcat \
    && ln -s /usr/local/hashcat/hashcat /usr/bin/hashcat

# Set up the Python environment
RUN pip3 install --upgrade pip

# Copy your Python script to the container
# (Replace my_script.py with your actual script)
COPY my_script.py /app/my_script.py

# Set the working directory
WORKDIR /app

# Define the default command to run the script
CMD ["python3", "help_crack.py", "-co", "--deprecated-check-disable"]
