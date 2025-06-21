FROM alpine:3.19

# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    git \
    ca-certificates

# Create non-root user
RUN addgroup -g 1000 vsix && \
    adduser -D -s /bin/bash -G vsix -u 1000 vsix

# Create directories
RUN mkdir -p /app /output && \
    chown -R vsix:vsix /app /output

# Copy the script
COPY vsix-cli /app/vsix-cli
RUN chmod +x /app/vsix-cli && \
    chown vsix:vsix /app/vsix-cli

# Create symlink for global access
RUN ln -s /app/vsix-cli /usr/local/bin/vsix-cli

# Switch to non-root user
USER vsix
WORKDIR /output

# Set environment variables
ENV PATH="/app:${PATH}"
ENV HOME="/home/vsix"

# Create config directory
RUN mkdir -p /home/vsix/.config/vsix-cli

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD vsix-cli version || exit 1

# Default command
ENTRYPOINT ["vsix-cli"]
CMD ["--help"]

# Labels for metadata
LABEL org.opencontainers.image.title="vsix-cli" \
      org.opencontainers.image.description="Download and install VS Code extensions from multiple marketplaces" \
      org.opencontainers.image.url="https://github.com/hongkongkiwi/vsix-cli" \
      org.opencontainers.image.source="https://github.com/hongkongkiwi/vsix-cli" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.authors="Andy Savage <andy@savage.hk>" 