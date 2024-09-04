FROM nvcr.io/nvidia/pytorch:24.04-py3

RUN apt-get update && apt-get install -y python3-venv
RUN apt-get install -y wget

RUN pip install "pydantic<=1.10.9" transformers dmiparser tokenization jmespath botocore s3transfer boto3
RUN pip install git+https://github.com/NVIDIA/mitten.git

ENV CM_REPOS="/CM"
RUN python -m pip install cmind
RUN python -m pip install --upgrade pip
RUN cm pull repo mlcommons@cm4mlops


COPY TensorRT-10.1.0.27.Linux.x86_64-gnu.cuda-12.4.tar.gz /.
COPY TensorRT-10.1.0.27.Ubuntu-22.04.aarch64-gnu.cuda-12.4.tar.gz /.

ENV TENSORRT_FILE_ARM="/TensorRT-10.1.0.27.Ubuntu-22.04.aarch64-gnu.cuda-12.4.tar.gz"
ENV TENSORRT_FILE_x86="/TensorRT-10.1.0.27.Linux.x86_64-gnu.cuda-12.4.tar.gz"
