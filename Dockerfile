FROM tsungjen/centos-caffe

MAINTAINER Tsung Jen, Hsu <max.hsu@ironyun.com>


RUN cd /home \
	&& git clone  --recursive https://github.com/ShuaiW/pva-faster-rcnn.git \
	&& cd pva-faster-rcnn/ \
  && git remote add gb https://github.com/GBJim/pvanet.git \
 	&& git pull gb production \
	&& sed -i '/BLAS := atlas/c\BLAS := open' Makefile.config\
	&& sed -i '/# BLAS_INCLUDE := \/path\/to\/your\/blas/c\BLAS_INCLUDE := /usr/include/openblas' Makefile.config \
	&& sed -i '/\/usr\/lib\/python2.7\/dist-packages\/numpy\/core\/include/c\/usr/lib64/python2.7/site-packages/numpy/core/include' Makefile.config \
	&& cp Makefile.config caffe-fast-rcnn/ \
	&& sh models/pvanet/download_models.sh \
	&& sh models/pvanet/download_lite_models.sh \
	&& cd lib/  \
  && make \
	&& cd ../caffe-fast-rcnn/ \
 	&& make -j8 && make pycaffe \
	&& pip install easydict opencv-python \
	&& yum -y install tkinter
