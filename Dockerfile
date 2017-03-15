FROM kaixhin/cuda-caffe:7.5

MAINTAINER Chun-Hao, Chang <ccha97u@gmail.com>


RUN cd ~/ \
	&& git clone  --recursive https://github.com/ShuaiW/pva-faster-rcnn.git \
	&& cd pva-faster-rcnn/ \
        && git remote add gb https://github.com/GBJim/pvanet.git \
 	&& git pull gb production \
	&& cp Makefile.config caffe-fast-rcnn/ \
	&& sh models/pvanet/download_models.sh \ 
	&& sh models/pvanet/download_lite_models.sh \
	&& cd lib/  \
        && make \
	&& cd ../caffe-fast-rcnn \
 	&& make -j8 && make pycaffe \
	&& pip install easydict \
	&& apt-get -y install python-opencv \
	&& apt-get -y install python-tk 
	
	
	 
 	
 	
	
