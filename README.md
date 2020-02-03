Install clingo with Python, and the clyngor helper library.
Example usage sample.lp

# Docker Hub
```
docker pull sjkillen/clyngor
```

# Building Image

```
docker build -t clyngor .
docker run -it --name clyngor --net=host -v"$PWD":/src clyngor
cd src
clingo sample.lp
```

Restart container
```
docker start clyngor
docker attach clyngor
```
