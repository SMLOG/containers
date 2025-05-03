docker run -d --name dnsmasq --network host \
  --restart always \
  --add-host example.com:192.168.1.100 \
  --add-host anotherdomain.com:192.168.1.101 \
  my-dnsmasq
