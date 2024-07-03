FROM nvcr.io/nvidia/tensorflow:24.05-tf2-py3

#ENV PYTHONUNBUFFERED=1
ENV PATH=/myenv/python/bin:$PATH
ENV PYTHONUSERBASE=/myenv/python

RUN mkdir -p /myenv/python

RUN apt-get update && apt-get install -y python3-venv

RUN python3 -m pip install --upgrade pip
RUN pip install "pydantic<=1.10.9" "protobuf<=4.23.4" kiwisolver \
    fonttools cycler contourpy matplotlib pycocotools transformers \
    dmiparser tabulate opencv-python-headless opencv-python pybind11 \
    mlcommons-loadgen --user

ENV CM_REPOS=/myenv/CM
RUN python -m pip install cmind --user
RUN cm pull repo mlcommons@cm4mlops
RUN chmod -R a+w /myenv
RUN chmod -R a+w /myenv/python
RUN chmod -R a+w /myenv/CM

RUN git clone --recurse-submodules https://github.com/mlcommons/inference.git --depth 1


ENV PYTHONUSERBASE=""
ENV CM_MLPERF_INFERENCE_SOURCE="/tmp/inference"
ENV CM_MLPERF_INFERENCE_VISION_PATH="/tmp/inference/vision"
ENV PYTHONPATH="/tmp/myenv/python"
ENV PYTHONUSERBASE="/tmp/myenv/python"
ENV CM_REPOS="/tmp/CM"
#ENTRYPOINT ["/myenv/python/bin/python"]






#RUN pip install "pydantic<=1.10.9"
#RUN pip install "protobuf<=4.23.4"
#RUN pip install kiwisolver fonttools cycler contourpy matplotlib pycocotools transformers
#RUN pip install dmiparser tabulate opencv-python-headless opencv-python pybind11
#RUN pip uninstall mlcommons-loadgen

#ENV CM_REPOS=/CM
#RUN python -m pip install cmind
#RUN cm pull repo mlcommons@cm4mlops
#ENV CM_REPOS=""
