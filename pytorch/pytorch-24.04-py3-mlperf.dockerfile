FROM nvcr.io/nvidia/pytorch:24.04-py3

RUN pip install "pydantic<=1.10.9"
RUN pip install transformers dmiparser tokenization jmespath botocore s3transfer boto3
RUN apt-get update && apt-get install -y python3-venv
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget
