
https://pptr.dev/troubleshooting
https://gigi.nullneuron.net/gigilabs/running-puppeteer-under-docker
https://pkgs.alpinelinux.org/packages?name=chromium&branch=v3.18&repo=&arch=&maintainer=

docker build -t pupdock .

docker run pupdock

docker container ls -a

docker container ls -l -q

docker cp `docker container ls -l -q`:/puppeteer/screenshot.png ./screenshot.png

