
### Steps:

### Multi-platform docker builds
```sh
# Do this step only once
docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder
docker buildx inspect --bootstrap

# Build and push image
docker buildx build --platform=linux/amd64,linux/arm64 -f pytorch-24.04-py3-mlperf.dockerfile . -t prithworms/pytorch-24.04-py3-mlperf:v1.0 --push

# On oscar, pull the image from **login node** (login009 or login010)
# Two architectures: arm64 and amd64
apptainer pull --arch=amd64 tensorflow-24.05-tf2-py3-mlperf docker://prithworms/tensorflow-24.05-tf2-py3-mlperf:v1.1

```

### Other useful docker commands
```sh
# Clear build cache
docker builder prune

# Check container and cache sizes
docker system df
```
