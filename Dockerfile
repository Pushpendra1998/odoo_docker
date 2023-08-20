# FROM debian:bullseye-slim
FROM python:3.10-bullseye


SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# # Install Odoo
ENV ODOO_VERSION 16.0

RUN apt-get update \
    && apt-get install -y \
        libsasl2-dev \
        python-dev \
        libldap2-dev \
        libssl-dev \
        wkhtmltopdf \
        node-less \
        npm

RUN curl https://raw.githubusercontent.com/odoo/odoo/${ODOO_VERSION}/requirements.txt > /tmp/requirements.txt && \
    pip install -r /tmp/requirements.txt

# Install rtlcss
RUN npm install -g rtlcss

RUN pip install debugpy

RUN mkdir -p /home/odoo \
    && chown -R root /home/odoo

# Expose Odoo services
EXPOSE 5678 8069

# Set default user when running the container
USER root
