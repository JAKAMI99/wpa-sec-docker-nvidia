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

# Install Hashcat from repository
RUN apt-get update && apt-get install -y hashcat

# Set up the Python environment
RUN pip3 install --upgrade pip

# Copy your Python script to the container
# (Replace my_script.py with your actual script)
COPY help_crack.py /app/help_crack.py

# Set the working directory
WORKDIR /app

# Define the default command to run the script
CMD ["python3", "help_crack.py", "-co", "--deprecated-check-disable"]
