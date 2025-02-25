# Use the official Ubuntu image as the base
FROM ubuntu:latest

# Set environment variables
ENV USER=root
ENV DISPLAY=host.docker.internal:0

# Update the package list and install required packages
RUN apt-get update && \
    apt-get install -y wget gnupg2 xfce4 x11-apps openssh-server git && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable && \
    apt-get install -y curl && \
    apt-get install -y vim && \
    apt-get install -y rsync && \
    apt-get install -y python3 python3-pip && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the root password
RUN echo "root:password" | chpasswd

# Allow root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config

# Create the SSH privilege separation directory
RUN mkdir -p /run/sshd



# Create a working directory
WORKDIR /app

COPY ./scripts /scripts
RUN chmod -R +x /scripts

# Expose the necessary ports
EXPOSE 5901 4000 3000 5000 22

# Use the startup script to start sshd and bash
ENTRYPOINT ["/scripts/start.sh"]

