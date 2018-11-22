FROM linuxserver/plex:latest

RUN apt update && apt install -y software-properties-common  

RUN add-apt-repository ppa:graphics-drivers && apt update

RUN apt install -y ubuntu-drivers-common lshw vainfo va-driver-all libva-dev

RUN apt install -y nvidia-driver-410

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb &&  dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub && apt-get update && apt-get install -y cuda
