# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Copy the startup script into the container
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV OLLAMA_HOST=0.0.0.0:11434

# Expose the API port
EXPOSE 11434

# Use the startup script to launch Ollama
CMD ["/bin/bash", "/start.sh"]
