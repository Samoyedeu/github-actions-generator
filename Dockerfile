# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.10 \
#     python3-pip \
#     git

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
 && rm -rf /var/lib/apt/lists/*

RUN python3.10 -m pip install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]