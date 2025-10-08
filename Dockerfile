ARG VERSION=latest
FROM gradle:${VERSION}

ARG TARGETARCH
RUN if [ "$TARGETARCH" = "arm64" ]; then \
      curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; \
    else \
      curl -sSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; \
    fi && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    rm -rf aws/ && \
    aws --version && gradle --quiet --version
