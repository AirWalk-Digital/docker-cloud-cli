FROM alpine:3.11
ARG TGVER=0.21.11

RUN apk --no-cache update && \
    apk --no-cache add bash terraform python py-pip py-setuptools ca-certificates curl less libc6-compat && \
    pip --no-cache-dir install awscli && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
    pip --no-cache-dir install -U pip && \
    pip --no-cache-dir install azure-cli && \
    rm -rf /var/cache/apk/* && \
    apk del --purge build && \
    wget -q -O /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v$TGVER/terragrunt_linux_amd64 && \
    chmod +x /bin/terragrunt

RUN mkdir /modules && mkdir /cloud
WORKDIR /cloud

#ENTRYPOINT [ "aws" ]    
