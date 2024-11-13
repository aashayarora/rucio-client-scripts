FROM almalinux:9

RUN dnf -y install yum-utils epel-release.noarch && \
    dnf upgrade -y && \
    yum-config-manager --enable crb && \
    dnf install -y \
        gfal2-all \
        gfal2-util \
        python3-gfal2 \
        python3-pip \
        nordugrid-arc-client \
        nordugrid-arc-plugins-gfal \
        nordugrid-arc-plugins-globus \
        nordugrid-arc-plugins-s3 \
        nordugrid-arc-plugins-xrootd \
        voms-clients-java \
        xrootd-client

RUN yum install -y https://repo.opensciencegrid.org/osg/3.6/osg-3.6-el9-release-latest.rpm && \
      yum install -y osg-ca-certs && \
      yum install -y fetch-crl && \
      yum clean all && \
      rm -rf /var/cache/yum

# Upgrade pip & setuptools and install Rucio
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