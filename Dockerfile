FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install git -y 
WORKDIR /root
RUN git clone http://github.com/PLSysSec/swivel.git
WORKDIR /root/swivel
RUN apt-get install make -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install sudo tzdata wget -y --no-install-recommends
# RUN bash -c "export DEBIAN_FRONTEND=noninteractive make bootstrap || exit 1"
RUN make bootstrap
RUN apt-get install unzip kmod -y
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
RUN ./entrypoint.sh