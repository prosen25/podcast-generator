FROM python:3.11-slim

# Install system deps we need (git) and keep the image small
RUN apt-get update \
  && apt-get install -y --no-install-recommends git \
  && rm -rf /var/lib/apt/lists/*

# Install Python deps via pip (works cleanly on the official python base)
RUN pip install --no-cache-dir PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint and the script executable
RUN chmod +x /entrypoint.sh /usr/bin/feed.py

ENTRYPOINT ["/entrypoint.sh"]