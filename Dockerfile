# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Expose API port
EXPOSE 11434

# Start Ollama correctly
CMD ["ollama", "serve", "--host", "0.0.0.0"]

RUN ollama pull deepseek-r1:1.5b
