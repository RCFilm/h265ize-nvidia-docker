FROM linuxserver/plex:latest

RUN apt update && apt install -y software-properties-common

RUN add-apt-repository ppa:graphics-drivers && apt update

RUN apt install -y ubuntu-drivers-common lshw vainfo va-driver-all libva-dev