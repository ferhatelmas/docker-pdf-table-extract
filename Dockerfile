FROM python:2-slim
MAINTAINER elmas.ferhat@gmail.com

RUN apt-get update && apt-get install -y gcc curl unzip poppler-utils

RUN curl -L https://github.com/ferhatelmas/pdf-table-extract/archive/master.zip -o master.zip && \
    unzip master.zip && \
    cd pdf-table-extract-master && \
    python2 setup.py install && \
    apt-get purge -y --auto-remove gcc curl unzip

ADD pdf_table_extract.py /pdf_table_extract.py

RUN useradd -ms /bin/bash worker
USER worker

VOLUME ["/tmp"]
