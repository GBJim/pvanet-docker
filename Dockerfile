FROM ccha97u/pvanet-2

MAINTAINER Chun-Hao, Chang <ccha97u@gmail.com>


RUN cd ~/ \
        && git clone https://github.com/GBJim/Object-Detection.git \
        && cd Object-Detection \
        && pip install --editable . \
        && ln -s /root/pva-faster-rcnn pvanet \
        && ln /dev/null /dev/raw1394 \
        && apt-get install lsof

WORKDIR /root 
	
	
	 
 	
 	
	
