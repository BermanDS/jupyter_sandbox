FROM jupyter/pyspark-notebook:python-3.8.8

WORKDIR /home/jovyan/work

RUN pip install --upgrade pip
EXPOSE 9999 4040