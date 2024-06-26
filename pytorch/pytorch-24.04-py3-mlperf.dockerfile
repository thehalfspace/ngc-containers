FROM nvcr.io/nvidia/pytorch:24.04-py3

RUN pip install "pydantic<=1.10.9"
RUN pip install transformers dmiparser tokenization jmespath botocore s3transfer boto3
RUN pip install git+https://github.com/NVIDIA/mitten.git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget

ENV CM_REPOS=/CM
RUN python -m pip install cmind
RUN cm pull repo mlcommons@mlops4cm
ENV CM_REPOS=""

# Change the pip and sudo permissions inside repo
RUN sed -i -e 's/pip install/pip install --user/g' /CM/repos/mlcommons@cm4mlops/script/get-generic-python-lib/install.sh
RUN sed -i -e 's/sudo//g' /CM/repos/mlcommons@cm4mlops/script/get-generic-sys-util/_cm.json
