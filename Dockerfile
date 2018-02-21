FROM kaixhin/cuda-caffe:7.5

MAINTAINER Chun-Hao, Chang <ccha97u@gmail.com>


RUN cd ~/ \
	&& git clone  --recursive https://github.com/GBJim/pvanet.git \
	&& cd pva-faster-rcnn/ \
 	&& git fetch gb tracking \
        && git checkout tracking \ 
	&& sh models/download_production_model.sh \
	&& cp Makefile.config caffe-fast-rcnn/ \
	&& cd lib/  \
        && make \
        && cd ../ainvr && pip install -e . \
	&& cd ../caffe-fast-rcnn \
 	&& make -j8 && make pycaffe \
	&& pip install easydict \
	&& apt-get -y install python-opencv \
	&& apt-get -y install python-tk 

WORKDIR /root	
	
	 
 	
 	
	
