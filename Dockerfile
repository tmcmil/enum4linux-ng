FROM python:3.8-alpine

RUN apk upgrade
RUN apk --update add --no-cache openssl-dev libffi-dev py3-pip python3 samba-client samba-common-tools yaml-dev
RUN apk --update add --virtual build-dependencies build-base git \
  && git clone https://github.com/cddmp/enum4linux-ng.git \
  && pip install -r enum4linux-ng/requirements.txt \
  && apk del build-dependencies
WORKDIR enum4linux-ng
ENTRYPOINT ["python", "enum4linux-ng.py"]
