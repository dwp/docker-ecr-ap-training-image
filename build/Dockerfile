FROM continuumio/miniconda3:latest
COPY environment.yml .
RUN conda env create -f environment.yml
COPY build/tetrain.py .
ENTRYPOINT ["python", "tetrain.py"]