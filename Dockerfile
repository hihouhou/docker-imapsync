#
# Imapsync Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV IMAPSYNC_VERSION imapsync-1.882

# Update & install packages for imapsync dep
RUN apt-get update && \
    apt-get install -y git libjson-webtoken-perl libauthen-ntlm-perl libcgi-pm-perl libcrypt-openssl-rsa-perl libdata-uniqid-perl libfile-copy-recursive-perl libio-socket-inet6-perl libio-socket-ssl-perl libio-tee-perl libhtml-parser-perl libjson-webtoken-perl libmail-imapclient-perl libparse-recdescent-perl libmodule-scandeps-perl libreadonly-perl libregexp-common-perl libsys-meminfo-perl libterm-readkey-perl libtest-mockobject-perl libtest-pod-perl libunicode-string-perl liburi-perl libwww-perl libtest-nowarnings-perl libtest-deep-perl libtest-warn-perl make cpanminus wget libpar-packer-perl lsb-release libtest-requires-perl libtest-fatal-perl libtest-mock-guard-perl libdist-checkconflicts-perl

# Get imapsync from github
RUN mkdir /opt/imapsync && \
    cd /opt/imapsync && \
    wget https://api.github.com/repos/imapsync/imapsync/tarball/${IMAPSYNC_VERSION} -O ${IMAPSYNC_VERSION}.tar.gz && \
    tar xf  ${IMAPSYNC_VERSION}.tar.gz --strip-components=1

## Compil'it
WORKDIR /opt/imapsync
RUN make install

CMD ["impasync", "$OPTIONS"]
