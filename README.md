
### Steps:

```sh
# Build docker image on your local machine
docker build --no-cache -f tensorflow-24.05-tf2-py3-mlperf.dockerfile . -t prithworms/tensorflow-24.05-tf2-py3-mlperf:v1.1

# Push to dockerhub
docker push prithworms/tensorflow-24.05-tf2-py3-mlperf:v1.1


# On oscar, pull the image from **login node** (login009 or login010)
apptainer pull --arch=x86_64 tensorflow-24.05-tf2-py3-mlperf docker://prithworms/tensorflow-24.05-tf2-py3-mlperf:v1.1

```
