FROM linuxserver/plex:latest

RUN groupadd -g 18 video2 

RUN useradd -g video2 -u 18 video2

RUN usermod -aG video2 plex

RUN apt update && apt install -y software-properties-common  

RUN add-apt-repository ppa:graphics-drivers && apt update

RUN apt install -y ubuntu-drivers-common lshw vainfo va-driver-all libva-dev

RUN apt install -y nvidia-driver-410