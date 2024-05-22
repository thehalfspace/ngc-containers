FROM nvcr.io/nvidia/pytorch:24.04-py3

ENV CM_REPOS=/tmp/CM

RUN python -m pip install cmind
RUN pip install "pydantic<=1.10.9"
RUN pip install transformers dmiparser tokenization jmespath botocore s3transfer boto3
RUN cm pull repo mlcommons@ck
