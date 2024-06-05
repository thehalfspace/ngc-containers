FROM nvcr.io/nvidia/pytorch:24.04-py3

ENV CM_REPOS=/CM
RUN pip install "pydantic<=1.10.9"
RUN pip install transformers dmiparser tokenization jmespath botocore s3transfer boto3

RUN cm pull repo mlcommons@mlops4cm

RUN apt-get update && apt-get install -y python3-venv
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget
RUN cmr run script
ENV CM_REPOS=""

## 1.  mount the scratch location, and cp the CM from docker to scratch
## 2. mount CM to /tmp, 
