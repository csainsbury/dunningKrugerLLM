#!/bin/bash

# Start the Ollama service
/usr/local/bin/ollama serve &

# Wait for Ollama service to start by checking the port
until curl --output /dev/null --silent --head --fail http://127.0.0.1:11434; do
  echo "Waiting for Ollama service to start..."
  sleep 2
done

# Download the LLaMA 3 (7B) model using Ollama
ollama pull llama3.1:8b
ollama pull llama3.1:70b

ollama pull gemma2:2b
ollama pull gemma2:9b
ollama pull gemma2:27b

ollama pull mistral-nemo
ollama pull mistral-small

ollama pull qwen2.5:1.5b
ollama pull qwen2.5:3b
ollama pull qwen2.5:7b
ollama pull qwen2.5:14b

# Any other setup steps

