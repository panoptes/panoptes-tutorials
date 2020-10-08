FROM gcr.io/panoptes-exp/panoptes-utils:develop

COPY . /var/panoptes/panoptes-tutorials

RUN /var/panoptes/conda/bin/pip install --no-cache --upgrade pip && \
    /var/panoptes/conda/bin/pip install --no-cache \
     notebook \
     jupyterlab \
     jupyter-panel-proxy && \
    cd /var/panoptes/panoptes-tutorials && \
    /var/panoptes/conda/bin/pip install -r requirements.txt

# mybinder wants us to accept these but we ignore for now.
ARG NB_USER
ARG NB_UID

WORKDIR /var/panoptes
USER panoptes

ENTRYPOINT []
