FROM nvcr.io/nvidia/tensorflow:24.05-tf2-py3

RUN apt-get update && apt-get install -y python3-venv

RUN python -m pip install --upgrade pip
RUN pip install "pydantic<=1.10.9" "protobuf<=4.23.4" kiwisolver \
    fonttools cycler contourpy matplotlib pycocotools transformers \
    dmiparser tabulate opencv-python-headless opencv-python pybind11
RUN python -m pip install cmind
RUN python -m pip install --upgrade pip

ENV CM_REPOS="/CM"
RUN cm pull repo mlcommons@cm4mlops

RUN git clone --recurse-submodules https://github.com/mlcommons/inference.git /inference --depth 5
