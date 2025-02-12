# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose API port
EXPOSE 11434

# Run Ollama and ensure the model is pulled at runtime
CMD ollama serve --host 0.0.0.0 & sleep 5 && ollama pull llama3.1:8b && fg
