


docker build -t ubuntu-image .

docker run -it -p 5901:5901 -p 4000:4000 -p 3000:3000 -p 3001:3001 -p 3002:3002 -p 3003:3003 -p 5000:5000 -p 2022:22  -v "c:\\":/c  -e DISPLAY=host.docker.internal:0 -e USER=root  --name work3 ubuntu-image

pause
