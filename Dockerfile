FROM gcr.io/panoptes-exp/panoptes-pocs:developer

COPY . "${HOME}"

RUN /var/panoptes/conda/bin/pip install --no-cache --upgrade pip && \
    /var/panoptes/conda/bin/pip install --no-cache \
     notebook==5.* \
     jupyterlab \
     jupyter-panel-proxy && \
    cd "${HOME}" && \
    /var/panoptes/conda/bin/pip install -r requirements.txt

# mybinder wants us to accept these but we ignore for now.
ARG NB_USER
ARG NB_UID

WORKDIR "${HOME}"
USER panoptes

ENTRYPOINT []
