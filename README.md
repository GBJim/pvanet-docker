# This is a Dockerfile that builds a docker image of [PVANET](https://github.com/sanghoon/pva-faster-rcnn)

## The current version supports CUDA7.5. If you are using Pascal GPU Architecture(1080,1060, and 1050), please modify the Dockerfile repectively.

## Build the image:
1.Clone this repository
```Shell
git clone -b CityEyes --single-branch https://github.com/GBJim/pvanet-docker.git
```

2.Build the image with nvidia-docker
```Shell
cd pvanet-docker
nvidia-docker build -t <IMAGE_NAME_YOU_LIKE> .
```

## Run the Object Detection CLI:
Start the image with nvidia-docker
```Shell 
nvidia-docker run -ti <IMAGE_NAME_YOU_LIKE>
```
###Once you are in the container, you can do the following operations
1.Start the detection daemon and load the network on GPU
```Shell 
obd start
```
You can also specify lite version of PVANET to load on GPU
```Shell
obd start --net lite
```

2.Detect a given image or a directory containing images
```Shell 
obd run pvanet/data/demo
```

3.To inspect the status of detection daemon
```Shell
obd status
```

4.Stop the detection daemon and unload the model from GPU
```Shell
obd stop
```

