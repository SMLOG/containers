


docker build -t ubuntu-image .

docker run -it -p 5901:5901 -p 3000:3000 -p 5000:5000 -p 22:22  -v "c:\\":/c  -e DISPLAY=host.docker.internal:0 -e USER=root  --name mirror2 ubuntu-image

pause
