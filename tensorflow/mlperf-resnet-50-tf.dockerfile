FROM nvcr.io/nvidia/tensorflow:24.05-tf2-py3

RUN apt-get update && apt-get install -y python3-venv

RUN python -m pip install --upgrade pip
RUN pip install "pydantic<=1.10.9" "protobuf<=4.23.4" kiwisolver \
    fonttools cycler contourpy matplotlib pycocotools transformers \
    dmiparser tabulate opencv-python-headless opencv-python pybind11
RUN python -m pip install cmind

ENV CM_REPOS="/CM"
RUN cm pull repo mlcommons@cm4mlops

# Change the pip and sudo permissions inside repo
RUN sed -i -e 's/CM/tmp\/CM/g' /CM/index.json
RUN sed -i -e 's/CM/tmp\/CM/g' /CM/repos.json


RUN git clone --recurse-submodules https://github.com/mlcommons/inference.git /inference --depth 5

ENV CM_REPOS="/tmp/CM"
ENV PYTHONUSERBASE="/tmp/pyenv"
