FROM jupyter/pyspark-notebook:python-3.8.8

USER root
RUN apt-get update && apt-get install --yes cron

# Switch back to Jupyter user
USER $NB_USER

RUN fix-permissions $CONDA_DIR && \
    fix-permissions /var/run && \
    fix-permissions /home/$NB_USER

# Set USER to the env variable jupyter uses for the default account
ENV USER=$NB_USER

RUN jupyter labextension install jupyterlab_scheduler
#RUN echo "conda activate ${conda_env}" >> "${HOME}/.bashrc"

WORKDIR /home/jovyan/work

RUN pip install --upgrade pip
EXPOSE 9999 4040