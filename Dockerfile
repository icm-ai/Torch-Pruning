# Use a slim Python image to keep the size down
FROM python:3.8-slim

# Set the working directory
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Clone the repository and install dependencies
RUN git clone https://github.com/VainF/Torch-Pruning.git . \
    && pip install --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple \
    && apt-get purge -y --auto-remove git

# Set up the entry point
CMD ["/bin/bash"]
