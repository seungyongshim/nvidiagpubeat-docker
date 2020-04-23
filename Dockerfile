FROM nvidia/cuda:10.0-runtime-ubuntu18.04

RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:longsleep/golang-backports 
RUN apt-get -y install git
RUN apt-get -y install golang-go
RUN apt-get -y install --no-install-recommends apt-utils
RUN apt-get -y update
RUN apt-get -y upgrade

RUN mkdir -p /go/beats_dev
ENV WORKSPACE "/go/beats_dev"
RUN echo ${WORKSPACE}

ENV GOPATH ${WORKSPACE}
RUN echo ${GOPATH}
ENV PATH ${GOPATH}/bin:/usr/local/go/bin:$PATH

WORKDIR ${WORKSPACE}
RUN pwd

# Git Clone Libbeat 7.3
RUN git clone https://github.com/elastic/beats ${WORKSPACE}/src/github.com/elastic/beats --branch 7.3

# #Clone nvidiagpubeat 7.3
RUN mkdir -p ${WORKSPACE}/src/github.com/ebay/
WORKDIR ${WORKSPACE}/src/github.com/ebay/
RUN git clone https://github.com/eBay/nvidiagpubeat.git --branch withBeats7.3
# RUN chmod 777 -R ${WORKSPACE}

# # Set Configuation nvidiagpubeat.yml file
COPY ./nvidiagpubeat.yml ${WORKSPACE}/nvidiagpubeat.yml
COPY ./run_NvidiaGPUBeat.sh  ${WORKSPACE}/run_NvidiaGPUBeat.sh

# Set & Run CMD
CMD bash ${WORKSPACE}/run_NvidiaGPUBeat.sh