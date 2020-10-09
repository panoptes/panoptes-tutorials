FROM gcr.io/panoptes-exp/panoptes-pocs:developer

# mybinder wants us to accept these but we ignore for now.
ARG NB_USER=panoptes
ARG NB_UID=1000

COPY . ${HOME}
RUN /var/panoptes/conda/bin/pip install --no-cache \
     notebook==5.* \
     jupyterlab \
     jupyter-panel-proxy && \
    cd "${HOME}" && \
    /var/panoptes/conda/bin/pip install -r "${HOME}/requirements.txt" && \
    chown -R ${NB_UID} ${HOME}

USER panoptes

ENTRYPOINT []
