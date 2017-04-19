# This is a Dockerfile that builds a docker image of [PVANET](https://github.com/sanghoon/pva-faster-rcnn)
## This image runs on CUDA8.0, which is not supported by older GPU architecture(Fermi, Kepler, and Maxwell)

## Build the image:
1.Clone this repository
```Shell
git clone -b CityEyes --single-branch https://github.com/GBJim/pvanet-docker.git
```

2.Build the image with nvidia-docker
```Shell
cd pvanet-docker
git 
nvidia-docker build -t <IMAGE_NAME_YOU_LIKE> .
```

## Run the Object Detection CLI:
Start the image with nvidia-docker
```Shell 
nvidia-docker run -ti <IMAGE_NAME_YOU_LIKE>
```
### Once you are in the container, you can do the following operations
1.Start the detection daemon and load the network on GPU
```Shell 
obd start
```
You can also specify lite version of PVANET to load on GPU
```Shell
obd start --net lite
```
The following Messages will prompt
```
Loading Network to GPU
PVANET-full has loaded on GPU
```

2.Detect a given image or a directory containing images
```Shell 
obd run pvanet/data/demo
```
An JSON output from STDOUT like the following. The order of result is sorted based on <b>score</b>, the confidence of the detection, from highest to lowest.
```Json
{
  "000456.jpg": {
    "result": [
      {
        "class": "bus", 
        "score": 0.9999498128890991, 
        "xmax": 424.8134765625, 
        "xmin": 87.7197265625, 
        "ymax": 307.0667724609375, 
        "ymin": 46.511810302734375
      }, 
      {
        "class": "person", 
        "score": 0.95893794298172, 
        "xmax": 172.11151123046875, 
        "xmin": 126.84320068359375, 
        "ymax": 161.1465301513672, 
        "ymin": 118.4142074584961
      }
    ], 
    "time": "0.110"
  }, 
  "000542.jpg": {
    "result": [
      {
        "class": "cat", 
        "score": 0.9999878406524658, 
        "xmax": 499.0, 
        "xmin": 0.0, 
        "ymax": 371.98126220703125, 
        "ymin": 0.0
      }
    ], 
    "time": "0.299"
  }
  }
```

3.To inspect the status of detection daemon
```Shell
obd status
```
The pid and the information of loaded network will be given
```Shell
The server is running with pid: 22
{
  "prototxt": "/root/Object-Detection/pvanet/models/pvanet/full/test.pt", 
  "version": "full", 
  "weights": "/root/Object-Detection/pvanet/models/pvanet/full/test.model"
}
```

4.Stop the detection daemon and unload the model from GPU
```Shell
obd stop
```
The shutdown message will prompt
```Shell
Object Detection server with pid 22 stopped
Memory released from GPU
```


