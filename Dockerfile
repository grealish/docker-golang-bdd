FROM google/golang
MAINTAINER dev.grealish@gmail.com

# Docker file for setting up a GoLang BDD testing suite for Ginkgo
# this can be used as a base image for building test containers 

ADD go-build /bin/go-build
ADD go-run /bin/go-run

ONBUILD ADD . /gopath/src/app/
ONBUILD RUN /bin/go-build

# we install dependanceis to get started
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN apt-get update && apt-get install -y open

# install golang dev tools
RUN apt-get install -y vim vim-co

RUN adduser -d /home/godevuser --group sudo -m godevuser 
# backup command chpasswd godevuser:dodevpass 
RUN echo godevpass | passwd godevuser --stdin

# setup access
EXPOSE 22
EXPOSE 8080
CMD[]
ENTRYPOINT [&quot;/bin/go-run&quot;]

USER godevuser

WORKDIR /gopath

RUN go get github.com/onsi/ginkgo/ginkgo  # installs the ginkgo CLI
RUN go get github.com/onsi/gomega         # fetches the matcher library

