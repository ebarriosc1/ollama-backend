# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Preload the required model to avoid downloading at runtime
RUN ollama pull deepseek-r1:1.5b || true

# Set environment variables
ENV OLLAMA_HOST=0.0.0.0:11434

# Expose the Ollama API port
EXPOSE 11434

# Start Ollama API on container startup
CMD ["/usr/bin/ollama", "serve"]
