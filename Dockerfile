# Use official Ollama image
FROM ollama/ollama

# Expose the API port
EXPOSE 11434

# Start Ollama server
CMD ["ollama", "serve"]
