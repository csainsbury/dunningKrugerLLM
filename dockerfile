# Use NVIDIA's CUDA image as the base
#FROM nvidia/cuda:12.5.0-devel-ubuntu22.04
FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --upgrade pip
RUN pip3 install torch torchvision torchaudio -f https://download.pytorch.org/whl/cu111/torch_stable.html

# Install Ollama application
RUN curl -fsSL https://ollama.com/install.sh | sh

# Install other Python dependencies
RUN pip3 install ollama transformers langchain accelerate anthropic sentence_transformers scikit-learn numpy pandas ipython polars matplotlib ipykernel pyarrow

# Set the working directory
WORKDIR /workspace

# Add the setup script to the Docker image
COPY setup.sh /workspace/setup.sh
RUN chmod +x /workspace/setup.sh

# Run the setup script and keep the container running
CMD ["sh", "-c", "./setup.sh && tail -f /dev/null"]
