# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Pull the model during build
RUN ollama pull deepseek-r1:1.5b || true

# Expose the API port
EXPOSE 11434

# Start Ollama API on container start
CMD ["ollama", "serve", "--host", "0.0.0.0"]
