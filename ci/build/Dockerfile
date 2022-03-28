FROM continuumio/miniconda3:latest

ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY


RUN apt-get update
RUN apt-get -y install gcc curl unzip
RUN conda config --set ssl_verify no ###


COPY environment_t.yml .
RUN conda update conda
RUN conda env create -f environment_t.yml

RUN mkdir -p /opt/ml/models
RUN chmod +rwx /opt/ml/models
RUN mkdir -p /opt/ml/code
RUN chmod +rwx /opt/ml/code
RUN mkdir -p /opt/ml/config
RUN chmod +rwx /opt/ml/config

ARG TRAINING_SCRIPT_LOCATION
ENV ARG_TRAINING_SCRIPT_LOCATION = $TRAINING_SCRIPT_LOCATION

ENV SM_INPUT /opt/ml/input
ENV SM_INPUT_CONFIG_DIR=$SM_INPUT/config
ENV SM_INPUT_TRAINING_CONFIG_FILE=$SM_INPUT/config/hyperparameters.json
ENV SM_INPUT_DATA_CONFIG_FILE=$SM_INPUT/config/inputdataconfig.json
ENV SM_CHECKPOINT_CONFIG_FILE=$SM_INPUT/config/checkpointconfig.json


RUN mkdir -p $SM_INPUT_CONFIG_DIR
RUN touch $SM_INPUT_DATA_CONFIG_FILE


# Set SageMaker serving environment variables
ENV SM_MODEL_DIR /opt/ml/model
ENV SM_CHANNEL_TRAINING='/opt/ml/input/data/training'
ENV SM_CHANNEL_TESTING='/opt/ml/input/data/testing'

ENV SM_LOG_LEVEL=20
EXPOSE 8080
ENV TEMP=/home/model-server/tmp
LABEL com.amazonaws.sagemaker.capabilities.accept-bind-to-port=true

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=UTF-8
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

COPY entrypoint.sh .
ENTRYPOINT ["bin/bash","entrypoint.sh"]

ENV SAGEMAKER_PROGRAM /opt/ml/code/tetrain.py
