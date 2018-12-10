FROM linuxserver/plex:latest

RUN apt update && apt install -y software-properties-common

RUN add-apt-repository ppa:graphics-drivers && apt update

RUN apt install -y ubuntu-drivers-common lshw vainfo va-driver-all libva-dev

RUN apt-get update && apt install -y nvidia-driver-410

COPY patch.sh /patch.sh

RUN chmod a+x /patch.sh

RUN /patch.sh 410.78