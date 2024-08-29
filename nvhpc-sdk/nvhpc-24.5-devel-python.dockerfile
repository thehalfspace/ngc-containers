FROM nvcr.io/nvidia/nvhpc:24.5-devel-cuda_multi-ubuntu22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.11 \
    python3-pip \
    && \
    apt-get clean

RUN ln -s /usr/bin/python3 /usr/bin/python
RUN apt-get update && apt-get install -y python3-venv
RUN python -m pip install --upgrade pip
