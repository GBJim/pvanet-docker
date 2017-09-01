# This is a Dockerfile that builds a docker image of [PVANET](https://github.com/sanghoon/pva-faster-rcnn)

## This image can only be built inside the IronYun domain, otherwise the caffemodel for PVANET will be missing

## Build the image:
1.Clone this repository
```Shell
git clone https://github.com/GBJim/pvanet-docker.git
```

2.Build the image with nvidia-docker
```Shell
cd pvanet-docker
nvidia-docker build -t <IMAGE_NAME_YOU_LIKE> .
```

## Run the demo:
1.Start the image with nvidia-docker
```Shell 
nvidia-docker run -ti <IMAGE_NAME_YOU_LIKE>
```

2.Once you are attached to the image, move to the pvanet directory
```Shell 
cd ~/pva-faster-rcnn/
```

3.Run the demo.py
```Shell 
python tools/demo.py
```
The output will be in JSON format. A list containing info of multiple objects, each object also contains the information of subordinate object class
```json 
[
{'ymax': 156.07154846191406, 'score': 0.84535301, 'xmax': 183.18292236328125, 'xmin': 133.978515625, 'ymin': 111.8216781616211, 'class': u'person', 'sub': {'score': 0.84535301, 'class': 'sedan/SUV'}}, 

{'ymax': 301.84246826171875, 'score': 0.99305266, 'xmax': 426.51141357421875, 'xmin': 89.23002624511719, 'ymin': 44.30303955078125, 'class': u'bus', 'sub': {'score': 0.99305266, 'class': 'van'}}
]
```

4.If you want to run the demo.py with a specific GPU.
```Shell
python tools/demo.py --gpu 1
```


