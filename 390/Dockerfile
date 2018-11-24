FROM bassrock/plex-nvidia-docker:base

#This doesnt work for some reason.

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.1.85-1_amd64.deb &&  dpkg -i cuda-repo-ubuntu1604_9.1.85-1_amd64.deb && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub && apt-get update && apt-get install -y cuda-9.1

RUN apt purge -y nvidia*

RUN apt install -y nvidia-driver-390

RUN apt install -y nvidia-cuda-toolkit