FROM siwatinc/nodejsubuntu_base_image

RUN apt update && apt install -y software-properties-common

RUN add-apt-repository ppa:graphics-drivers && apt update

RUN npm install -g h265ize

RUN apt install -y ubuntu-drivers-common lshw vainfo va-driver-all libva-dev

RUN apt-get update && apt install -y nvidia-driver-410

COPY root/etc/cont-init.d/11-nvidia-fix /etc/cont-init.d/

RUN chmod a+x /etc/cont-init.d/11-nvidia-fix

COPY patch.sh /patch.sh

RUN chmod a+x /patch.sh

RUN /patch.sh 410.78

CMD script --return -c "h265ize -v $extraarg -m '$preset' -d $output -q $qp -f '$format' $input" /dev/null
