# This is a Dockerfile that builds a docker image of [PVANET](https://github.com/sanghoon/pva-faster-rcnn)


## This image can only be built inside the IronYun domain, otherwise the caffemodel for PVANET will be missing
### To install a host mahcine for this docker image, please refer to [this](https://gist.github.com/GBJim/aff22d6f99746ab8f272c9f6100d0ea9)

## Build the image:
1.Clone this repository and switch to production branch
```Shell
git clone -b tracking http://172.16.15.205/ainvr/pvanet-docker.git
```

2.Build the image with nvidia-docker
```Shell
cd pvanet-docker
nvidia-docker build -t <IMAGE_NAME_YOU_LIKE> .
```

## Run the demo:
1.Start the image with nvidia-docker
```Shell 
nvidia-docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw -ti <IMAGE_NAME_YOU_LIKE>
```

2.Once you are attached to the image, move to the pvanet directory
```Shell 
cd ~/pvanet/
```

3.Run the demo.py
```Shell 
python tools/demo.py
```
You should see the visualization of the tracking result

