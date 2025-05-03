# Use a lightweight base image
FROM debian:bullseye-slim

# Install dnsmasq
RUN apt-get update && \
    apt-get install -y dnsmasq && \
    apt-get clean

# Copy the dnsmasq configuration file
COPY dnsmasq.conf /etc/dnsmasq.conf

# Expose the DNS port
EXPOSE 53/udp

# Start dnsmasq
CMD ["dnsmasq", "-k"]
