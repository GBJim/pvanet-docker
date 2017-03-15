#This is a Dockerfile that builds a docker image of [PVANET](https://github.com/sanghoon/pva-faster-rcnn)

##The current version supports CUDA7.5. If you are using Pascal GPU Architecture(1080,1060, and 1050), please modify the Dockerfile repectively.

##Build the image:
1.Clone this repository
```Shell
git clone https://github.com/GBJim/pvanet-docker.git
```Shell

2.Build the image with nvidia-docker
```Shell
cd pvanet-docker
nvidia-docker build -t <IMAGE_NAME_YOU_LIKE> .
```

##Run the demo:
1.Move to the pvanet directory
```Shell 
cd pva-faster-rcnn/
```

2.Run the demo.py
```Shell 
python tools.py
```

3.Run the demo.py with the PVANET-lite nework.
```Shell
python tools.py --lite
```


