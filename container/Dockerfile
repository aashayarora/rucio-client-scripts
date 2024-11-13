FROM python:3.9.20-alpine

RUN python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir --upgrade setuptools && \
    python3 -m pip install --no-cache-dir --pre rucio-clients && \
    python3 -m pip install --no-cache-dir jinja2 j2cli pyyaml && \
    python3 -m pip install --no-cache-dir tqdm

COPY rucio.cfg /opt/rucio/etc/rucio.cfg 
COPY init-rse /home/
COPY add-rule /home/

COPY cancel_all_fts_jobs.sh /home/cancel_all_fts_jobs.sh

COPY gfal/ /home/gfal/