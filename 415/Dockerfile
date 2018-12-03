FROM bassrock/plex-nvidia-docker:base

RUN apt install -y nvidia-driver-415

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb &&  dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb && apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub && apt-get update && apt-get install -y cuda

RUN apt install -y nvidia-cuda-toolkit

RUN git clone https://github.com/keylase/nvidia-patch.git && cd nvidia-patch && chmod a+x patch.sh && ./patch.sh && cd ../ && rm -rf nvidia-patch