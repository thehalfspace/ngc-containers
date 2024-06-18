FROM nvcr.io/nvidia/tensorflow:24.05-tf2-py3

ENV CM_REPOS=/tmp/CM
RUN python -m pip install cmind
RUN cm pull repo mlcommons@ck
RUN pip install "pydantic<=1.10.9"
RUN pip install "protobuf<=4.23.4"
RUN pip install kiwisolver fonttools cycler contourpy matplotlib pycocotools transformers
RUN pip install dmiparser tabulate opencv-python-headless opencv-python pybind11

#RUN apt-get update && apt-get install -y python3-venv
#ENV CM_REPOS=""
