FROM python:3.9-slim

LABEL maintainer="dimdasci <dimds@fastmail.com>"

ARG REQUIREMENTS='requirements.txt'

# Create the user
RUN groupadd --gid 1000 dim \
    && useradd --uid 1000 --gid 1000 -m dim

ENV HOME="/home/dim"
USER dim


WORKDIR "${HOME}/work"
ENV PATH="${HOME}/.local/bin:${PATH}"

COPY ${REQUIREMENTS} ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable code_prettify/code_prettify 
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable collapsible_headings/main

CMD jupyter notebook --ip 0.0.0.0 --no-browser