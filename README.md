# Docker with Nvidia 390.67 + Cuda 9.1 + cudnn7 + datascience system libraries


Tested with the following Host :
* Ubuntu 18.04
* Nvidia driver installé = 390.67

No need for cuda on the Host. It will be installed inside the docker image.



# Steps

1. Install nvidia docker 2

Follow those instructions : [https://github.com/NVIDIA/nvidia-docker#quickstart](https://github.com/NVIDIA/nvidia-docker#quickstart)


2. Build l'image docker 

```
sudo docker build --build-arg http_proxy=$http_proxy -t cuda9.1 .
```


3. Execute jupyter within the docker

Let's say :

* your user is `user`
* your home is `/home/user`
* your jupyter path is `/home/user/anaconda3/bin/jupyter`

And that you already created a configuration file for jupyter with the `user` user :

```
jupyter notebook --generate-config
jupyter notebook password
```

Then you can launch it with:

```
sudo docker run -p 4242:8888 -v /etc/passwd:/etc/passwd -v /etc/group:/etc/group -v /etc/shadow:/etc/shadow -v /home/user:/home/user -it cuda9.1 /sbin/runuser -l user -s /bin/bash -c "/home/user/anaconda3/bin/jupyter lab --notebook-dir='/home/user' --config='/home/user/.jupyter/jupyter_notebook_config.py'"
```

Your Jupyter will be accessible from all the local network from `http://your_ip:4242`.


