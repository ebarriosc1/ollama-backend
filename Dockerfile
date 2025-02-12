# Use an official Ubuntu image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

RUN ollama pull llama3.1:8b
# Expose the API port
EXPOSE 11434

# Run Ollama API
CMD ["ollama", "serve"]
