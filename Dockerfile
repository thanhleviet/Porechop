FROM debian:sid-slim
LABEL authors="Thanh Le Viet thanh.le-viet@quadram.ac.uk" \
      description="Docker image for Porechop"

RUN apt-get update \
    && apt-get install -y wget g++ git  python3-pip python3-dev \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && cd /usr/local/bin \
    && ln -s /usr/bin/python3 python \
    && pip3 install --upgrade pip

RUN echo pwd #dummy step
RUN cd /opt \
    && git clone https://github.com/thanhleviet/Porechop \
    && cd Porechop \
    && pip install -r requirements.txt --no-clean \
    && python setup.py install \
    && porechop --help

WORKDIR /data
